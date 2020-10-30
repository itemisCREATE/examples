#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/time.h>

#include "src/cm_hmi.h"
#include "src-gen/CoffeeMachine.h"
#include "src/sc_timer_service.h"

void setUp();
void loop();
int millis(struct timeval *start, struct timeval *stop);

/*! \file Implementation of the main function and setup of the virtual YAKINDU Coffee Maker.
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

static unsigned long current_millies = 0L;
static unsigned long last_cycle_time = 0L;
static struct timeval stop, start;

/*! Run the state machine, raise in events and update all timers. */
void coffeMachine_run(sc_timer_service_t *timer_service,
		CoffeeMachine *coffee_state_machine) {
	gettimeofday(&start, NULL);
	gettimeofday(&stop, NULL);
	last_cycle_time = millis(&start, &stop);
	while (1) {

	}
}

/*! Set up the timer. Init and enter the state machine. */
void setUp() {
	puts("!!!Hello Coffee!!!");
	puts("general commands are:");
	puts("(o) toggle on/off");
	puts("(t) toggle state trace");
	puts("(q) quit");

	// We initialize the timer service with everything it requires.
	sc_timer_service_init(&timer_service, timers, MAX_TIMERS,
			(sc_raise_time_event_fp) &coffeeMachine_raise_time_event);

	gettimeofday(&start, NULL);
	stop = start;
	last_cycle_time = millis(&start, &stop);

	// then we initialize
	coffeeMachine_init(&coffee_state_machine);
	// ... and enter the state machine
	coffeeMachine_enter(&coffee_state_machine);

}

/*! Loop forever. The run_cycle should be called every 200 ms
 * depending on the @CycleBased() definition. */
void loop() {
	current_millies = millis(&start, &stop);
	if (current_millies >= last_cycle_time + 200) {
		sc_timer_service_proceed(&timer_service,
				current_millies - last_cycle_time);
		UserEvents userInput = getUserInput();
		if (userInput == QUIT) {
			puts("Bye ...");
			exit(EXIT_SUCCESS);
		}
		coffeeMachine_raise_userEvent(&coffee_state_machine, userInput);
		coffeeMachine_run_cycle(&coffee_state_machine);
		last_cycle_time = current_millies;
	}
	gettimeofday(&stop, NULL);

}

/*! Get the time difference from start and stop in milliseconds. */
int millis(struct timeval *start, struct timeval *stop) {
	return ((stop->tv_sec - start->tv_sec) * 1000
			+ (stop->tv_usec - start->tv_usec) / 1000
			+ ((stop->tv_usec - start->tv_usec) % 1000) / 500);
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
	sc_timer_start(&timer_service, handle, evid, time_ms, periodic);
}

/*!
 This function will be called for each time event that is relevant for a state when a state will be left.
 \param evid An unique identifier of the event.
 */
void coffeeMachine_unset_timer(CoffeeMachine *handle, const sc_eventid evid) {

	// simply delegate to the generic timer service implementation.
	sc_timer_cancel(&timer_service, evid);
}

int main(void) {
	setUp();
	for (;;) {
		loop();
	}
}
