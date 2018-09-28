/*
 * sc_timer.h
 *
 *  Created on: 13.04.2016
 *      Author: korsisnki, terfloth
 */

#ifndef SC_PTHREAD_TIMER_SERCICE_H_
#define SC_PTHREAD_TIMER_SERCICE_H_

#include <pthread.h>
#include "sc_types.h"
#include "sc_timer_service.h"

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

#ifdef __cplusplus
extern "C" {
#endif

/*! file/ Interface definition of a POSIX thread based timer service for YAKINDU SCT stet machines. */

struct sc_pthread_timer_service;

/* internal arguments of a timer pthread */
typedef struct {
	sc_integer time_ms;
	sc_boolean periodic;
	pthread_t pt;
	sc_eventid pt_evid;
	sc_ts_connection_t *connection;
	struct sc_pthread_timer_service *service;
} sc_pthread_timer_t;


/*! Function pointer type for state machines runCycle function. */
typedef void (*sc_raise_time_event_fp)(void *handle, sc_eventid evid);


typedef struct sc_pthread_timer_service {
	sc_integer timer_count;
	sc_pthread_timer_t *timers;
	pthread_mutex_t timer_mutex;
	pthread_mutex_t *event_mutex;
} sc_pthread_timer_service_t;


/*! Initializes a timer service with a set of timers. */
extern void sc_pthread_timer_service_init(sc_pthread_timer_service_t *this,
		sc_pthread_timer_t *timers,
		sc_integer count,
		pthread_mutex_t *event_mutex);

#ifdef __cplusplus
}
#endif


#endif /* SC_PTHREAD_TIMER_SERCICE_H_ */
