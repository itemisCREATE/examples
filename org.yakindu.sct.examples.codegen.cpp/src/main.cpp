/*
 * main.cpp
 *
 *  Created on: 11.10.2019
 *      Author: rbeckmann
 */

#include <iostream>

#include "../src-gen/LightSwitch.h"


int main(int argc, char **argv) {
	LightSwitch lightSwitch;
	std::string input;

	lightSwitch.init();
	lightSwitch.enter();

	std::cout << "Type 'On' or 'Off' to switch the light on or off.\n";

	while(1) {
		std::cin >> input;
		if(input == "On") {
			lightSwitch.getSCI_User()->raise_on_button();
		} else if(input == "Off") {
			lightSwitch.getSCI_User()->raise_off_button();
		}

		if(lightSwitch.getSCI_User()->get_brightness()) {
			std::cout << "Light is on, brightness: " << lightSwitch.getSCI_User()->get_brightness() << "\n";
		} else {
			std::cout << "Light is off\n";
		}

	}
}
