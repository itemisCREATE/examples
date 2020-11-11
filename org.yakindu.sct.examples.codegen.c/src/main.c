#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <time.h>
#include <sys/time.h>

#include "../src-gen/LightSwitch.h"
#include "../src-gen/sc_rxc.h"
#include "../src-gen/sc_timer_service.h"

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

static char buf[20];

/*! This function will be called by raising the out event light.on */
static void on_light_on(LightSwitch *o) {
	printf("Light is on.\n");
}

/*! This function will be called by raising the out event light.off */
static void on_light_off(LightSwitch *o) {
	printf("Light is off.\n");
}

/*! Subscribes the observers on the out event observables light.on and light.off */
static void subscribe_observers(LightSwitch *lightSwitch,
		sc_single_subscription_observer *lightOnObserver,
		sc_single_subscription_observer *lightOffObserver) {

	sc_single_subscription_observer_init(lightOnObserver, lightSwitch,
			(sc_observer_next_fp) on_light_on);
	sc_single_subscription_observer_subscribe(lightOnObserver,
			&lightSwitch->ifaceLight.on);

	sc_single_subscription_observer_init(lightOffObserver, lightSwitch,
			(sc_observer_next_fp) on_light_off);
	sc_single_subscription_observer_subscribe(lightOffObserver,
			&lightSwitch->ifaceLight.off);
}

unsigned long get_ms() {
	struct timeval tv;
	unsigned long ms;
	gettimeofday(&tv, 0);
	ms = tv.tv_sec * 1000 + (tv.tv_usec / 1000);
	return ms;
}

int main(int argc, char **argv) {
	/*! Instantiates the state machine */
	LightSwitch lightSwitch;

	/*! Instantiates observer for the out events */
	sc_single_subscription_observer lightOnObserver;
	sc_single_subscription_observer lightOffObserver;

	/*! Initializes the timer service */
	sc_timer_service_init(&timer_service, timers, MAX_TIMERS,
			(sc_raise_time_event_fp) &lightSwitch_raise_time_event);

	/*! Initializes the state machine, in particular all variables are set to a proper value */
	lightSwitch_init(&lightSwitch);

	/*! Subscribes observers to the state machine's observables */
	subscribe_observers(&lightSwitch, &lightOnObserver, &lightOffObserver);

	/*! Enters the state machine; from this point on the state machine is ready to react on incoming event */
	lightSwitch_enter(&lightSwitch);

	/*! Ensures non-blocking read() call. */
	fcntl(STDIN_FILENO, F_SETFL, fcntl(0, F_GETFL) | O_NONBLOCK);
	puts("Type 1 or 0 to switch the light on or off.\n");
	sleep_time.tv_sec = 0;
	sleep_time.tv_nsec = 100;
	time_offset = get_ms();
	while (1) {
		current_time = get_ms() - time_offset;
		sc_timer_service_proceed(&timer_service, current_time - last_time);
		int numRead = read(STDIN_FILENO, buf, 1);
		if (numRead > 0) {
			char input = buf[0];
			if (input == '1') {
				/*! Raises the On event in the state machine which causes the corresponding transition to be taken */
				lightSwitch_user_raise_on_button(&lightSwitch);
			} else if (input == '0') {
				/*! Raises the Off event in the state machine */
				lightSwitch_user_raise_off_button(&lightSwitch);
			}
			if (input != '\n') {
				/*! Prints the value of the brightness variable */
				printf("Brightness: %d.\n",
						lightSwitch_light_get_brightness(&lightSwitch));
			}
		}
		last_time = current_time;
		nanosleep(&sleep_time, 0);
	}

	return 0;
}

/*! This function will be called for each time event in LightSwitch when a state is entered. */
void lightSwitch_set_timer(LightSwitch *handle, const sc_eventid evid,
		const sc_integer time_ms, const sc_boolean periodic) {
	sc_timer_set(&timer_service, handle, evid, time_ms, periodic);
}

/*! This function will be called for each time event in LightSwitch when a state will be left. */
void lightSwitch_unset_timer(LightSwitch *handle, const sc_eventid evid) {
	sc_timer_unset(&timer_service, evid);
}
