#include "timer_impl.h"
#include <avr/wdt.h>

/*! Define the max amount of used time events.
 * This depends on the statechart and must be set by user! */
#define MAX_TIMERS 10

/*! Timer array */
static sc_timer_t timers[MAX_TIMERS];

/*! Service for timed events */
static sc_timer_service_t timer_service;

/*! Callback for setTimer. Creates a timer for each time event */
void stateMachine_set_timer(StateMachine* handle, const sc_eventid evid,
		const sc_integer time_ms, const sc_boolean periodic) {
	sc_timer_set(&timer_service, (void*) handle, evid, time_ms, periodic);
}

/*! Callback for unsetTimer. Removes expired timer */
void stateMachine_unset_timer(StateMachine* handle, const sc_eventid evid) {
	(void) (handle);
	sc_timer_unset(&timer_service, evid);
}

/*! Initializes the Watch Dog Timer with interrupts every 32 ms.
 * Additionally, initializes the timer service */
void timer_init() {
	WDTCSR |= (_BV(WDCE) | _BV(WDE));	// enable WDT
	WDTCSR = _BV(WDP0); 				// cycle time 32 ms
	WDTCSR |= _BV(WDIE);				// enable interrupt
	sei();

	sc_timer_service_init(&timer_service, timers, MAX_TIMERS,
			(sc_raise_time_event_fp) &stateMachine_raise_time_event);
}

/*! Updates all timer with a elapsed time of 32 ms,
 * as set by the 32 ms interrupt by the WDT */
volatile sc_boolean updateTimerFlag = false;
void handle_timer() {
	if (updateTimerFlag) {
		wdt_reset();
		sc_timer_service_proceed(&timer_service, TIMER_TICK_MS);
		updateTimerFlag = false;
	}
}

/*! Interrupt Service Routine to store the WDT interrupt */
ISR(WDT_vect) {
	updateTimerFlag = true;
}

