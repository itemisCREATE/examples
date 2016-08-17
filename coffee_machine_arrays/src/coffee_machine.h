/*
 * coffee_machine.h
 *
 *  Created on: 13.04.2016
 *      Author: terfloth
 */

#ifndef COFFEE_MACHINE_H_
#define COFFEE_MACHINE_H_

#include <stdbool.h>
#include <stdint.h>

#include "cm_hmi.h"


typedef struct {
	bool isHeating;
	int8_t temp;
} cm_heater_t;

typedef uint8_t mass_g;
typedef uint16_t volume_ml;

typedef struct {
	mass_g coffee_mass;
	volume_ml water_volume;
	volume_ml milk_volume;
	bool milk_first;
} cm_recipe_t;

extern cm_recipe_t recipes[];

extern cm_heater_t heater;

extern void startHeating();
extern void stopHeating();
extern void updateHeating(int8_t delta);

extern void startMilling();
extern void stopMilling();


extern void startPumping();
extern void stopPumping();


#endif /* COFFEE_MACHINE_H_ */
