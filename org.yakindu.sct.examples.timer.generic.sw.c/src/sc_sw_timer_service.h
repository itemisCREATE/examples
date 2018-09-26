/*
 * sc_timer.h
 *
 *  Created on: 13.04.2016
 *      Author: korsisnki, terfloth
 */

#ifndef SC_TIMER_SERCICE_H_
#define SC_TIMER_SERCICE_H_

#include "../src/sc_types.h"
#include "sc_timer_service.h"

#ifdef __cplusplus
extern "C" {
#endif


struct sc_pthread_timer_service;

typedef struct {
	struct sc_pthread_timer_service *service;
	sc_integer time_ms;
	sc_boolean periodic;
	sc_integer elapsed_time_ms;
	sc_eventid pt_evid;
	sc_ts_connection_t *connection;
} sc_sw_timer_t;


typedef void (*sc_raise_time_event_fp)(void *handle, sc_eventid evid);

typedef struct sc_pthread_timer_service {
	sc_integer timer_count;
	sc_sw_timer_t *timers;
} sc_sw_timer_service_t;


extern void sc_sw_timer_service_init(sc_sw_timer_service_t *this,
		sc_sw_timer_t *timers,
		sc_integer count);

extern void sc_sw_timer_service_proceed(struct sc_ts_connection *connection, const sc_integer time_ms);


//extern void start_timer(struct sc_ts_connection *connection, const sc_eventid evid, const sc_integer time_ms, const sc_boolean periodic);
//
//extern void stop_timer(struct sc_ts_connection *connection,
//	       const sc_eventid evid);



#ifdef __cplusplus
}
#endif


#endif /* SC_TIMER_SERCICE_H_ */
