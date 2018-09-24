/*
 * cm_state_log.c
 *
 *  Created on: 13.04.2016
 *      Author: terfloth
 */

#include <stdio.h>

#include "cm_trace.h"
#include "CoffeeMachine.h"
#include "CoffeeMachineRequired.h"
#include "ProcessCappucinoRequired.h"
#include "ProcessCoffeeRequired.h"
#include "ProcessEspressoRequired.h"
#include "ProcessLatteMacchiatoRequired.h"
#include "ProcessMilkRequired.h"



static char* cm_stateNames[] = {
		"Off",
		"On" ,
		"On.Welcome" ,
		"On.HeatingUp" ,
		"On.WaitForChoice" ,
		"On.SaveEnergy" ,
		"On.ProcessRecipe"
};

static char* pr_stateNames[] = {
		"Recipe.MakeCoffee",
		"Recipe.MakeCoffee.MillingBeans",
		"Recipe.MakeCoffee.BrewCoffee",
		"Recipe.MakeMilk",
		"Recipe.MakeMilk.MakeSteam",
		"Recipe.Done"
};

static char* coffee_stateNames[] = {
		"Recipe.MakeCoffee",
		"Recipe.MakeCoffee.MillingBeans",
		"Recipe.MakeCoffee.BrewCoffee",
		"Recipe.Done"
};


static char* milk_stateNames[] = {
		"Recipe.MakeMilk",
		"Recipe.MakeMilk.MakeSteam",
		"Recipe.Done"
};

bool cm_trace_active = true;


/*! This function is called when a state is entered. */
void coffeeMachine_stateEntered(CoffeeMachine* handle, const CoffeeMachineStates state) {
	if (cm_trace_active) fprintf(stderr, "-> [%s]\n", cm_stateNames[state-1]);
}

/*! This function is called when a state is exited. */
void coffeeMachine_stateExited(CoffeeMachine* handle, const CoffeeMachineStates state) {
	if (cm_trace_active) fprintf(stderr, "[%s] ->\n", cm_stateNames[state-1]);
}


extern void processCappucino_stateEntered(ProcessCappucino* handle, const ProcessCappucinoStates state){
	if (cm_trace_active) fprintf(stderr, "-> [%s]\n", pr_stateNames[state-1]);
}

extern void processCappucino_stateExited(ProcessCappucino* handle, const ProcessCappucinoStates state){
	if (cm_trace_active) fprintf(stderr, "[%s] ->\n", pr_stateNames[state-1]);
}


extern void processCoffee_stateEntered(ProcessCoffee* handle, const ProcessCoffeeStates state){
	if (cm_trace_active) fprintf(stderr, "-> [%s]\n", coffee_stateNames[state-1]);
}

extern void processCoffee_stateExited(ProcessCoffee* handle, const ProcessCoffeeStates state){
	if (cm_trace_active) fprintf(stderr, "[%s] ->\n", coffee_stateNames[state-1]);
}


extern void processEspresso_stateEntered(ProcessEspresso* handle, const ProcessEspressoStates state){
	if (cm_trace_active) fprintf(stderr, "-> [%s]\n", coffee_stateNames[state-1]);
}

extern void processEspresso_stateExited(ProcessEspresso* handle, const ProcessEspressoStates state){
	if (cm_trace_active) fprintf(stderr, "[%s] ->\n", coffee_stateNames[state-1]);
}


extern void processLatteMacchiato_stateEntered(ProcessLatteMacchiato* handle, const ProcessLatteMacchiatoStates state){
	if (cm_trace_active) fprintf(stderr, "-> [%s]\n", pr_stateNames[state-1]);
}

extern void processLatteMacchiato_stateExited(ProcessLatteMacchiato* handle, const ProcessLatteMacchiatoStates state){
	if (cm_trace_active) fprintf(stderr, "[%s] ->\n", pr_stateNames[state-1]);
}

extern void processMilk_stateEntered(ProcessMilk* handle, const ProcessMilkStates state){
	if (cm_trace_active) fprintf(stderr, "-> [%s]\n", milk_stateNames[state-1]);
}

extern void processMilk_stateExited(ProcessMilk* handle, const ProcessMilkStates state){
	if (cm_trace_active) fprintf(stderr, "[%s] ->\n", milk_stateNames[state-1]);
}
