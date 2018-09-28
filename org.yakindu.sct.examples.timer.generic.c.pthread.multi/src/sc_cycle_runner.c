/*
 * sc_cycle_runner.c
 *
 *  Created on: 28.09.2018
 *      Author: herrmann
 */

#include "sc_cycle_runner.h"

/*!
 * POSIX thread that periodically runs the SCT's internal 'run to completion'.
 * (State machine evaluates rising events and computes possible state changes)
 */
static void *sc_cycle_runner_thread(void *arg) {
	sc_cycle_runner_t *runner = (sc_cycle_runner_t *) arg;
	while (1) {
		usleep(runner->interval_ms * 1000);
		runner->connection->sm_runCycle(runner->connection->sm_handle);
	}
	return NULL;
}

void sc_cycle_runner_init(sc_cycle_runner_service_t* this,
		sc_cycle_runner_t *cycle_runners, sc_integer count,
		pthread_mutex_t *event_mutex) {
	this->runners = cycle_runners;
	this->runner_count = count;
	for (int i = 0; i < count; i++) {
		this->runners->service = this;
		this->runners->connection = NULL;
	}
	this->event_mutex = event_mutex;
}

void sc_cycle_runner(struct sc_cr_connection *connection, int cycle_interval_ms) {
	sc_cycle_runner_service_t *this = connection->cr_handle;

	pthread_mutex_lock(&(this->runner_mutex));

	for (int i = 0; i < this->runner_count; i++) {
		if (this->runners[i].connection == NULL) {
			this->runners[i].connection = connection;
			this->runners[i].interval_ms = cycle_interval_ms;
			pthread_create(&(this->runners[i].thread), NULL,
					&sc_cycle_runner_thread, &this->runners[i]);
			break;
		}
	}
	pthread_mutex_unlock(&(this->runner_mutex));
}

void sc_cycle_runner_stop(struct sc_cr_connection* connection) {
	sc_cycle_runner_service_t *this = connection->cr_handle;

	pthread_mutex_lock(&(this->runner_mutex));

	for(int i = 0; i < this->runner_count; i++){
		if(this->runners[i].connection == connection){
			pthread_cancel(this->runners[i].thread);
			pthread_join(this->runners[i].thread, NULL);

			this->runners[i].connection = NULL;

			break;
		}
	}
	pthread_mutex_unlock(&(this->runner_mutex));
}


sc_cycle_runner_methods_t sc_cycle_runner_methods = //
		{ //
		.start = sc_cycle_runner, //
		.stop = sc_cycle_runner_stop
		};//
