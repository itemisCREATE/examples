#include "../src-gen/TimedStatemachineRequired.h"
#include "sc_pthread_timer_service.h"
#include <unistd.h>
#include <pthread.h>
#include <stdio.h>
#include "sc_pthread_cycle_runner.h"

#define MAX_TIMER 5
#define MAX_RUNNER 1

TimedStatemachine statemachine1;
static pthread_mutex_t statechart_mutex = PTHREAD_MUTEX_INITIALIZER;

sc_pthread_timer_t timers[MAX_TIMER];
sc_pthread_cycle_runner_t cycle_runners[MAX_RUNNER];
sc_pthread_timer_service_t timer_service;
sc_pthread_cycle_runner_service_t cycle_runner_service;

extern sc_cycle_runner_methods_t sc_pthread_cycle_runner_methods;
extern sc_timer_service_methods_t sc_pthread_timer_service_methods;
sc_ts_connection_t ts_connection = //
		{ //
				.ts_handle = &timer_service, //
				.ts_methods = &sc_pthread_timer_service_methods, //
				.sm_handle = &statemachine1, //
				.sm_callback =
						(sc_time_event_callback_fp) timedStatemachine_raiseTimeEvent //
		};//

sc_cr_connection_t sc_rc_connection = //
{//

				.cr_handle = &cycle_runner_service, //
				.sm_handle = &statemachine1, //
				.sm_runCycle = (sc_run_cycle_fp) timedStatemachine_runCycle //

}; //

int main() {
	puts("Started program");
	sc_pthread_timer_service_init(&timer_service, timers, MAX_TIMER,
			&statechart_mutex);
	puts("Initialized PThread timer service ");
	sc_cycle_runner_init(&cycle_runner_service, cycle_runners, MAX_RUNNER, &statechart_mutex);
	puts("Initialized PThread cycle runner");
	timedStatemachine_init(&statemachine1);
	puts("Initialized statemachine");
	timedStatemachine_enter(&statemachine1);
	puts("Entered statemachine");
	sc_pthread_cycle_runner_methods.start(&sc_rc_connection, 100);
	puts("Activated cycle runner");
	for (;;) {
		// Endless loop
	}

	return 0;
}

extern void timedStatemachine_setTimer(TimedStatemachine* handle,
		const sc_eventid evid, const sc_integer time_ms,
		const sc_boolean periodic) {
	sc_pthread_timer_service_methods.start(&ts_connection, evid, time_ms,
			periodic);
	puts("Set timer");
}

extern void timedStatemachine_unsetTimer(TimedStatemachine* handle,
		const sc_eventid evid) {
	sc_pthread_timer_service_methods.stop(&ts_connection, evid);
	puts("Unset timer");
}
