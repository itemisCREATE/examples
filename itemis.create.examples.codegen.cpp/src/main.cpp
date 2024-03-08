#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <time.h>
#include <sys/time.h>

#include "../src-gen/LightSwitch.h"
#include "../src-gen/sc_rxcpp.h"
#include "../src-gen/sc_timer_service.h"

using namespace std;
using namespace sc::timer;

/* ! As we make use of time triggers (after & every)
 * we make use of a generic timer implementation
 * and need a defined number of timers. */
#define MAX_TIMERS 10

//! We allocate the desired array of timer tasks.
TimerTask tasks[MAX_TIMERS];

//! The timer tasks are managed by a timer service. */
TimerService *timerService = new TimerService(tasks, MAX_TIMERS);

// Start point of the execution.
unsigned long time_offset = 0;

// Last execution time.
unsigned long last_time = 0;

// Current time.
unsigned long current_time = 0;

// Stores the time to sleep.
struct timespec sleep_time;

static char buf[20];

/*! Observer with callback for the light.on event */
class LightOnObserver: public sc::rx::SingleSubscriptionObserver<void> {
	virtual void next() {
		cout << "Light is on." << endl;
	}
};

/*! Observer with callback for the light.off event */
class LightOffObserver: public sc::rx::SingleSubscriptionObserver<void> {
	virtual void next() {
		cout << "Light is off." << endl;
	}
};

unsigned long get_ms() {
	struct timeval tv;
	unsigned long ms;
	gettimeofday(&tv, 0);
	ms = tv.tv_sec * 1000 + (tv.tv_usec / 1000);
	return ms;
}

int main(int argc, char **argv) {
	/*! Instantiates the state machine */
	LightSwitch *lightSwitch = new LightSwitch();

	/*! Sets the timer service */
	lightSwitch->setTimerService(timerService);

	/*! Subscribes observers to the state machine's observables */
	LightOnObserver *lightOnObserver = new LightOnObserver();
	LightOffObserver *lightOffObserver = new LightOffObserver();
	lightOnObserver->subscribe(lightSwitch->light()->getOn());
	lightOffObserver->subscribe(lightSwitch->light()->getOff());

	/*! Enters the state machine; from this point on the state machine is ready to react on incoming event */
	lightSwitch->enter();

	/*! Ensures non-blocking read() call. */
	fcntl(STDIN_FILENO, F_SETFL, fcntl(0, F_GETFL) | O_NONBLOCK);
	cout << "Type 1 or 0 to switch the light on or off." << endl;
	sleep_time.tv_sec = 0;
	sleep_time.tv_nsec = 100;
	time_offset = get_ms();
	while (1) {
		current_time = get_ms() - time_offset;
		timerService->proceed(current_time - last_time);
		int numRead = read(STDIN_FILENO, buf, 1);
		if (numRead > 0) {
			char input = buf[0];
			if (input == '1') {
				/*! Raises the On event in the state machine which causes the corresponding transition to be taken */
				lightSwitch->user()->raiseOn_button();
			} else if (input == '0') {
				/*! Raises the Off event in the state machine */
				lightSwitch->user()->raiseOff_button();
			}
			if (input != '\n') {
				/*! Prints the value of the brightness variable */
				cout << "Brightness: "
						<< lightSwitch->light()->getBrightness() << "." << endl;
			}
		}
		last_time = current_time;
		nanosleep(&sleep_time, 0);
	}
}
