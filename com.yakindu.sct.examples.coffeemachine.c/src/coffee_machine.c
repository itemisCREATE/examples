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

cm_recipe_t recipe_CAPPUCINO       = { 8, 100, 30, false };
cm_recipe_t recipe_COFFEE          = { 6, 150, 0, false };
cm_recipe_t recipe_ESPRESSO        = { 10, 30, 0, false };
cm_recipe_t recipe_LATTE_MACCHIATO = { 10, 80, 120, true };
cm_recipe_t recipe_MILK            = { 0, 0, 150, true };
cm_recipe_t recipe_NONE            = { 0, 0, 0, true };


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


cm_recipe_t get_recipe(UserEvents choice) {
	switch (choice) {

	case CAPPUCINO:
		return recipe_CAPPUCINO;
	case COFFEE:
		return recipe_COFFEE;
	case ESPRESSO:
		return recipe_ESPRESSO;
	case LATTE_MACCHIATO:
		return recipe_LATTE_MACCHIATO;
	case MILK:
		return recipe_MILK;
	case ON_OFF:
	case NONE:
		break;
	}

	return recipe_NONE;
}
