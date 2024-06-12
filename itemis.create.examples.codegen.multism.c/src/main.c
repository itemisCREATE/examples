#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <time.h>
#include <sys/time.h>

#include "../src-gen/Light.h"
#include "../src-gen/LightController.h"
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

/*! Instantiates the state machine */
LightController controller;
/* Instantiates and sets the sub machines */
Light light1;
Light light2;

/*! This function will be called when brightness_changed event is called in light1 */
static void on_light1_brightness_changed(LightController *o, sc_integer value) {
	printf("Light 1 Brightness: %d\n", value);
}

/*! This function will be called when brightness_changed event is called in light2 */
static void on_light2_brightness_changed(LightController *o, sc_integer value) {
	printf("Light 2 Brightness: %d\n", value);
}

/*! This function is used in the timer service and required to reuse the same timer service for all state machines */
static void dispatchTimeEvent(void *handle, sc_eventid evid) {
	if (handle == &controller) {
		lightController_raise_time_event(&controller, evid);
	}
	if (handle == &light1) {
		light_raise_time_event(&light1, evid);
	}
	if (handle == &light2) {
		light_raise_time_event(&light2, evid);
	}
}

unsigned long get_ms() {
	struct timeval tv;
	unsigned long ms;
	gettimeofday(&tv, 0);
	ms = tv.tv_sec * 1000 + (tv.tv_usec / 1000);
	return ms;
}

int main(int argc, char **argv) {
	/*! Initializes the timer service */
	sc_timer_service_init(&timer_service, timers, MAX_TIMERS,
			(sc_raise_time_event_fp) &dispatchTimeEvent);

	/*! Initializes the state machines and sets all sub machines */
	lightController_init(&controller);
	light_init(&light1);
	light_init(&light2);
	lightController_set_light1(&controller, &light1);
	lightController_set_light2(&controller, &light2);

	/*! Subscribes observers to the lights' brightness_changed events */
	sc_single_subscription_observer_sc_integer light1Observer;
	sc_single_subscription_observer_sc_integer_init(&light1Observer, &light1,
			(sc_observer_next_sc_integer_fp) on_light1_brightness_changed);
	sc_single_subscription_observer_sc_integer_subscribe(&light1Observer,
			&light1.iface.brightness_changed);
	sc_single_subscription_observer_sc_integer light2Observer;
	sc_single_subscription_observer_sc_integer_init(&light2Observer, &light2,
			(sc_observer_next_sc_integer_fp) on_light2_brightness_changed);
	sc_single_subscription_observer_sc_integer_subscribe(&light2Observer,
			&light2.iface.brightness_changed);

	/*! Enters the state machine; from this point on the state machine is ready to react on incoming event */
	lightController_enter(&controller);

	sleep_time.tv_sec = 0;
	sleep_time.tv_nsec = 100;
	time_offset = get_ms();

	/*! Ensures non-blocking read() call. */
	//fcntl(STDIN_FILENO, F_SETFL, fcntl(0, F_GETFL) | O_NONBLOCK);
	printf("Type 1 or 0 to switch the lights on or off.\n");
	printf("Type 2 to toggle the blink mode.\n");
	while (1) {
		current_time = get_ms() - time_offset;
		sc_timer_service_proceed(&timer_service, current_time - last_time);
		int numRead = read(STDIN_FILENO, buf, 1);
		if (numRead > 0) {
			char input = buf[0];
			if (input == '1') {
				/*! Raises the switch_on event in the state machine which causes the corresponding transition to be taken */
				lightController_user_raise_switch_on(&controller);
			} else if (input == '0') {
				/*! Raises the switch_off event in the state machine */
				lightController_user_raise_switch_off(&controller);
			} else if (input == '2') {
				/*! Raises the blink event in the state machine */
				lightController_user_raise_blink_mode(&controller);
			}
		}
		last_time = current_time;
		nanosleep(&sleep_time, 0);
	}
	return 0;
}

/*! This function will be called for each time event in LightController when a state is entered. */
void lightController_set_timer(LightController *handle, const sc_eventid evid,
		const sc_integer time_ms, const sc_boolean periodic) {
	sc_timer_set(&timer_service, handle, evid, time_ms, periodic);
}

/*! This function will be called for each time event in LightController when a state will be left. */
void lightController_unset_timer(LightController *handle, const sc_eventid evid) {
	sc_timer_unset(&timer_service, evid);
}

/*! This function will be called for each time event in Light when a state is entered. */
void light_set_timer(Light *handle, const sc_eventid evid,
		const sc_integer time_ms, const sc_boolean periodic) {
	sc_timer_set(&timer_service, handle, evid, time_ms, periodic);
}

/*! This function will be called for each time event in Light when a state will be left. */
void light_unset_timer(Light *handle, const sc_eventid evid) {
	sc_timer_unset(&timer_service, evid);
}
