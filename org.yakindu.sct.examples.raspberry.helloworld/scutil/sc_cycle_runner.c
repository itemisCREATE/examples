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
 * POSIX thread that periodically runs the 's internal 'run to completion'.
 * (State machine evaluates rising events and computes possible state changes)
 */
static void *sc_cycle_runner_thread(void *arg) {

	sc_cycle_runner_t *runner = (sc_cycle_runner_t*)arg;
	while (1) {
		usleep(runner->interval_ms * 1000);

		pthread_mutex_lock(runner->mutex);
		runner->runCycle(runner->handle);	//executes everything within a state machine cycle
		pthread_mutex_unlock(runner->mutex);
	}
	return NULL;
}


/*! Start the cycle runner in an new thread. */
 void sc_cycle_runner_start(sc_cycle_runner_t *cycle_runner, sc_run_cycle_fp runCycle, void *handle, int cycle_interval_ms, pthread_mutex_t *mutex) {
	cycle_runner->runCycle = runCycle;
	cycle_runner->handle = handle;
	cycle_runner->interval_ms = cycle_interval_ms;
	cycle_runner->mutex = mutex;

	pthread_create(&(cycle_runner->thread), NULL, sc_cycle_runner_thread, cycle_runner);
}
