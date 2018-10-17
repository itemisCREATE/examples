#include "../src-gen/TimedStatemachineRequired.h"
#include "sc_pthread_timer_service.h"
#include <unistd.h>
#include <pthread.h>
#include <stdio.h>

// Define how many tiemers and runners are needed
#define MAX_TIMER 5

// Create the statemachine
TimedStatemachine statemachine1;

// Create a mutex
static pthread_mutex_t statechart_mutex = PTHREAD_MUTEX_INITIALIZER;

// define timers
sc_pthread_timer_t timers[MAX_TIMER];

// define timer
sc_pthread_timer_service_t timer_service;

extern sc_timer_service_methods_t sc_pthread_timer_service_methods;

// callback for runCycle function
static void runCycle(TimedStatemachine* handle, sc_eventid evid){
	timedStatemachine_runCycle(&statemachine1);
	puts("Called runCycle");
}

// define connection between timer service and statemachine
sc_ts_connection_t ts_connection[] = { //
		{ //
						.ts_handle = &timer_service, //
						.ts_methods = &sc_pthread_timer_service_methods, //
						.sm_handle = &statemachine1, //
						.sm_callback =
								(sc_time_event_callback_fp) timedStatemachine_raiseTimeEvent //
				},//
				{ // this connection will call the runCycle function
						.ts_handle = &timer_service, //
						.ts_methods = &sc_pthread_timer_service_methods, //
						.sm_handle = &statemachine1, //
						.sm_callback = (sc_time_event_callback_fp) runCycle //
				}//
		}; //

int main() {
	puts("Started program");

	// initialize timer service
	sc_pthread_timer_service_init(&timer_service, timers, MAX_TIMER,
			&statechart_mutex);
	puts("Initialized PThread timer service ");

	// initialize statemachine
	timedStatemachine_init(&statemachine1);
	puts("Initialized statemachine");

	// enter statemachine
	timedStatemachine_enter(&statemachine1);
	puts("Entered statemachine");


	// define unique ID for runCycle event
	sc_eventid myEventID =  (sc_eventid) &(statemachine1.timeEvents) ;

	// start thread for cycle runner
	sc_pthread_timer_service_methods.start(&ts_connection[1], myEventID, 200,
			true);
	puts("Activated cycle runner");

	for (;;) {
		// endless loop
		// in and out events can be handled or within the runCycle callback
		// cycle runner calls runCycle periodically and timer will
		// be automatically set and unset
		if(timedStatemachine_isFinal(&statemachine1)){
			sc_pthread_timer_service_methods.stop(&ts_connection[1], myEventID);
		}
		// cycle runner thread can be cancled under any conditions
	}

	return 0;
}

// statemachine callbacks
extern void timedStatemachine_setTimer(TimedStatemachine* handle,
		const sc_eventid evid, const sc_integer time_ms,
		const sc_boolean periodic) {

	// start timer thread
	sc_pthread_timer_service_methods.start(&ts_connection[0], evid, time_ms,
			periodic);
	puts("Set timer");
}

extern void timedStatemachine_unsetTimer(TimedStatemachine* handle,
		const sc_eventid evid) {

	// cancel timer thread
	sc_pthread_timer_service_methods.stop(&ts_connection[0], evid);
	puts("Unset timer");
}
