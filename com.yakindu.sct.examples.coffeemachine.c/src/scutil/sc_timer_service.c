/*
 * sc_timer_service.c
 *
 *  Created on: 13.04.2016
 *      Author: korsinski, terfloth
 */

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

#include "sc_timer_service.h"

/*! \file Implementation of YAKINDU SCT timer functionality based on POSIX threads. */


/*! Callback that is called when a timer fires. */
static void sc_timer_fired(sc_timer_t *timer) {

	pthread_mutex_lock(timer->service->event_mutex);
	timer->service->raise_event(timer->handle, timer->pt_evid);
	pthread_mutex_unlock(timer->service->event_mutex);
}


/*! Implementation of a POSIX thread function that provides a state machine timers.
 * These are used for SCT 'after' and 'every' triggers.
 */
static void *sc_timer_thread(void *arguments) {

	sc_timer_t *timer = (sc_timer_t *) arguments;

	do {

		usleep(timer->time_ms * 1000);
		sc_timer_fired(timer);

	} while (timer->periodic);

	return NULL;
}


/*! Starts a timer with the specified parameters. */
void sc_timer_start(sc_timer_service_t *this, void* handle, const sc_eventid evid,
		const sc_integer time_ms, const sc_boolean periodic) {


	pthread_mutex_lock(&(this->timer_mutex));

	/* go through all timers ... */
	for (int i = 0; i < this->timer_count; i++) {

		/* ... and find an unused one. */
		if (this->timers[i].pt_evid == NULL) {

			/* set timer properties */
			this->timers[i].pt_evid = evid;
			this->timers[i].time_ms = time_ms;
			this->timers[i].periodic = periodic;
			this->timers[i].handle = handle;
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
void sc_timer_cancel(sc_timer_service_t *this, const sc_eventid evid) {

	pthread_mutex_lock(&(this->timer_mutex));

	int i;

	for (i = 0; i < this->timer_count; i++) {
		if (this->timers[i].pt_evid == evid) {
			pthread_cancel(this->timers[i].pt);
			pthread_join(this->timers[i].pt, NULL);

			this->timers[i].pt_evid = NULL;
			this->timers[i].handle = NULL;

			break;
		}
	}
	pthread_mutex_unlock(&(this->timer_mutex));
}


/*! Initializes a timer service with a set of timers. */
 void sc_timer_service_init(sc_timer_service_t *tservice,
		sc_timer_t *timers,
		sc_integer count,
		sc_raise_time_event_fp raise_event,
		pthread_mutex_t *event_mutex) {

	 tservice->timers = timers;
	 tservice->timer_count = count;
	 for (int i=0; i<count; i++) {
		 tservice->timers->pt_evid = NULL;
		 tservice->timers->service = tservice;
	 }

	 tservice->event_mutex = event_mutex;
	 tservice->raise_event = raise_event;

	 pthread_mutex_init(&(tservice->timer_mutex), NULL);
 }





