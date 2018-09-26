#include "../src-gen/TimedStatemachineRequired.h"
#include "sc_pthread_timer_service.h"
#include "sc_cycle_runner.h"
#include <unistd.h>
#include <pthread.h>
#include <stdio.h>

#define MAX_TIMER 5

TimedStatemachine statemachine;
static sc_cycle_runner_t cycle_runner;
static pthread_mutex_t statechart_mutex = PTHREAD_MUTEX_INITIALIZER;

sc_pthread_timer_t timers[MAX_TIMER];
sc_pthread_timer_service_t timer_service;

extern sc_timer_service_methods_t sc_pthread_timer_service_methods;
sc_ts_connection_t ts_connection =
			{
				.ts_handle = &timer_service,
				.ts_methods = &sc_pthread_timer_service_methods,
				.sm_handle = &statemachine,
				.sm_callback = (sc_time_event_callback_fp) timedStatemachine_raiseTimeEvent
			};

static void run_cycle(void *handle) {
	puts("runCycle was called");
	timedStatemachine_runCycle(handle);
}

int main() {
	puts("started");
	sc_pthread_timer_service_init(&timer_service, timers, MAX_TIMER, &statechart_mutex);
	timedStatemachine_init(&statemachine);
	puts("start enter");
	timedStatemachine_enter(&statemachine);
	puts("enter done");
	sc_cycle_runner_start(
			&cycle_runner,
			&run_cycle,
			&statemachine,
			100, &statechart_mutex);
	for(;;);

	return 0;
}

extern void timedStatemachine_setTimer(TimedStatemachine* handle, const sc_eventid evid, const sc_integer time_ms, const sc_boolean periodic){
	puts("some timer was set");
	sc_pthread_timer_service_methods.start(&ts_connection, evid, time_ms, periodic);
}

extern void timedStatemachine_unsetTimer(TimedStatemachine* handle, const sc_eventid evid){
	puts("some timer was unset");
	sc_pthread_timer_service_methods.stop(&ts_connection ,evid);
}
