
#ifndef SC_TIMER_SERVICE_H_
#define SC_TIMER_SERVICE_H_


#include "sc_types.h"

#ifdef __cplusplus
extern "C"
{
#endif 

/*! file/ API definition of a generic timer service interface for YAKINDU SCT state machines.
 *
 * A state machine timer service provides an implementation for handling state machine time events
 * based on mostly platform specific timer implementations. This module does NOT contain such a specific implementation
 * but provides definitions for the timer service interface that supports the plug and play use of alternative timer service
 * implementations.
 */


/*! The timer service interface is based on a data structure which is defined later on. */
struct sc_ts_connection;


/*! Function pointer type for for callback function that will be invoked to raise a time event on a state machine when a timer fires.
 * Each state machine that requires a timer service will provide a function implementation of this type.
 *
 * TODO: Should we also use the connection handle instead of the state machine handle here?
 */
typedef void (*sc_time_event_callback_fp)(void *sm_handle, sc_eventid evid);


/*! Function pointer type for for a function that handles staring a timer. Each timer service implementation must provide such a function. */
typedef void (*sc_start_timer_fp) (struct sc_ts_connection *connection,
								  const sc_eventid evid,
								  const sc_integer time_ms,
								  const sc_boolean periodic);


/*! Function pointer type for for a function that handles stopping a timer. Each timer service implementation must provide such a function. */
typedef void (*sc_stop_timer_fp)	 (struct sc_ts_connection *connection,
								  const sc_eventid evid);


typedef struct sc_timer_service_methods {
	sc_start_timer_fp start;
	sc_stop_timer_fp stop;
} sc_timer_service_methods_t;



/*! The timer service interface is a struct type that provides pointers to the start and stop functions of the timer service implementation.
 * The timer service implementation must provide a way to initialize these function pointers on the interface struct. */
typedef struct sc_ts_connection {
	void *ts_handle;
	sc_timer_service_methods_t *ts_methods;

	void *sm_handle;
	sc_time_event_callback_fp sm_callback;
} sc_ts_connection_t;



#endif /* SC_TYPES_H_ */
