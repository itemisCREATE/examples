/*
 * coffee_machine.c
 *
 *  Created on: 13.04.2016
 *      Author: terfloth
 */

#include "coffee_machine.h"

#include "cm_hmi.h"

#define MAX_TEMP 95
#define MIN_TEMP 20

cm_heater_t heater = { false, MIN_TEMP };

cm_recipe_t recipes[] = {
		{ 6, 150, 0, false }, 	// coffee
		{ 10, 30, 0, false }, 	// espresso
		{ 8, 100, 30, false }, 	// cappucino
		{ 10, 80, 120, true }, 	// latte macchiato
		{ 0, 0, 150, true },	// milk
		{ 0, 0, 0, true }		// default
};


void startHeating() {
	heater.isHeating = true;
}


void stopHeating() {
	heater.isHeating = false;
}


void updateHeating(int8_t delta) {
	if (heater.isHeating && heater.temp < MAX_TEMP) {
		heater.temp += delta;
	}
	else if ( !heater.isHeating && heater.temp > MIN_TEMP) {
		heater.temp -= delta;
	}
}


void startMilling() {
}


void stopMilling() {
}


void startPumping() {
}


void stopPumping() {
}
