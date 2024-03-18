#ifndef SCR_COFFEEMACHINE_HPP_
#define SCR_COFFEEMACHINE_HPP_

#include <stdbool.h>
#include <stdint.h>

#include "../src/CMHMI.hpp"

#define MAX_TEMP 95
#define MIN_TEMP 20

class Coffee_Machine {
public:
	Coffee_Machine();
	virtual ~Coffee_Machine();

	typedef struct {
		bool isHeating;
		int8_t temp;
	} cm_heater_t;

	cm_heater_t heater;

	typedef uint8_t mass_g;
	typedef uint16_t volume_ml;

	typedef struct {
		mass_g coffee_mass;
		volume_ml water_volume;
		volume_ml milk_volume;
		bool milk_first;
	}cm_recipe_t;

	cm_recipe_t get_recipe(CM_HMI::UserEvents choice);


	void startHeating();
	void stopHeating();
	void updateHeating(int8_t delta);

	void startMilling();
	void stopMilling();

	void startPumping();
	void stopPumping();

private:
	cm_recipe_t recipe_CAPPUCINO;
	cm_recipe_t recipe_COFFEE;
	cm_recipe_t recipe_ESPRESSO;
	cm_recipe_t recipe_LATTE_MACCHIATO;
	cm_recipe_t recipe_MILK;
	cm_recipe_t recipe_NONE;

};

#endif /* SCR_COFFEEMACHINE_HPP_ */
