/*
 * sc_pthread_cycle_runner.c
 *
 *  Created on: 28.09.2018
 *      Author: herrmann
 */

#include "sc_pthread_cycle_runner.h"

/*! \file Implementation of YAKINDU SCT cycle runner functionality based on POSIX threads. */

/*! POSIX thread that periodically calls the statemachines runCycle function. */
static void *sc_pthread_cycle_runner_thread(void *arg) {
	sc_pthread_cycle_runner_t *runner = (sc_pthread_cycle_runner_t *) arg;
	while (1) {
		usleep(runner->interval_ms * 1000);
		runner->connection->sm_runCycle(runner->connection->sm_handle);
	}
	return NULL;
}

/*! Initializes a cycle runner service with a set of runners. */
void sc_cycle_runner_init(sc_pthread_cycle_runner_service_t* this,
		sc_pthread_cycle_runner_t *cycle_runners, sc_integer count,
		pthread_mutex_t *event_mutex) {

	 /* set the runner parameters */
	this->runners = cycle_runners;
	this->runner_count = count;
	this->event_mutex = event_mutex;

	/* go through all runners ... */
	for (int i = 0; i < count; i++) {

		 /* ... and initialize them */
		this->runners->service = this;
		this->runners->connection = NULL;
	}
}

/*! Starts one cycle runner in an new thread related to the connection. */
void sc_cycle_runner_start(struct sc_cr_connection *connection, int cycle_interval_ms) {
	sc_pthread_cycle_runner_service_t *this = connection->cr_handle;

	pthread_mutex_lock(&(this->runner_mutex));

	/* go through all runners ... */
	for (int i = 0; i < this->runner_count; i++) {

		/* ... and find an unused one. */
		if (this->runners[i].connection == NULL) {

			/* set runner properties. */
			this->runners[i].connection = connection;
			this->runners[i].interval_ms = cycle_interval_ms;

			/* and create a new pthread with these parameters. */
			pthread_create(&(this->runners[i].thread), NULL,
					&sc_pthread_cycle_runner_thread, &this->runners[i]);

			break;
		}
	}
	pthread_mutex_unlock(&(this->runner_mutex));
}

/*! Cancels a runner for the specified connection. */
void sc_cycle_runner_stop(struct sc_cr_connection* connection) {
	sc_pthread_cycle_runner_service_t *this = connection->cr_handle;

	pthread_mutex_lock(&(this->runner_mutex));

	/* go through all timers ... */
	for(int i = 0; i < this->runner_count; i++){

		/* ... and find the one which should be stopped. */
		if(this->runners[i].connection == connection){

			/* cancels the thread. */
			pthread_cancel(this->runners[i].thread);
			pthread_join(this->runners[i].thread, NULL);

			/* resets the runner. */
			this->runners[i].connection = NULL;

			break;
		}
	}
	pthread_mutex_unlock(&(this->runner_mutex));
}

/*! Definition of timer service method table that maps the timer service interface functions to
 * this concrete implementation for callout based runners. */
sc_cycle_runner_methods_t sc_pthread_cycle_runner_methods = //
		{ //
		.start = sc_cycle_runner_start, //
		.stop = sc_cycle_runner_stop
		};//
