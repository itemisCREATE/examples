/*
 * sc_cycle_runner.h
 *
 *  Created on: 18.04.2016
 *      Author: korsinski, terfloth
 */

#ifndef SC_CYCLE_RUNNER_H_
#define SC_CYCLE_RUNNER_H_

#include <pthread.h>

#ifdef __cplusplus
extern "C" {
#endif

/*! \file Defines the cycle runner interface for itemis CREATE state machines.
 *  A cycle runner performs a cyclic execution of the state machines runCycle function
 *  with a fixed time interval. The implementation is based on  POSIX threads and makes
 *  use of a mutex for thread synchronization.
 */


/*! Function pointer type for state machines runCycle function. */
typedef void (*sc_run_cycle_fp)(void *handle);


/*! The type definition contains all properties a cycle runner instance requires.
 * Each cycle runner requires its own instance.
 */
typedef struct {
	int interval_ms;
	sc_run_cycle_fp runCycle;
	void *handle;
	pthread_mutex_t *mutex;
	pthread_t thread;
} sc_cycle_runner_t;


/*! Start the cycle runner in an new thread. */
extern void sc_cycle_runner_start(sc_cycle_runner_t *cycle_runner, sc_run_cycle_fp runCycle, void *handle, int cycle_interval_ms, pthread_mutex_t *mutex);

#ifdef __cplusplus
}
#endif


#endif /* SC_CYCLE_RUNNER_H_ */
