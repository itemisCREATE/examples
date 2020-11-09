#include <iostream>
#include <string>

#include "../src-gen/LightController.h"
#include "../src-gen/sc_rxcpp.h"
#include "../src-gen/sc_timer_service.h"

using namespace std;
using namespace sc::timer;

#define MAX_TIMERS 4

/*! Observer with callback for the brightness_changed event */
class LightOneObserver : public sc::rx::SingleSubscriptionObserver<int>{
	virtual void next(int value) {
		cout << "Light 1 Brightness: " + value << endl;
	}
};

/*! Observer with callback for the brightness_changed event */
class LightTwoObserver : public sc::rx::SingleSubscriptionObserver<int>{
	virtual void next(int value) {
		cout << "Light 2 Brightness: " + value << endl;
	}
};

int main(int argc, char **argv) {
	/*! Instantiates the state machine */
	LightController controller;

	/* Sets the timer service */
	TimerTask tasks[MAX_TIMERS];
	TimerService *timerService = new TimerService(tasks, MAX_TIMERS);
	controller.setTimerService(timerService);

	/* Instantiates and sets the sub machines */
	Light *light1 = new Light();
	Light *light2 = new Light();
	controller.setLight1(light1);
	controller.setLight2(light2);

	/* Subscribes reaction on out event observables */
	LightOneObserver light1Observer;
	LightTwoObserver light2Observer;
	light1Observer.subscribe(light1->getBrightness_changed());
	light2Observer.subscribe(light2->getBrightness_changed());

	/*! Enters the state machine; from this point on the state machine is ready to react on incoming event */
	controller.enter();

	cout << "Type 'On' or 'Off' to switch the light on or off." << endl;
	cout << "Type 'Blink' to toggle the blink mode." << endl;
	string input;
	while(1) {
		cin >> input;
		if(input == "On") {
			/*! Raises the On event in the state machine which causes the corresponding transition to be taken */
			controller.user()->raiseSwitch_on();
		} else if(input == "Off") {
			/*! Raises the Off event in the state machine */
			controller.user()->raiseSwitch_off();
		} else if(input == "Blink") {
			/*! Raises the Off event in the state machine */
			controller.user()->raiseBlink_mode();
		}
	}
}
