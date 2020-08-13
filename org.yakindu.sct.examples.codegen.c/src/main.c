#include <stdio.h>

#include "../src-gen/LightSwitch.h"
#include "../src-gen/sc_rxc.h"

/*! This function will be called by raising the out event light.on */
static void on_light_on(LightSwitch *o) {
	printf("Light is on.\n");
}

/*! This function will be called by raising the out event light.off */
static void on_light_off(LightSwitch *o) {
	printf("Light is off.\n");
}

/*! Subscribes the observers on the out event observables light.on and light.off */
static void subscribe_observers(LightSwitch *lightSwitch, sc_single_subscription_observer *lightOnObserver,
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

int main(int argc, char **argv) {
	/*! Instantiates the state machine */
	LightSwitch lightSwitch;
	/*! Instantiates observer for the out events */
	sc_single_subscription_observer lightOnObserver;
	sc_single_subscription_observer lightOffObserver;

	char input;

	/*! Initializes the state machine, in particular all variables are set to a proper value */
	lightSwitch_init(&lightSwitch);
	/*! Subscribes observers to the state machine's observables */
	subscribe_observers(&lightSwitch, &lightOnObserver, &lightOffObserver);
	/*! Enters the state machine; from this point on the state machine is ready to react on incoming event */
	lightSwitch_enter(&lightSwitch);

	puts("Type 1 or 0 to switch the light on or off.\n");

	while (1) {
		input = getchar();
		if (input == '1') {
			/*! Raises the On event in the state machine which causes the corresponding transition to be taken */
			lightSwitchIfaceUser_raise_on_button(&lightSwitch);
		} else if (input == '0') {
			/*! Raises the Off event in the state machine */
			lightSwitchIfaceUser_raise_off_button(&lightSwitch);
		}
		if (input != '\n') {
			/*! Gets the value of the brightness variable */
			printf("Brightness %d.\n",
					lightSwitchIfaceLight_get_brightness(&lightSwitch));
		}
	}

	return 0;
}
