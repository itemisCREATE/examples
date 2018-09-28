/*
 * sc_pthread_timer_service.c
 *
 *  Created on: 29.09.2018
 *      Author: herrmann
 */

#include "sc_pthread_timer_service.h"

/*! \file Implementation of YAKINDU SCT timer functionality based on POSIX threads. */


/*! Callback that is called when a timer fires. */
static void sc_timer_fired(sc_pthread_timer_t *timer) {
	pthread_mutex_lock(timer->service->event_mutex);
	timer->connection->sm_callback(timer->connection->sm_handle,timer->pt_evid);
	pthread_mutex_unlock(timer->service->event_mutex);
}


/*! Implementation of a POSIX thread function that provides a state machine timers.
 * These are used for SCT 'after' and 'every' triggers.
 */
static void *sc_timer_thread(void *arguments) {

	sc_pthread_timer_t *timer = (sc_pthread_timer_t *) arguments;

	do {

		usleep(timer->time_ms * 1000);
		sc_timer_fired(timer);

	} while (timer->periodic);

	return NULL;
}


/*! Starts a timer with the specified parameters. */
void start_timer(struct sc_ts_connection *connection, const sc_eventid evid,
		const sc_integer time_ms, const sc_boolean periodic) {

	sc_pthread_timer_service_t *this = (sc_pthread_timer_service_t *) (connection->ts_handle);
	pthread_mutex_lock(&(this->timer_mutex));

	/* go through all timers ... */
	for (int i = 0; i < this->timer_count; i++) {

		/* ... and find an unused one. */
		if (this->timers[i].pt_evid == NULL) {

			/* set timer properties */
			this->timers[i].pt_evid = evid;
			this->timers[i].time_ms = time_ms;
			this->timers[i].periodic = periodic;
			this->timers[i].connection = connection;
			this->timers[i].service = this;

			/* and create a new pthread with these parameters. */
			if (pthread_create(&(this->timers[i].pt), NULL,
					&sc_timer_thread,
					(void*) &(this->timers[i])) == EXIT_FAILURE) {
				printf("ERROR creating thread!!!");
			}
			break;
		}
	}

	pthread_mutex_unlock(&(this->timer_mutex));
}


/*! Cancels a timer for the specified time event. */
void stop_timer(struct sc_ts_connection *connection,
	       const sc_eventid evid) {
	sc_pthread_timer_service_t *this = (sc_pthread_timer_service_t *) (connection->ts_handle);

	pthread_mutex_lock(&(this->timer_mutex));

	for (int i = 0; i < this->timer_count; i++) {
		if (this->timers[i].pt_evid == evid) {
			pthread_cancel(this->timers[i].pt);
			pthread_join(this->timers[i].pt, NULL);

			this->timers[i].pt_evid = NULL;
			this->timers[i].connection = NULL;

			break;
		}
	}
	pthread_mutex_unlock(&(this->timer_mutex));
}

sc_timer_service_methods_t sc_pthread_timer_service_methods =
	{
		.start = start_timer,
		.stop  = stop_timer
	};


/*! Initializes a timer service with a set of timers. */
 void sc_pthread_timer_service_init(sc_pthread_timer_service_t *this,
			sc_pthread_timer_t *timers,
			sc_integer count,
		pthread_mutex_t *event_mutex) {

	 this->timers = timers;
	 this->timer_count = count;
	 for (int i=0; i<count; i++) {
		 this->timers->pt_evid = NULL;
		 this->timers->service = this;
	 }

	 this->event_mutex = event_mutex;

	 pthread_mutex_init(&(this->timer_mutex), NULL);
 }
