#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <sys/time.h>

#include "src/cm_hmi.h"
#include "src-gen/CoffeeMachine.h"
#include "src-gen/sc_timer_service.h"

/*! \file Implementation of the main function and setup of the virtual itemis CREATE Coffee Maker.
 * It includes everything to setup and run the example.
 * The example applies a cycle based execution model.
 */

/* ! First we create our coffee state machine. */
static CoffeeMachine coffee_state_machine;

/* ! As we make use of time triggers (after & every)
 * we make use of a generic timer implementation
 * and need a defined number of timers. */
#define MAX_TIMERS 4

//! We allocate the desired array of timers.
static sc_timer_t timers[MAX_TIMERS];

//! The timers are managed by a timer service. */
static sc_timer_service_t timer_service;

// Start point of the execution.
unsigned long time_offset = 0;

// Last execution time.
unsigned long last_time = 0;

// Current time.
unsigned long current_time = 0;

// Stores the time to sleep.
struct timespec sleep_time;

unsigned long get_ms() {
	struct timeval tv;
	unsigned long ms;
	gettimeofday(&tv, 0);
	ms = tv.tv_sec * 1000 + (tv.tv_usec / 1000);
	return ms;
}

/*! Set up the timer. Init and enter the state machine. */
void setUp() {
	time_offset = get_ms();
	sleep_time.tv_sec = 0;
	sleep_time.tv_nsec = 100;

	hmi_init();
	puts("!!!Hello Coffee!!!");
	puts("general commands are:");
	puts("(o) toggle on/off");
	puts("(t) toggle state trace");
	puts("(q) quit");

	// We initialize the timer service with everything it requires.
	sc_timer_service_init(&timer_service, timers, MAX_TIMERS,
			(sc_raise_time_event_fp) &coffeeMachine_raise_time_event);

	// then we initialize
	coffeeMachine_init(&coffee_state_machine);
	// ... and enter the state machine
	coffeeMachine_enter(&coffee_state_machine);

}

/*! Loop forever. The run_cycle should be called every 200 ms
 * depending on the @CycleBased() definition. */
void loop() {
	current_time = get_ms() - time_offset;
	if (current_time >= last_time + 200) {
		sc_timer_service_proceed(&timer_service, current_time - last_time);
		UserEvents userInput = getUserInput();
		if (userInput == QUIT) {
			puts("Bye ...");
			exit(EXIT_SUCCESS);
		}
		if (userInput != NONE) {
			coffeeMachine_raise_userEvent(&coffee_state_machine, userInput);
		}
		coffeeMachine_run_cycle(&coffee_state_machine);
		last_time = current_time;
	}
	nanosleep(&sleep_time, 0);
}

/*!
 This function will be called for each time event that is relevant for a state when a state will be entered.
 \param evid An unique identifier of the event.
 \time_ms The time in milli seconds
 \periodic Indicates the the time event must be raised periodically until the timer is unset
 */
void coffeeMachine_set_timer(CoffeeMachine *handle, const sc_eventid evid,
		const sc_integer time_ms, const sc_boolean periodic) {
	// simply delegate to the generic timer service implementation.
	sc_timer_set(&timer_service, handle, evid, time_ms, periodic);
}

/*!
 This function will be called for each time event that is relevant for a state when a state will be left.
 \param evid An unique identifier of the event.
 */
void coffeeMachine_unset_timer(CoffeeMachine *handle, const sc_eventid evid) {
	// simply delegate to the generic timer service implementation.
	sc_timer_unset(&timer_service, evid);
}

int main(void) {
	setUp();
	for (;;) {
		loop();
	}
}
