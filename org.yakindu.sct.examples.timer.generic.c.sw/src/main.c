#include "../src-gen/TimedStatemachineRequired.h"
#include "sc_sw_timer_service.h"

#define MAX_TIMER 5

TimedStatemachine statemachine1;

sc_sw_timer_t timers[MAX_TIMER];
sc_sw_timer_service_t timer_service;

extern sc_timer_service_methods_t sc_sw_timer_service_methods;

sc_ts_connection_t ts_connection[] = //
		{ //
				{
						.ts_handle = &timer_service, //
						.ts_methods = &sc_sw_timer_service_methods, //
						.sm_handle = &statemachine1, //
						.sm_callback =
								(sc_time_event_callback_fp) timedStatemachine_raiseTimeEvent //

				}//
		}; //

int main() {
	sc_sw_timer_service_init(&timer_service, timers, MAX_TIMER);
	timedStatemachine_init(&statemachine1);
	timedStatemachine_enter(&statemachine1);

	while (1) {
		timedStatemachine_runCycle(&statemachine1);

		//call this function after some time has proceed
		sc_sw_timer_service_proceed(&timer_service, 1);
	}

	return 0;
}

extern void timedStatemachine_setTimer(TimedStatemachine* handle,
		const sc_eventid evid, const sc_integer time_ms,
		const sc_boolean periodic) {
	sc_sw_timer_service_methods.start(&ts_connection[0], evid, time_ms,
			periodic);
}

extern void timedStatemachine_unsetTimer(TimedStatemachine* handle,
		const sc_eventid evid) {
	sc_sw_timer_service_methods.stop(&ts_connection[0], evid);
}
