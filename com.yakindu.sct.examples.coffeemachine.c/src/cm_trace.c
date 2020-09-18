/*
 * cm_state_log.c
 *
 *  Created on: 13.04.2016
 *      Author: terfloth
 */

#include <stdio.h>

#include "cm_trace.h"
#include "../src-gen/CoffeeMachineRequired.h"

static char* stateNames[] = {
		"InvalidState",
		"Off",
		"On" ,
		"On.Welcome" ,
		"On.HeatingUp" ,
		"On.WaitForChoice" ,
		"On.SaveEnergy" ,
		"On.ProcessRecipe" ,
		"On.ProcessRecipe.MakeMilk",
		"On.ProcessRecipe.MakeMilk.MakeSteam",
		"On.ProcessRecipe.MakeCoffee",
		"On.ProcessRecipe.MakeCoffee.MillingBeans",
		"On.ProcessRecipe.MakeCoffee.BrewCoffee"
};


bool cm_trace_active = true;


/*! This function is called when a state is entered. */
void coffeeMachine_stateEntered(CoffeeMachine* handle, const CoffeeMachineStates state) {
	if (cm_trace_active) fprintf(stderr, "-> [%s]\n", stateNames[state]);
}

/*! This function is called when a state is exited. */
void coffeeMachine_stateExited(CoffeeMachine* handle, const CoffeeMachineStates state) {
	if (cm_trace_active) fprintf(stderr, "[%s] ->\n", stateNames[state]);
}
