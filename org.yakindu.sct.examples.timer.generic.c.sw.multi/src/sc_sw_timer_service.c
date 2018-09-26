/*
 * sc_timer_service.c
 *
 *  Created on: 13.04.2016
 *      Author: korsinski, terfloth
 */

#include "sc_sw_timer_service.h"

#include <stdlib.h>
#include <stdio.h>

static void raise_timed_event(struct sc_ts_connection *connection, const sc_eventid evid) {
	connection->sm_callback(connection->sm_handle, evid);
}

/*! Starts a timer with the specified parameters. */
static void start_timer(struct sc_ts_connection *connection, const sc_eventid evid,
		const sc_integer time_ms, const sc_boolean periodic) {

	sc_sw_timer_service_t *this = (sc_sw_timer_service_t *) (connection->ts_handle);

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

	sc_sw_timer_service_t *this = (sc_sw_timer_service_t *) (connection->ts_handle);

	for (int i = 0; i < this->timer_count; i++) {
		if (this->timers[i].pt_evid == evid) {
			this->timers[i].pt_evid = NULL;
			this->timers[i].connection = NULL;
			break;
		}
	}
}


sc_timer_service_methods_t sc_sw_timer_service_methods =
	{
		.start = start_timer,
		.stop  = stop_timer
	};

/*! Initializes a timer service with a set of timers. */
void sc_sw_timer_service_init(sc_sw_timer_service_t *this,
	sc_sw_timer_t *timers,
	sc_integer count) {

	this->timers = timers;
	this->timer_count = count;
	for (int i=0; i<count; i++) {
		this->timers[i].pt_evid = NULL;
		this->timers[i].service = this;
	}
}


void sc_sw_timer_service_proceed(sc_sw_timer_service_t *this, const sc_integer time_ms) {
//	sc_sw_timer_service_t *this = (sc_sw_timer_service_t *) (connection->ts_handle);
	/* go through all timers ... */
	for (int i = 0; i < this->timer_count; i++) {
//		if(connection->sm_handle == this->timers[i].connection->sm_handle) {

		/* ... and process all used. */
		if (this->timers[i].pt_evid != NULL) {

			if (this->timers[i].elapsed_time_ms < this->timers[i].time_ms) {
				this->timers[i].elapsed_time_ms += time_ms;
				if (this->timers[i].elapsed_time_ms >= this->timers[i].time_ms) {
					raise_timed_event(this->timers[i].connection, this->timers[i].pt_evid);
					if (this->timers[i].periodic) {
						this->timers[i].elapsed_time_ms -= this->timers[i].time_ms;
					}
				}
			}
//		}
		}
	}
}






