
#include "ProcessCoffee.h"
#include "sc/sc_types.h"
#include "ProcessCoffeeRequired.h"

#include <stdlib.h>
#include <string.h>
/*! \file Implementation of the state machine 'ProcessCoffee'
*/

/* prototypes of all internal functions */
static sc_boolean check_main_region_Make_Coffee_r_Milling_Beans_tr0_tr0(const ProcessCoffee* handle);
static sc_boolean check_main_region_Make_Coffee_r_Brew_Coffee_tr0_tr0(const ProcessCoffee* handle);
static void effect_main_region_Make_Coffee_tr0(ProcessCoffee* handle);
static void effect_main_region_Make_Coffee_r_Milling_Beans_tr0(ProcessCoffee* handle);
static void effect_main_region_Make_Coffee_r_Brew_Coffee_tr0(ProcessCoffee* handle);
static void enact(ProcessCoffee* handle);
static void enact_main_region_Make_Coffee_r_Milling_Beans(ProcessCoffee* handle);
static void enact_main_region_Make_Coffee_r_Brew_Coffee(ProcessCoffee* handle);
static void exact_main_region_Make_Coffee_r_Milling_Beans(ProcessCoffee* handle);
static void exact_main_region_Make_Coffee_r_Brew_Coffee(ProcessCoffee* handle);
static void enseq_main_region_Make_Coffee_default(ProcessCoffee* handle);
static void enseq_main_region_Make_Coffee_r_Milling_Beans_default(ProcessCoffee* handle);
static void enseq_main_region_Make_Coffee_r_Brew_Coffee_default(ProcessCoffee* handle);
static void enseq_main_region__final__default(ProcessCoffee* handle);
static void enseq_main_region_default(ProcessCoffee* handle);
static void enseq_main_region_Make_Coffee_r_default(ProcessCoffee* handle);
static void exseq_main_region_Make_Coffee(ProcessCoffee* handle);
static void exseq_main_region_Make_Coffee_r_Milling_Beans(ProcessCoffee* handle);
static void exseq_main_region_Make_Coffee_r_Brew_Coffee(ProcessCoffee* handle);
static void exseq_main_region__final_(ProcessCoffee* handle);
static void exseq_main_region(ProcessCoffee* handle);
static void exseq_main_region_Make_Coffee_r(ProcessCoffee* handle);
static void react_main_region_Make_Coffee_r_Milling_Beans(ProcessCoffee* handle);
static void react_main_region_Make_Coffee_r_Brew_Coffee(ProcessCoffee* handle);
static void react_main_region__final_(ProcessCoffee* handle);
static void react_main_region__entry_Default(ProcessCoffee* handle);
static void react_main_region_Make_Coffee_r__entry_Default(ProcessCoffee* handle);
static void react_main_region_Make_Coffee_r__exit_Default(ProcessCoffee* handle);
static void clearInEvents(ProcessCoffee* handle);
static void clearOutEvents(ProcessCoffee* handle);


void processCoffee_init(ProcessCoffee* handle)
{
		sc_integer i;
	
		for (i = 0; i < PROCESSCOFFEE_MAX_ORTHOGONAL_STATES; ++i)
		{
			handle->stateConfVector[i] = ProcessCoffee_last_state;
		}
		
		
		handle->stateConfVectorPosition = 0;
	
		clearInEvents(handle);
		clearOutEvents(handle);
	
}

void processCoffee_enter(ProcessCoffee* handle)
{
	/* Default enter sequence for statechart ProcessCoffee */
	enact(handle);
	enseq_main_region_default(handle);
}

void processCoffee_runCycle(ProcessCoffee* handle)
{
	clearOutEvents(handle);
	for (handle->stateConfVectorPosition = 0;
		handle->stateConfVectorPosition < PROCESSCOFFEE_MAX_ORTHOGONAL_STATES;
		handle->stateConfVectorPosition++)
		{
			
		switch (handle->stateConfVector[handle->stateConfVectorPosition])
		{
		case ProcessCoffee_main_region_Make_Coffee_r_Milling_Beans:
		{
			react_main_region_Make_Coffee_r_Milling_Beans(handle);
			break;
		}
		case ProcessCoffee_main_region_Make_Coffee_r_Brew_Coffee:
		{
			react_main_region_Make_Coffee_r_Brew_Coffee(handle);
			break;
		}
		case ProcessCoffee_main_region__final_:
		{
			react_main_region__final_(handle);
			break;
		}
		default:
			break;
		}
	}
	
	clearInEvents(handle);
}

void processCoffee_exit(ProcessCoffee* handle)
{
	/* Default exit sequence for statechart ProcessCoffee */
	exseq_main_region(handle);
}

sc_boolean processCoffee_isActive(const ProcessCoffee* handle)
{
	sc_boolean result = bool_false;
	int i;
	
	for(i = 0; i < PROCESSCOFFEE_MAX_ORTHOGONAL_STATES; i++)
	{
		result = result || handle->stateConfVector[i] != ProcessCoffee_last_state;
	}
	
	return result;
}

sc_boolean processCoffee_isFinal(const ProcessCoffee* handle)
{
	return (handle->stateConfVector[0] == ProcessCoffee_main_region__final_);

}

void processCoffee_raiseTimeEvent(ProcessCoffee* handle, sc_eventid evid)
{
	if ( ((sc_intptr_t)evid) >= ((sc_intptr_t)&(handle->timeEvents))
		&&  ((sc_intptr_t)evid) < ((sc_intptr_t)&(handle->timeEvents)) + sizeof(ProcessCoffeeTimeEvents))
		{
		*(sc_boolean*)evid = bool_true;
	}		
}

sc_boolean processCoffee_isStateActive(const ProcessCoffee* handle, ProcessCoffeeStates state)
{
	sc_boolean result = bool_false;
	switch (state)
	{
		case ProcessCoffee_main_region_Make_Coffee :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSCOFFEE_MAIN_REGION_MAKE_COFFEE] >= ProcessCoffee_main_region_Make_Coffee
				&& handle->stateConfVector[SCVI_PROCESSCOFFEE_MAIN_REGION_MAKE_COFFEE] <= ProcessCoffee_main_region_Make_Coffee_r_Brew_Coffee);
			break;
		case ProcessCoffee_main_region_Make_Coffee_r_Milling_Beans :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSCOFFEE_MAIN_REGION_MAKE_COFFEE_R_MILLING_BEANS] == ProcessCoffee_main_region_Make_Coffee_r_Milling_Beans
			);
			break;
		case ProcessCoffee_main_region_Make_Coffee_r_Brew_Coffee :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSCOFFEE_MAIN_REGION_MAKE_COFFEE_R_BREW_COFFEE] == ProcessCoffee_main_region_Make_Coffee_r_Brew_Coffee
			);
			break;
		case ProcessCoffee_main_region__final_ :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSCOFFEE_MAIN_REGION__FINAL_] == ProcessCoffee_main_region__final_
			);
			break;
		default:
			result = bool_false;
			break;
	}
	return result;
}

static void clearInEvents(ProcessCoffee* handle)
{
	handle->timeEvents.processCoffee_main_region_Make_Coffee_r_Milling_Beans_tev0_raised = bool_false;
	handle->timeEvents.processCoffee_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised = bool_false;
}

static void clearOutEvents(ProcessCoffee* handle)
{
}



cm_recipe_t processCoffeeIface_get_recipe(const ProcessCoffee* handle)
{
	return handle->iface.recipe;
}
void processCoffeeIface_set_recipe(ProcessCoffee* handle, cm_recipe_t value)
{
	handle->iface.recipe = value;
}

/* implementations of all internal functions */

static sc_boolean check_main_region_Make_Coffee_r_Milling_Beans_tr0_tr0(const ProcessCoffee* handle)
{
	return handle->timeEvents.processCoffee_main_region_Make_Coffee_r_Milling_Beans_tev0_raised;
}

static sc_boolean check_main_region_Make_Coffee_r_Brew_Coffee_tr0_tr0(const ProcessCoffee* handle)
{
	return handle->timeEvents.processCoffee_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised;
}

static void effect_main_region_Make_Coffee_tr0(ProcessCoffee* handle)
{
	exseq_main_region_Make_Coffee(handle);
	enseq_main_region__final__default(handle);
}

static void effect_main_region_Make_Coffee_r_Milling_Beans_tr0(ProcessCoffee* handle)
{
	exseq_main_region_Make_Coffee_r_Milling_Beans(handle);
	enseq_main_region_Make_Coffee_r_Brew_Coffee_default(handle);
}

static void effect_main_region_Make_Coffee_r_Brew_Coffee_tr0(ProcessCoffee* handle)
{
	exseq_main_region_Make_Coffee_r_Brew_Coffee(handle);
	react_main_region_Make_Coffee_r__exit_Default(handle);
}

/* Entry action for statechart 'ProcessCoffee'. */
static void enact(ProcessCoffee* handle)
{
	/* Entry action for statechart 'ProcessCoffee'. */
	handle->iface.recipe.coffee_mass = 6;
	handle->iface.recipe.water_volume = 150;
	handle->iface.recipe.milk_volume = 0;
}

/* Entry action for state 'Milling Beans'. */
static void enact_main_region_Make_Coffee_r_Milling_Beans(ProcessCoffee* handle)
{
	/* Entry action for state 'Milling Beans'. */
	processCoffee_setTimer(handle, (sc_eventid) &(handle->timeEvents.processCoffee_main_region_Make_Coffee_r_Milling_Beans_tev0_raised) , handle->iface.recipe.coffee_mass * 1000, bool_false);
	startMilling();
}

/* Entry action for state 'Brew Coffee'. */
static void enact_main_region_Make_Coffee_r_Brew_Coffee(ProcessCoffee* handle)
{
	/* Entry action for state 'Brew Coffee'. */
	processCoffee_setTimer(handle, (sc_eventid) &(handle->timeEvents.processCoffee_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised) , handle->iface.recipe.water_volume * 60, bool_false);
	startPumping();
}

/* Exit action for state 'Milling Beans'. */
static void exact_main_region_Make_Coffee_r_Milling_Beans(ProcessCoffee* handle)
{
	/* Exit action for state 'Milling Beans'. */
	processCoffee_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.processCoffee_main_region_Make_Coffee_r_Milling_Beans_tev0_raised) );		
	stopMilling();
}

/* Exit action for state 'Brew Coffee'. */
static void exact_main_region_Make_Coffee_r_Brew_Coffee(ProcessCoffee* handle)
{
	/* Exit action for state 'Brew Coffee'. */
	processCoffee_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.processCoffee_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised) );		
	stopPumping();
}

/* 'default' enter sequence for state Make Coffee */
static void enseq_main_region_Make_Coffee_default(ProcessCoffee* handle)
{
	/* 'default' enter sequence for state Make Coffee */
	processCoffee_stateEntered(handle, ProcessCoffee_main_region_Make_Coffee);
	enseq_main_region_Make_Coffee_r_default(handle);
}

/* 'default' enter sequence for state Milling Beans */
static void enseq_main_region_Make_Coffee_r_Milling_Beans_default(ProcessCoffee* handle)
{
	/* 'default' enter sequence for state Milling Beans */
	enact_main_region_Make_Coffee_r_Milling_Beans(handle);
	processCoffee_stateEntered(handle, ProcessCoffee_main_region_Make_Coffee_r_Milling_Beans);
	handle->stateConfVector[0] = ProcessCoffee_main_region_Make_Coffee_r_Milling_Beans;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Brew Coffee */
static void enseq_main_region_Make_Coffee_r_Brew_Coffee_default(ProcessCoffee* handle)
{
	/* 'default' enter sequence for state Brew Coffee */
	enact_main_region_Make_Coffee_r_Brew_Coffee(handle);
	processCoffee_stateEntered(handle, ProcessCoffee_main_region_Make_Coffee_r_Brew_Coffee);
	handle->stateConfVector[0] = ProcessCoffee_main_region_Make_Coffee_r_Brew_Coffee;
	handle->stateConfVectorPosition = 0;
}

/* Default enter sequence for state null */
static void enseq_main_region__final__default(ProcessCoffee* handle)
{
	/* Default enter sequence for state null */
	processCoffee_stateEntered(handle, ProcessCoffee_main_region__final_);
	handle->stateConfVector[0] = ProcessCoffee_main_region__final_;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for region main region */
static void enseq_main_region_default(ProcessCoffee* handle)
{
	/* 'default' enter sequence for region main region */
	react_main_region__entry_Default(handle);
}

/* 'default' enter sequence for region r */
static void enseq_main_region_Make_Coffee_r_default(ProcessCoffee* handle)
{
	/* 'default' enter sequence for region r */
	react_main_region_Make_Coffee_r__entry_Default(handle);
}

/* Default exit sequence for state Make Coffee */
static void exseq_main_region_Make_Coffee(ProcessCoffee* handle)
{
	/* Default exit sequence for state Make Coffee */
	exseq_main_region_Make_Coffee_r(handle);
	processCoffee_stateExited(handle, ProcessCoffee_main_region_Make_Coffee);
}

/* Default exit sequence for state Milling Beans */
static void exseq_main_region_Make_Coffee_r_Milling_Beans(ProcessCoffee* handle)
{
	/* Default exit sequence for state Milling Beans */
	handle->stateConfVector[0] = ProcessCoffee_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_region_Make_Coffee_r_Milling_Beans(handle);
	processCoffee_stateExited(handle, ProcessCoffee_main_region_Make_Coffee_r_Milling_Beans);
}

/* Default exit sequence for state Brew Coffee */
static void exseq_main_region_Make_Coffee_r_Brew_Coffee(ProcessCoffee* handle)
{
	/* Default exit sequence for state Brew Coffee */
	handle->stateConfVector[0] = ProcessCoffee_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_region_Make_Coffee_r_Brew_Coffee(handle);
	processCoffee_stateExited(handle, ProcessCoffee_main_region_Make_Coffee_r_Brew_Coffee);
}

/* Default exit sequence for final state. */
static void exseq_main_region__final_(ProcessCoffee* handle)
{
	/* Default exit sequence for final state. */
	handle->stateConfVector[0] = ProcessCoffee_last_state;
	handle->stateConfVectorPosition = 0;
	processCoffee_stateExited(handle, ProcessCoffee_main_region__final_);
}

/* Default exit sequence for region main region */
static void exseq_main_region(ProcessCoffee* handle)
{
	/* Default exit sequence for region main region */
	/* Handle exit of all possible states (of ProcessCoffee.main_region) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case ProcessCoffee_main_region_Make_Coffee_r_Milling_Beans :
		{
			exseq_main_region_Make_Coffee_r_Milling_Beans(handle);
			processCoffee_stateExited(handle, ProcessCoffee_main_region_Make_Coffee);
			break;
		}
		case ProcessCoffee_main_region_Make_Coffee_r_Brew_Coffee :
		{
			exseq_main_region_Make_Coffee_r_Brew_Coffee(handle);
			processCoffee_stateExited(handle, ProcessCoffee_main_region_Make_Coffee);
			break;
		}
		case ProcessCoffee_main_region__final_ :
		{
			exseq_main_region__final_(handle);
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
static void exseq_main_region_Make_Coffee_r(ProcessCoffee* handle)
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of ProcessCoffee.main_region.Make_Coffee.r) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case ProcessCoffee_main_region_Make_Coffee_r_Milling_Beans :
		{
			exseq_main_region_Make_Coffee_r_Milling_Beans(handle);
			break;
		}
		case ProcessCoffee_main_region_Make_Coffee_r_Brew_Coffee :
		{
			exseq_main_region_Make_Coffee_r_Brew_Coffee(handle);
			break;
		}
		default: break;
	}
}

/* The reactions of state Milling Beans. */
static void react_main_region_Make_Coffee_r_Milling_Beans(ProcessCoffee* handle)
{
	/* The reactions of state Milling Beans. */
	if (check_main_region_Make_Coffee_r_Milling_Beans_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_region_Make_Coffee_r_Milling_Beans_tr0(handle);
	} 
}

/* The reactions of state Brew Coffee. */
static void react_main_region_Make_Coffee_r_Brew_Coffee(ProcessCoffee* handle)
{
	/* The reactions of state Brew Coffee. */
	if (check_main_region_Make_Coffee_r_Brew_Coffee_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_region_Make_Coffee_r_Brew_Coffee_tr0(handle);
	} 
}

/* The reactions of state null. */
static void react_main_region__final_(ProcessCoffee* handle)
{
}

/* Default react sequence for initial entry  */
static void react_main_region__entry_Default(ProcessCoffee* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_region_Make_Coffee_default(handle);
}

/* Default react sequence for initial entry  */
static void react_main_region_Make_Coffee_r__entry_Default(ProcessCoffee* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_region_Make_Coffee_r_Milling_Beans_default(handle);
}

/* The reactions of exit default. */
static void react_main_region_Make_Coffee_r__exit_Default(ProcessCoffee* handle)
{
	/* The reactions of exit default. */
	effect_main_region_Make_Coffee_tr0(handle);
}


