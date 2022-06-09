#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <time.h>
#include <sys/time.h>
#include <thread>

#include "../src-gen/LightController.h"
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

int numRead = 0;

// Start point of the execution.
unsigned long time_offset = 0;

// Last execution time.
unsigned long last_time = 0;

// Current time.
unsigned long current_time = 0;

// Stores the time to sleep.
struct timespec sleep_time;

static char buf[20];

/*! Observer with callback for the brightness_changed event */
class LightOneObserver: public sc::rx::SingleSubscriptionObserver<int> {
	virtual void next(int value) {
		cout << "Light 1 Brightness: " << value << "." << endl;
	}
};

/*! Observer with callback for the brightness_changed event */
class LightTwoObserver: public sc::rx::SingleSubscriptionObserver<int> {
	virtual void next(int value) {
		cout << "Light 2 Brightness: " << value << "." << endl;
	}
};

unsigned long get_ms() {
	struct timeval tv;
	unsigned long ms;
	gettimeofday(&tv, 0);
	ms = tv.tv_sec * 1000 + (tv.tv_usec / 1000);
	return ms;
}

void readConsole()
{
	numRead = read(STDIN_FILENO, buf, 1);
}

int main(int argc, char **argv) {
	/*! Instantiates the state machines */
	LightController *controller = new LightController();
	Light *light1 = new Light();
	Light *light2 = new Light();

	/*! Sets the timer service to each state machine */
	controller->setTimerService(timerService);
	light1->setTimerService(timerService);
	light2->setTimerService(timerService);

	/*! Sets the sub machines */
	controller->setLight1(light1);
	controller->setLight2(light2);

	/*! Subscribes observers to the lights' brightness_changed events */
	LightOneObserver *light1Observer = new LightOneObserver();
	LightTwoObserver *light2Observer = new LightTwoObserver();
	light1Observer->subscribe(light1->getBrightness_changed());
	light2Observer->subscribe(light2->getBrightness_changed());

	/*! Enters the state machine; from this point on the state machine is ready to react on incoming event */
	controller->enter();

	cout << "Type '1' or '0' to switch the light on or off." << endl;
	cout << "Type '2' to toggle the blink mode." << endl;
	sleep_time.tv_sec = 0;
	sleep_time.tv_nsec = 100;
	time_offset = get_ms();
	thread readThread(readConsole);
	readThread.detach();
	while (1) {

		current_time = get_ms() - time_offset;
		timerService->proceed(current_time - last_time);
		//int numRead = read(STDIN_FILENO, buf, 1);
		if (numRead > 0) {
			char input = buf[0];
			if (input == '1') {
				/*! Raises the switch_on event in the state machine which causes the corresponding transition to be taken */
				controller->user()->raiseSwitch_on();
			} else if (input == '0') {
				/*! Raises the switch_off event in the state machine */
				controller->user()->raiseSwitch_off();
			} else if (input == '2') {
				/*! Raises the blink event in the state machine */
				controller->user()->raiseBlink_mode();
			}
			numRead = 0;
			thread readThread(readConsole);
			readThread.detach();
		}

		last_time = current_time;
		nanosleep(&sleep_time, 0);
	}
}
