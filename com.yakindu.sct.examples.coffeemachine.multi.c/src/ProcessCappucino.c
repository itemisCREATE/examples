
#include "ProcessCappucino.h"
#include "sc/sc_types.h"
#include "ProcessCappucinoRequired.h"

#include <stdlib.h>
#include <string.h>
/*! \file Implementation of the state machine 'ProcessCappucino'
*/

/* prototypes of all internal functions */
static sc_boolean check_main_region_Make_Coffee_r_Milling_Beans_tr0_tr0(const ProcessCappucino* handle);
static sc_boolean check_main_region_Make_Coffee_r_Brew_Coffee_tr0_tr0(const ProcessCappucino* handle);
static sc_boolean check_main_region_Make_Milk_r_Make_Steam_tr0_tr0(const ProcessCappucino* handle);
static void effect_main_region_Make_Coffee_tr0(ProcessCappucino* handle);
static void effect_main_region_Make_Coffee_r_Milling_Beans_tr0(ProcessCappucino* handle);
static void effect_main_region_Make_Coffee_r_Brew_Coffee_tr0(ProcessCappucino* handle);
static void effect_main_region_Make_Milk_tr0(ProcessCappucino* handle);
static void effect_main_region_Make_Milk_r_Make_Steam_tr0(ProcessCappucino* handle);
static void enact(ProcessCappucino* handle);
static void enact_main_region_Make_Coffee_r_Milling_Beans(ProcessCappucino* handle);
static void enact_main_region_Make_Coffee_r_Brew_Coffee(ProcessCappucino* handle);
static void enact_main_region_Make_Milk_r_Make_Steam(ProcessCappucino* handle);
static void exact_main_region_Make_Coffee_r_Milling_Beans(ProcessCappucino* handle);
static void exact_main_region_Make_Coffee_r_Brew_Coffee(ProcessCappucino* handle);
static void exact_main_region_Make_Milk_r_Make_Steam(ProcessCappucino* handle);
static void enseq_main_region_Make_Coffee_default(ProcessCappucino* handle);
static void enseq_main_region_Make_Coffee_r_Milling_Beans_default(ProcessCappucino* handle);
static void enseq_main_region_Make_Coffee_r_Brew_Coffee_default(ProcessCappucino* handle);
static void enseq_main_region_Make_Milk_default(ProcessCappucino* handle);
static void enseq_main_region_Make_Milk_r_Make_Steam_default(ProcessCappucino* handle);
static void enseq_main_region__final__default(ProcessCappucino* handle);
static void enseq_main_region_default(ProcessCappucino* handle);
static void enseq_main_region_Make_Coffee_r_default(ProcessCappucino* handle);
static void enseq_main_region_Make_Milk_r_default(ProcessCappucino* handle);
static void exseq_main_region_Make_Coffee(ProcessCappucino* handle);
static void exseq_main_region_Make_Coffee_r_Milling_Beans(ProcessCappucino* handle);
static void exseq_main_region_Make_Coffee_r_Brew_Coffee(ProcessCappucino* handle);
static void exseq_main_region_Make_Milk(ProcessCappucino* handle);
static void exseq_main_region_Make_Milk_r_Make_Steam(ProcessCappucino* handle);
static void exseq_main_region__final_(ProcessCappucino* handle);
static void exseq_main_region(ProcessCappucino* handle);
static void exseq_main_region_Make_Coffee_r(ProcessCappucino* handle);
static void exseq_main_region_Make_Milk_r(ProcessCappucino* handle);
static void react_main_region_Make_Coffee_r_Milling_Beans(ProcessCappucino* handle);
static void react_main_region_Make_Coffee_r_Brew_Coffee(ProcessCappucino* handle);
static void react_main_region_Make_Milk_r_Make_Steam(ProcessCappucino* handle);
static void react_main_region__final_(ProcessCappucino* handle);
static void react_main_region__entry_Default(ProcessCappucino* handle);
static void react_main_region_Make_Coffee_r__entry_Default(ProcessCappucino* handle);
static void react_main_region_Make_Milk_r__entry_Default(ProcessCappucino* handle);
static void react_main_region_Make_Coffee_r__exit_Default(ProcessCappucino* handle);
static void react_main_region_Make_Milk_r__exit_Default(ProcessCappucino* handle);
static void clearInEvents(ProcessCappucino* handle);
static void clearOutEvents(ProcessCappucino* handle);


void processCappucino_init(ProcessCappucino* handle)
{
		sc_integer i;
	
		for (i = 0; i < PROCESSCAPPUCINO_MAX_ORTHOGONAL_STATES; ++i)
		{
			handle->stateConfVector[i] = ProcessCappucino_last_state;
		}
		
		
		handle->stateConfVectorPosition = 0;
	
		clearInEvents(handle);
		clearOutEvents(handle);
	
}

void processCappucino_enter(ProcessCappucino* handle)
{
	/* Default enter sequence for statechart ProcessCappucino */
	enact(handle);
	enseq_main_region_default(handle);
}

void processCappucino_runCycle(ProcessCappucino* handle)
{
	clearOutEvents(handle);
	for (handle->stateConfVectorPosition = 0;
		handle->stateConfVectorPosition < PROCESSCAPPUCINO_MAX_ORTHOGONAL_STATES;
		handle->stateConfVectorPosition++)
		{
			
		switch (handle->stateConfVector[handle->stateConfVectorPosition])
		{
		case ProcessCappucino_main_region_Make_Coffee_r_Milling_Beans:
		{
			react_main_region_Make_Coffee_r_Milling_Beans(handle);
			break;
		}
		case ProcessCappucino_main_region_Make_Coffee_r_Brew_Coffee:
		{
			react_main_region_Make_Coffee_r_Brew_Coffee(handle);
			break;
		}
		case ProcessCappucino_main_region_Make_Milk_r_Make_Steam:
		{
			react_main_region_Make_Milk_r_Make_Steam(handle);
			break;
		}
		case ProcessCappucino_main_region__final_:
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

void processCappucino_exit(ProcessCappucino* handle)
{
	/* Default exit sequence for statechart ProcessCappucino */
	exseq_main_region(handle);
}

sc_boolean processCappucino_isActive(const ProcessCappucino* handle)
{
	sc_boolean result = bool_false;
	int i;
	
	for(i = 0; i < PROCESSCAPPUCINO_MAX_ORTHOGONAL_STATES; i++)
	{
		result = result || handle->stateConfVector[i] != ProcessCappucino_last_state;
	}
	
	return result;
}

sc_boolean processCappucino_isFinal(const ProcessCappucino* handle)
{
	return (handle->stateConfVector[0] == ProcessCappucino_main_region__final_);

}

void processCappucino_raiseTimeEvent(ProcessCappucino* handle, sc_eventid evid)
{
	if ( ((sc_intptr_t)evid) >= ((sc_intptr_t)&(handle->timeEvents))
		&&  ((sc_intptr_t)evid) < ((sc_intptr_t)&(handle->timeEvents)) + sizeof(ProcessCappucinoTimeEvents))
		{
		*(sc_boolean*)evid = bool_true;
	}		
}

sc_boolean processCappucino_isStateActive(const ProcessCappucino* handle, ProcessCappucinoStates state)
{
	sc_boolean result = bool_false;
	switch (state)
	{
		case ProcessCappucino_main_region_Make_Coffee :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSCAPPUCINO_MAIN_REGION_MAKE_COFFEE] >= ProcessCappucino_main_region_Make_Coffee
				&& handle->stateConfVector[SCVI_PROCESSCAPPUCINO_MAIN_REGION_MAKE_COFFEE] <= ProcessCappucino_main_region_Make_Coffee_r_Brew_Coffee);
			break;
		case ProcessCappucino_main_region_Make_Coffee_r_Milling_Beans :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSCAPPUCINO_MAIN_REGION_MAKE_COFFEE_R_MILLING_BEANS] == ProcessCappucino_main_region_Make_Coffee_r_Milling_Beans
			);
			break;
		case ProcessCappucino_main_region_Make_Coffee_r_Brew_Coffee :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSCAPPUCINO_MAIN_REGION_MAKE_COFFEE_R_BREW_COFFEE] == ProcessCappucino_main_region_Make_Coffee_r_Brew_Coffee
			);
			break;
		case ProcessCappucino_main_region_Make_Milk :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSCAPPUCINO_MAIN_REGION_MAKE_MILK] >= ProcessCappucino_main_region_Make_Milk
				&& handle->stateConfVector[SCVI_PROCESSCAPPUCINO_MAIN_REGION_MAKE_MILK] <= ProcessCappucino_main_region_Make_Milk_r_Make_Steam);
			break;
		case ProcessCappucino_main_region_Make_Milk_r_Make_Steam :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSCAPPUCINO_MAIN_REGION_MAKE_MILK_R_MAKE_STEAM] == ProcessCappucino_main_region_Make_Milk_r_Make_Steam
			);
			break;
		case ProcessCappucino_main_region__final_ :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSCAPPUCINO_MAIN_REGION__FINAL_] == ProcessCappucino_main_region__final_
			);
			break;
		default:
			result = bool_false;
			break;
	}
	return result;
}

static void clearInEvents(ProcessCappucino* handle)
{
	handle->timeEvents.processCappucino_main_region_Make_Coffee_r_Milling_Beans_tev0_raised = bool_false;
	handle->timeEvents.processCappucino_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised = bool_false;
	handle->timeEvents.processCappucino_main_region_Make_Milk_r_Make_Steam_tev0_raised = bool_false;
}

static void clearOutEvents(ProcessCappucino* handle)
{
}



cm_recipe_t processCappucinoIface_get_recipe(const ProcessCappucino* handle)
{
	return handle->iface.recipe;
}
void processCappucinoIface_set_recipe(ProcessCappucino* handle, cm_recipe_t value)
{
	handle->iface.recipe = value;
}

/* implementations of all internal functions */

static sc_boolean check_main_region_Make_Coffee_r_Milling_Beans_tr0_tr0(const ProcessCappucino* handle)
{
	return handle->timeEvents.processCappucino_main_region_Make_Coffee_r_Milling_Beans_tev0_raised;
}

static sc_boolean check_main_region_Make_Coffee_r_Brew_Coffee_tr0_tr0(const ProcessCappucino* handle)
{
	return handle->timeEvents.processCappucino_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised;
}

static sc_boolean check_main_region_Make_Milk_r_Make_Steam_tr0_tr0(const ProcessCappucino* handle)
{
	return handle->timeEvents.processCappucino_main_region_Make_Milk_r_Make_Steam_tev0_raised;
}

static void effect_main_region_Make_Coffee_tr0(ProcessCappucino* handle)
{
	exseq_main_region_Make_Coffee(handle);
	enseq_main_region_Make_Milk_default(handle);
}

static void effect_main_region_Make_Coffee_r_Milling_Beans_tr0(ProcessCappucino* handle)
{
	exseq_main_region_Make_Coffee_r_Milling_Beans(handle);
	enseq_main_region_Make_Coffee_r_Brew_Coffee_default(handle);
}

static void effect_main_region_Make_Coffee_r_Brew_Coffee_tr0(ProcessCappucino* handle)
{
	exseq_main_region_Make_Coffee_r_Brew_Coffee(handle);
	react_main_region_Make_Coffee_r__exit_Default(handle);
}

static void effect_main_region_Make_Milk_tr0(ProcessCappucino* handle)
{
	exseq_main_region_Make_Milk(handle);
	enseq_main_region__final__default(handle);
}

static void effect_main_region_Make_Milk_r_Make_Steam_tr0(ProcessCappucino* handle)
{
	exseq_main_region_Make_Milk_r_Make_Steam(handle);
	react_main_region_Make_Milk_r__exit_Default(handle);
}

/* Entry action for statechart 'ProcessCappucino'. */
static void enact(ProcessCappucino* handle)
{
	/* Entry action for statechart 'ProcessCappucino'. */
	handle->iface.recipe.coffee_mass = 6;
	handle->iface.recipe.water_volume = 100;
	handle->iface.recipe.milk_volume = 30;
}

/* Entry action for state 'Milling Beans'. */
static void enact_main_region_Make_Coffee_r_Milling_Beans(ProcessCappucino* handle)
{
	/* Entry action for state 'Milling Beans'. */
	processCappucino_setTimer(handle, (sc_eventid) &(handle->timeEvents.processCappucino_main_region_Make_Coffee_r_Milling_Beans_tev0_raised) , handle->iface.recipe.coffee_mass * 1000, bool_false);
	startMilling();
}

/* Entry action for state 'Brew Coffee'. */
static void enact_main_region_Make_Coffee_r_Brew_Coffee(ProcessCappucino* handle)
{
	/* Entry action for state 'Brew Coffee'. */
	processCappucino_setTimer(handle, (sc_eventid) &(handle->timeEvents.processCappucino_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised) , handle->iface.recipe.water_volume * 60, bool_false);
	startPumping();
}

/* Entry action for state 'Make Steam'. */
static void enact_main_region_Make_Milk_r_Make_Steam(ProcessCappucino* handle)
{
	/* Entry action for state 'Make Steam'. */
	processCappucino_setTimer(handle, (sc_eventid) &(handle->timeEvents.processCappucino_main_region_Make_Milk_r_Make_Steam_tev0_raised) , handle->iface.recipe.milk_volume * 60, bool_false);
}

/* Exit action for state 'Milling Beans'. */
static void exact_main_region_Make_Coffee_r_Milling_Beans(ProcessCappucino* handle)
{
	/* Exit action for state 'Milling Beans'. */
	processCappucino_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.processCappucino_main_region_Make_Coffee_r_Milling_Beans_tev0_raised) );		
	stopMilling();
}

/* Exit action for state 'Brew Coffee'. */
static void exact_main_region_Make_Coffee_r_Brew_Coffee(ProcessCappucino* handle)
{
	/* Exit action for state 'Brew Coffee'. */
	processCappucino_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.processCappucino_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised) );		
	stopPumping();
}

/* Exit action for state 'Make Steam'. */
static void exact_main_region_Make_Milk_r_Make_Steam(ProcessCappucino* handle)
{
	/* Exit action for state 'Make Steam'. */
	processCappucino_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.processCappucino_main_region_Make_Milk_r_Make_Steam_tev0_raised) );		
}

/* 'default' enter sequence for state Make Coffee */
static void enseq_main_region_Make_Coffee_default(ProcessCappucino* handle)
{
	/* 'default' enter sequence for state Make Coffee */
	processCappucino_stateEntered(handle, ProcessCappucino_main_region_Make_Coffee);
	enseq_main_region_Make_Coffee_r_default(handle);
}

/* 'default' enter sequence for state Milling Beans */
static void enseq_main_region_Make_Coffee_r_Milling_Beans_default(ProcessCappucino* handle)
{
	/* 'default' enter sequence for state Milling Beans */
	enact_main_region_Make_Coffee_r_Milling_Beans(handle);
	processCappucino_stateEntered(handle, ProcessCappucino_main_region_Make_Coffee_r_Milling_Beans);
	handle->stateConfVector[0] = ProcessCappucino_main_region_Make_Coffee_r_Milling_Beans;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Brew Coffee */
static void enseq_main_region_Make_Coffee_r_Brew_Coffee_default(ProcessCappucino* handle)
{
	/* 'default' enter sequence for state Brew Coffee */
	enact_main_region_Make_Coffee_r_Brew_Coffee(handle);
	processCappucino_stateEntered(handle, ProcessCappucino_main_region_Make_Coffee_r_Brew_Coffee);
	handle->stateConfVector[0] = ProcessCappucino_main_region_Make_Coffee_r_Brew_Coffee;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Make Milk */
static void enseq_main_region_Make_Milk_default(ProcessCappucino* handle)
{
	/* 'default' enter sequence for state Make Milk */
	processCappucino_stateEntered(handle, ProcessCappucino_main_region_Make_Milk);
	enseq_main_region_Make_Milk_r_default(handle);
}

/* 'default' enter sequence for state Make Steam */
static void enseq_main_region_Make_Milk_r_Make_Steam_default(ProcessCappucino* handle)
{
	/* 'default' enter sequence for state Make Steam */
	enact_main_region_Make_Milk_r_Make_Steam(handle);
	processCappucino_stateEntered(handle, ProcessCappucino_main_region_Make_Milk_r_Make_Steam);
	handle->stateConfVector[0] = ProcessCappucino_main_region_Make_Milk_r_Make_Steam;
	handle->stateConfVectorPosition = 0;
}

/* Default enter sequence for state null */
static void enseq_main_region__final__default(ProcessCappucino* handle)
{
	/* Default enter sequence for state null */
	processCappucino_stateEntered(handle, ProcessCappucino_main_region__final_);
	handle->stateConfVector[0] = ProcessCappucino_main_region__final_;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for region main region */
static void enseq_main_region_default(ProcessCappucino* handle)
{
	/* 'default' enter sequence for region main region */
	react_main_region__entry_Default(handle);
}

/* 'default' enter sequence for region r */
static void enseq_main_region_Make_Coffee_r_default(ProcessCappucino* handle)
{
	/* 'default' enter sequence for region r */
	react_main_region_Make_Coffee_r__entry_Default(handle);
}

/* 'default' enter sequence for region r */
static void enseq_main_region_Make_Milk_r_default(ProcessCappucino* handle)
{
	/* 'default' enter sequence for region r */
	react_main_region_Make_Milk_r__entry_Default(handle);
}

/* Default exit sequence for state Make Coffee */
static void exseq_main_region_Make_Coffee(ProcessCappucino* handle)
{
	/* Default exit sequence for state Make Coffee */
	exseq_main_region_Make_Coffee_r(handle);
	processCappucino_stateExited(handle, ProcessCappucino_main_region_Make_Coffee);
}

/* Default exit sequence for state Milling Beans */
static void exseq_main_region_Make_Coffee_r_Milling_Beans(ProcessCappucino* handle)
{
	/* Default exit sequence for state Milling Beans */
	handle->stateConfVector[0] = ProcessCappucino_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_region_Make_Coffee_r_Milling_Beans(handle);
	processCappucino_stateExited(handle, ProcessCappucino_main_region_Make_Coffee_r_Milling_Beans);
}

/* Default exit sequence for state Brew Coffee */
static void exseq_main_region_Make_Coffee_r_Brew_Coffee(ProcessCappucino* handle)
{
	/* Default exit sequence for state Brew Coffee */
	handle->stateConfVector[0] = ProcessCappucino_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_region_Make_Coffee_r_Brew_Coffee(handle);
	processCappucino_stateExited(handle, ProcessCappucino_main_region_Make_Coffee_r_Brew_Coffee);
}

/* Default exit sequence for state Make Milk */
static void exseq_main_region_Make_Milk(ProcessCappucino* handle)
{
	/* Default exit sequence for state Make Milk */
	exseq_main_region_Make_Milk_r(handle);
	processCappucino_stateExited(handle, ProcessCappucino_main_region_Make_Milk);
}

/* Default exit sequence for state Make Steam */
static void exseq_main_region_Make_Milk_r_Make_Steam(ProcessCappucino* handle)
{
	/* Default exit sequence for state Make Steam */
	handle->stateConfVector[0] = ProcessCappucino_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_region_Make_Milk_r_Make_Steam(handle);
	processCappucino_stateExited(handle, ProcessCappucino_main_region_Make_Milk_r_Make_Steam);
}

/* Default exit sequence for final state. */
static void exseq_main_region__final_(ProcessCappucino* handle)
{
	/* Default exit sequence for final state. */
	handle->stateConfVector[0] = ProcessCappucino_last_state;
	handle->stateConfVectorPosition = 0;
	processCappucino_stateExited(handle, ProcessCappucino_main_region__final_);
}

/* Default exit sequence for region main region */
static void exseq_main_region(ProcessCappucino* handle)
{
	/* Default exit sequence for region main region */
	/* Handle exit of all possible states (of ProcessCappucino.main_region) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case ProcessCappucino_main_region_Make_Coffee_r_Milling_Beans :
		{
			exseq_main_region_Make_Coffee_r_Milling_Beans(handle);
			processCappucino_stateExited(handle, ProcessCappucino_main_region_Make_Coffee);
			break;
		}
		case ProcessCappucino_main_region_Make_Coffee_r_Brew_Coffee :
		{
			exseq_main_region_Make_Coffee_r_Brew_Coffee(handle);
			processCappucino_stateExited(handle, ProcessCappucino_main_region_Make_Coffee);
			break;
		}
		case ProcessCappucino_main_region_Make_Milk_r_Make_Steam :
		{
			exseq_main_region_Make_Milk_r_Make_Steam(handle);
			processCappucino_stateExited(handle, ProcessCappucino_main_region_Make_Milk);
			break;
		}
		case ProcessCappucino_main_region__final_ :
		{
			exseq_main_region__final_(handle);
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
static void exseq_main_region_Make_Coffee_r(ProcessCappucino* handle)
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of ProcessCappucino.main_region.Make_Coffee.r) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case ProcessCappucino_main_region_Make_Coffee_r_Milling_Beans :
		{
			exseq_main_region_Make_Coffee_r_Milling_Beans(handle);
			break;
		}
		case ProcessCappucino_main_region_Make_Coffee_r_Brew_Coffee :
		{
			exseq_main_region_Make_Coffee_r_Brew_Coffee(handle);
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
static void exseq_main_region_Make_Milk_r(ProcessCappucino* handle)
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of ProcessCappucino.main_region.Make_Milk.r) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case ProcessCappucino_main_region_Make_Milk_r_Make_Steam :
		{
			exseq_main_region_Make_Milk_r_Make_Steam(handle);
			break;
		}
		default: break;
	}
}

/* The reactions of state Milling Beans. */
static void react_main_region_Make_Coffee_r_Milling_Beans(ProcessCappucino* handle)
{
	/* The reactions of state Milling Beans. */
	if (check_main_region_Make_Coffee_r_Milling_Beans_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_region_Make_Coffee_r_Milling_Beans_tr0(handle);
	} 
}

/* The reactions of state Brew Coffee. */
static void react_main_region_Make_Coffee_r_Brew_Coffee(ProcessCappucino* handle)
{
	/* The reactions of state Brew Coffee. */
	if (check_main_region_Make_Coffee_r_Brew_Coffee_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_region_Make_Coffee_r_Brew_Coffee_tr0(handle);
	} 
}

/* The reactions of state Make Steam. */
static void react_main_region_Make_Milk_r_Make_Steam(ProcessCappucino* handle)
{
	/* The reactions of state Make Steam. */
	if (check_main_region_Make_Milk_r_Make_Steam_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_region_Make_Milk_r_Make_Steam_tr0(handle);
	} 
}

/* The reactions of state null. */
static void react_main_region__final_(ProcessCappucino* handle)
{
}

/* Default react sequence for initial entry  */
static void react_main_region__entry_Default(ProcessCappucino* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_region_Make_Coffee_default(handle);
}

/* Default react sequence for initial entry  */
static void react_main_region_Make_Coffee_r__entry_Default(ProcessCappucino* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_region_Make_Coffee_r_Milling_Beans_default(handle);
}

/* Default react sequence for initial entry  */
static void react_main_region_Make_Milk_r__entry_Default(ProcessCappucino* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_region_Make_Milk_r_Make_Steam_default(handle);
}

/* The reactions of exit default. */
static void react_main_region_Make_Coffee_r__exit_Default(ProcessCappucino* handle)
{
	/* The reactions of exit default. */
	effect_main_region_Make_Coffee_tr0(handle);
}

/* The reactions of exit default. */
static void react_main_region_Make_Milk_r__exit_Default(ProcessCappucino* handle)
{
	/* The reactions of exit default. */
	effect_main_region_Make_Milk_tr0(handle);
}


