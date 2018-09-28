/*
 * sc_sw_timer_service.c
 *
 *  Created on: 28.09.2018
 *      Author: herrmann
 */

#include "sc_sw_timer_service.h"

/*! Raises the time event to the specific statemachine.*/
static void raise_timed_event(struct sc_ts_connection *connection,
		const sc_eventid evid) {

	/* call the raise event function with the specific statemachine handle */
	connection->sm_callback(connection->sm_handle, evid);
}

/*! Starts a timer with the specified parameters. */
static void start_timer(struct sc_ts_connection *connection,
		const sc_eventid evid, const sc_integer time_ms,
		const sc_boolean periodic) {

	/* get the timer service handle. */
	sc_sw_timer_service_t *this =
			(sc_sw_timer_service_t *) (connection->ts_handle);

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

			// reset the elapsed time ...
			this->timers[i].elapsed_time_ms = 0;

			break;
		}
	}
}

/*! Cancels a timer for the specified time event. */
static void stop_timer(struct sc_ts_connection *connection,
		const sc_eventid evid) {

	/* get the timer service handle .*/
	sc_sw_timer_service_t *this =
			(sc_sw_timer_service_t *) (connection->ts_handle);

	/* go through all timers ... */
	for (int i = 0; i < this->timer_count; i++) {

		/* ... and find the one which should be stopped. */
		if (this->timers[i].pt_evid == evid) {

			/* resets the timer. */
			this->timers[i].pt_evid = NULL;
			this->timers[i].connection = NULL;
			break;
		}
	}
}

/*! Definition of timer service method table that maps the timer service interface functions to
 * this concrete implementation for callout based timers. */
sc_timer_service_methods_t sc_sw_timer_service_methods = //
		{ //
				.start = start_timer, //
				.stop = stop_timer //
		};//

/*! Initializes a timer service with a set of timers. */
void sc_sw_timer_service_init(sc_sw_timer_service_t *this,
		sc_sw_timer_t *timers, sc_integer count) {

	/* set the timer parameters */
	this->timers = timers;
	this->timer_count = count;

	/* go through all timers ... */
	for (int i = 0; i < count; i++) {

		/* and initialize them */
		this->timers[i].pt_evid = NULL;
		this->timers[i].service = this;
	}
}

/*! Proceed all active timer with x ms. If the elapsed timer is exceed,
 * the related statemachine event will be called  */
void sc_sw_timer_service_proceed(sc_sw_timer_service_t *this,
		const sc_integer time_ms) {
	/* go through all timers ... */
	for (int i = 0; i < this->timer_count; i++) {
		/* ... and process all used. */
		if (this->timers[i].pt_evid != NULL) {

			/* if the elapsed time is smaller than the time to fire ... */
			if (this->timers[i].elapsed_time_ms < this->timers[i].time_ms) {

				/* ... add the passed time to the elapsed time.*/
				this->timers[i].elapsed_time_ms += time_ms;

				/* check if the elapsed time now is bigger than the time to fire ... */
				if (this->timers[i].elapsed_time_ms
						>= this->timers[i].time_ms) {

					/* ... and raise the related time event in the statemachine.*/
					raise_timed_event(this->timers[i].connection,
							this->timers[i].pt_evid);

					/* If the timer is periodic ... */
					if (this->timers[i].periodic) {

						/* ... the time in ms will be subtracted from the elapsed time. */
						this->timers[i].elapsed_time_ms -=
								this->timers[i].time_ms;
					}
				}
			}
		}
	}
}
