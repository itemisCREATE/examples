#include <iostream>

#include "../src-gen/LightSwitch.h"
#include "../src-gen/sc_rxcpp.h"

using namespace std;

/*! Observer with callback for the light.on event */
class LightOnObserver : public sc::rx::SingleSubscriptionObserver<void>{
	virtual void next() {
		cout << "Light is on." << endl;
	}
};

/*! Observer with callback for the light.off event */
class LightOffObserver : public sc::rx::SingleSubscriptionObserver<void>{
	virtual void next() {
		cout << "Light is off." << endl;
	}
};

int main(int argc, char **argv) {
	/*! Instantiates the state machine */
	LightSwitch lightSwitch;

	/*! Instantiates observer for the out events */
	LightOnObserver lightOnObserver;
	LightOffObserver lightOffObserver;

	/*! Subscribes observers to the state machine's observables */
	lightOnObserver.subscribe(lightSwitch.light()->getOn());
	lightOffObserver.subscribe(lightSwitch.light()->getOff());

	/*! Enters the state machine; from this point on the state machine is ready to react on incoming event */
	lightSwitch.enter();

	cout << "Type 'On' or 'Off' to switch the light on or off." << endl;

	string input;
	while(1) {
		cin >> input;
		if(input == "On") {
			/*! Raises the On event in the state machine which causes the corresponding transition to be taken */
			lightSwitch.user()->raiseOn_button();
		} else if(input == "Off") {
			/*! Raises the Off event in the state machine */
			lightSwitch.user()->raiseOff_button();
		}
		/*! Gets the value of the brightness variable */
		cout << "Light is on, brightness: " << lightSwitch.light()->getBrightness() << "." << endl;

	}
}
