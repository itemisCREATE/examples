/*
 * main.c
 *
 *  Created on: 11.10.2019
 *      Author: rbeckmann
 */

#include <stdio.h>

#include "../src-gen/LightSwitch.h"


int main(int argc, char **argv) {
	LightSwitch lightSwitch;
	char input;

	lightSwitch_init(&lightSwitch);
	lightSwitch_enter(&lightSwitch);
	puts("Type 1 or 0 to switch the light on or off.\n");

	while(1) {
		input = getchar();
		if(input == '1') {
			lightSwitchIfaceUser_raise_on_button(&lightSwitch);
		} else if(input == '0') {
			lightSwitchIfaceUser_raise_off_button(&lightSwitch);
		}
		if(input != '\n') {
			if(lightSwitchIfaceUser_get_brightness(&lightSwitch)) {
				printf("Light is on, brightness %d\n", lightSwitchIfaceUser_get_brightness(&lightSwitch));
			} else {
				printf("Light is off\n");
			}
		}
	}
}
