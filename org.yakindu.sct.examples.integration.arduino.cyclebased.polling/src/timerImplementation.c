#include "Arduino.h"
#include "timerImplementation.h"

#define MAX_TIMERS 1
static sc_timer_t timers[MAX_TIMERS];
static sc_timer_service_t timer_service;

void stateMachine_setTimer(StateMachine* handle,
		const sc_eventid evid, const sc_integer time_ms,
		const sc_boolean periodic) {
	sc_timer_start(&timer_service, (void*) handle, evid, time_ms, periodic);
}

void stateMachine_unsetTimer(StateMachine* handle,
		const sc_eventid evid) {
	sc_timer_cancel(&timer_service, evid);
}

void timerInit(StateMachine* handle) {
	sc_timer_service_init(&timer_service, timers, MAX_TIMERS,
			(sc_raise_time_event_fp) &handle);
}

long current_millis = 0;
long last_cycle_time = 0;
void handleTimer(sc_integer millis) {
	last_cycle_time = current_millis;
	current_millis = millis;
		sc_timer_service_proceed(&timer_service, current_millis - last_cycle_time);
}
