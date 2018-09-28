#include "../src-gen/TimedStatemachineRequired.h"
#include "sc_pthread_timer_service.h"
#include <unistd.h>
#include <pthread.h>
#include <stdio.h>
#include "sc_pthread_cycle_runner.h"

// Define how many tiemers and runners are needed
#define MAX_TIMER 5
#define MAX_RUNNER 1

// Create the statemachine
TimedStatemachine statemachine1;

// Create a mutex
static pthread_mutex_t statechart_mutex = PTHREAD_MUTEX_INITIALIZER;

// define timers and cycle runners
sc_pthread_timer_t timers[MAX_TIMER];
sc_pthread_cycle_runner_t cycle_runners[MAX_RUNNER];

// define timer and cycle runner service
sc_pthread_timer_service_t timer_service;
sc_pthread_cycle_runner_service_t cycle_runner_service;

extern sc_cycle_runner_methods_t sc_pthread_cycle_runner_methods;
extern sc_timer_service_methods_t sc_pthread_timer_service_methods;

// define connection between timer service and statemachine
sc_ts_connection_t ts_connection = //
		{ //
				.ts_handle = &timer_service, //
				.ts_methods = &sc_pthread_timer_service_methods, //
				.sm_handle = &statemachine1, //
				.sm_callback =
						(sc_time_event_callback_fp) timedStatemachine_raiseTimeEvent //
		};//

// define connection between cycle runner and statemachine
sc_cr_connection_t sc_cr_connection = //
{//

				.cr_handle = &cycle_runner_service, //
				.sm_handle = &statemachine1, //
				.sm_runCycle = (sc_run_cycle_fp) timedStatemachine_runCycle //

}; //

int main() {
	puts("Started program");

	// initialize timer service
	sc_pthread_timer_service_init(&timer_service, timers, MAX_TIMER,
			&statechart_mutex);
	puts("Initialized PThread timer service ");

	// initialize cycle runner
	sc_cycle_runner_init(&cycle_runner_service, cycle_runners, MAX_RUNNER, &statechart_mutex);
	puts("Initialized PThread cycle runner");

	// initialize statemachine
	timedStatemachine_init(&statemachine1);
	puts("Initialized statemachine");

	// enter statemachine
	timedStatemachine_enter(&statemachine1);
	puts("Entered statemachine");

	// start thread for cycle runner
	sc_pthread_cycle_runner_methods.start(&sc_cr_connection, 100);
	puts("Activated cycle runner");

	for (;;) {
		// endless loop
		// in and out events can be handled
		// cycle runner calls runCycle periodically and timer will
		// be automatically set and unset

		// cycle runner thread can be cancled under any conditions
		if(timedStatemachine_isFinal(&statemachine1)) {
			sc_pthread_cycle_runner_methods.stop(&sc_cr_connection);
		}
	}

	return 0;
}

// statemachine callbacks
extern void timedStatemachine_setTimer(TimedStatemachine* handle,
		const sc_eventid evid, const sc_integer time_ms,
		const sc_boolean periodic) {

	// start timer thread
	sc_pthread_timer_service_methods.start(&ts_connection, evid, time_ms,
			periodic);
	puts("Set timer");
}

extern void timedStatemachine_unsetTimer(TimedStatemachine* handle,
		const sc_eventid evid) {

	// cancel timer thread
	sc_pthread_timer_service_methods.stop(&ts_connection, evid);
	puts("Unset timer");
}
