/*
 * CoffeeMachine.cpp
 *
 *  Created on: 19.03.2018
 *      Author: administrator
 */

#include "CoffeeMachine.hpp"
#include "CMHMI.hpp"

Coffee_Machine::Coffee_Machine() {
	recipe_CAPPUCINO.coffee_mass = 8;
	recipe_CAPPUCINO.water_volume = 100;
	recipe_CAPPUCINO.milk_volume = 30;
	recipe_CAPPUCINO.milk_first = false;

	recipe_COFFEE.coffee_mass = 6;
	recipe_COFFEE.water_volume = 150;
	recipe_COFFEE.milk_volume = 0;
	recipe_COFFEE.milk_first = false;


	recipe_ESPRESSO.coffee_mass = 10;
	recipe_ESPRESSO.water_volume = 30;
	recipe_ESPRESSO.milk_volume = 0;
	recipe_ESPRESSO.milk_first = false;


	recipe_LATTE_MACCHIATO.coffee_mass = 10;
	recipe_LATTE_MACCHIATO.water_volume = 80;
	recipe_LATTE_MACCHIATO.milk_volume = 120;
	recipe_LATTE_MACCHIATO.milk_first = true;


	recipe_MILK.coffee_mass = 0;
	recipe_MILK.water_volume = 0;
	recipe_MILK.milk_volume = 150;
	recipe_MILK.milk_first = true;

	recipe_NONE.coffee_mass = 0;
	recipe_NONE.water_volume = 0;
	recipe_NONE.milk_volume = 0;
	recipe_NONE.milk_first = true;
}

Coffee_Machine::~Coffee_Machine() {
}

//Coffee_Machine::cm_heater_t Coffee_Machine::get_heater() {
//	return
//}

Coffee_Machine::cm_recipe_t Coffee_Machine::get_recipe(UserEvents choice) {
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


	return Coffee_Machine::recipe_NONE;
}

void Coffee_Machine::startHeating() {
	heater.isHeating = true;
}

void Coffee_Machine::stopHeating() {
	heater.isHeating = false;
}

void Coffee_Machine::updateHeating(int8_t delta) {
	if (heater.isHeating && heater.temp < MAX_TEMP) {
		heater.temp += delta;
	} else if (!heater.isHeating && heater.temp > MIN_TEMP) {
		heater.temp -= delta;
	}
}

void Coffee_Machine::startMilling() {
}

void Coffee_Machine::stopMilling() {
}

void Coffee_Machine::startPumping() {
}

void Coffee_Machine::stopPumping() {
}
