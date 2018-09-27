/*
 * sc_cycle_runner.c
 *
 *  Created on: 18.04.2016
 *      Author: korsinski, terfloth
 */

#include "sc_cycle_runner.h"
#include <unistd.h>
#include <pthread.h>

/*!
 * POSIX thread that periodically runs the SCT's internal 'run to completion'.
 * (State machine evaluates rising events and computes possible state changes)
 */
static void *sc_cycle_runner_thread(void *arg) {
	sc_cycle_runner_t *runner = (sc_cycle_runner_t *) arg;
	while (1) {
		usleep(runner->interval_ms* 1000);
//		pthread_mutex_lock(runner->service->event_mutex);
		runner->connection->sm_runCycle(runner->connection->sm_handle);
//		pthread_mutex_unlock(runner->service->event_mutex);
	}
	return NULL;
}

void sc_cycle_runner_init(sc_cycle_runner_service_t* this, sc_cycle_runner_t *cycle_runners, sc_integer count,pthread_mutex_t *event_mutex){
	this->runners = cycle_runners;
	this->runner_count = count;
	for(int i=0; i<count; i++){
		this->runners->service = this;
		this->runners->connection = NULL;
	}
	this->event_mutex = event_mutex;
	//pthread_mutex_init(&(this->runner_mutex), NULL); // done with timer service
}

sc_cycle_runner_methods_t sc_cycle_runner_methods = //
		{ //
		.start =  sc_cycle_runner //
		};//
/*! Start the cycle runner in an new thread. */

void sc_cycle_runner(struct sc_cr_connection *connection, int cycle_interval_ms){
	sc_cycle_runner_service_t *this = connection->cr_handle;

	pthread_mutex_lock(&(this->runner_mutex));

	for(int i = 0; i < this->runner_count; i++){
		if(this->runners[i].connection == NULL){
		this->runners[i].connection = connection;
		this->runners[i].interval_ms = cycle_interval_ms;
		pthread_create(&(this->runners[i].thread), NULL, &sc_cycle_runner_thread, &this->runners[i]);
		break;
		}
	}
	pthread_mutex_unlock(&(this->runner_mutex));
}
