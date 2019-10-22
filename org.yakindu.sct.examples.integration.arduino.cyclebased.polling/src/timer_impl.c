#include "timer_impl.h"

#include "Arduino.h"

/*! Define the max amount of used time events.
 * This depends on the statechart and must be set by user! */
#define MAX_TIMERS 10

/*! Timer array */
static sc_timer_t timers[MAX_TIMERS];

/*! Service for timed events */
static sc_timer_service_t timer_service;

/*! Callback for setTimer. Creates a timer for each time event */
void stateMachine_setTimer(StateMachine* handle, const sc_eventid evid,
		const sc_integer time_ms, const sc_boolean periodic) {
	sc_timer_start(&timer_service, handle, evid, time_ms, periodic);
}

/*! Callback for unsetTimer. Removes expired timer */
void stateMachine_unsetTimer(StateMachine* handle, const sc_eventid evid) {
	(void) (handle);
	sc_timer_cancel(&timer_service, evid);
}

/*! Initializes the timer service */
void timer_init() {
	sc_timer_service_init(&timer_service, timers, MAX_TIMERS,
			(sc_raise_time_event_fp) &stateMachine_raiseTimeEvent);
}

long current_millis = 0;
long last_cycle_time = 0;
/*! Updates all timer with a elapsed time calculated by millis(). */
void handle_timer(unsigned long millis) {
	last_cycle_time = current_millis;
	current_millis = millis;
	sc_timer_service_proceed(&timer_service, current_millis - last_cycle_time);
}
