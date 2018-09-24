
#include "ProcessLatteMacchiato.h"
#include "sc/sc_types.h"
#include "ProcessLatteMacchiatoRequired.h"

#include <stdlib.h>
#include <string.h>
/*! \file Implementation of the state machine 'ProcessLatteMacchiato'
*/

/* prototypes of all internal functions */
static sc_boolean check_main_region_Make_Coffee_r_Milling_Beans_tr0_tr0(const ProcessLatteMacchiato* handle);
static sc_boolean check_main_region_Make_Coffee_r_Brew_Coffee_tr0_tr0(const ProcessLatteMacchiato* handle);
static sc_boolean check_main_region_Make_Milk_r_Make_Steam_tr0_tr0(const ProcessLatteMacchiato* handle);
static void effect_main_region_Make_Coffee_tr0(ProcessLatteMacchiato* handle);
static void effect_main_region_Make_Coffee_r_Milling_Beans_tr0(ProcessLatteMacchiato* handle);
static void effect_main_region_Make_Coffee_r_Brew_Coffee_tr0(ProcessLatteMacchiato* handle);
static void effect_main_region_Make_Milk_tr0(ProcessLatteMacchiato* handle);
static void effect_main_region_Make_Milk_r_Make_Steam_tr0(ProcessLatteMacchiato* handle);
static void enact(ProcessLatteMacchiato* handle);
static void enact_main_region_Make_Coffee_r_Milling_Beans(ProcessLatteMacchiato* handle);
static void enact_main_region_Make_Coffee_r_Brew_Coffee(ProcessLatteMacchiato* handle);
static void enact_main_region_Make_Milk_r_Make_Steam(ProcessLatteMacchiato* handle);
static void exact_main_region_Make_Coffee_r_Milling_Beans(ProcessLatteMacchiato* handle);
static void exact_main_region_Make_Coffee_r_Brew_Coffee(ProcessLatteMacchiato* handle);
static void exact_main_region_Make_Milk_r_Make_Steam(ProcessLatteMacchiato* handle);
static void enseq_main_region_Make_Coffee_default(ProcessLatteMacchiato* handle);
static void enseq_main_region_Make_Coffee_r_Milling_Beans_default(ProcessLatteMacchiato* handle);
static void enseq_main_region_Make_Coffee_r_Brew_Coffee_default(ProcessLatteMacchiato* handle);
static void enseq_main_region_Make_Milk_default(ProcessLatteMacchiato* handle);
static void enseq_main_region_Make_Milk_r_Make_Steam_default(ProcessLatteMacchiato* handle);
static void enseq_main_region__final__default(ProcessLatteMacchiato* handle);
static void enseq_main_region_default(ProcessLatteMacchiato* handle);
static void enseq_main_region_Make_Coffee_r_default(ProcessLatteMacchiato* handle);
static void enseq_main_region_Make_Milk_r_default(ProcessLatteMacchiato* handle);
static void exseq_main_region_Make_Coffee(ProcessLatteMacchiato* handle);
static void exseq_main_region_Make_Coffee_r_Milling_Beans(ProcessLatteMacchiato* handle);
static void exseq_main_region_Make_Coffee_r_Brew_Coffee(ProcessLatteMacchiato* handle);
static void exseq_main_region_Make_Milk(ProcessLatteMacchiato* handle);
static void exseq_main_region_Make_Milk_r_Make_Steam(ProcessLatteMacchiato* handle);
static void exseq_main_region__final_(ProcessLatteMacchiato* handle);
static void exseq_main_region(ProcessLatteMacchiato* handle);
static void exseq_main_region_Make_Coffee_r(ProcessLatteMacchiato* handle);
static void exseq_main_region_Make_Milk_r(ProcessLatteMacchiato* handle);
static void react_main_region_Make_Coffee_r_Milling_Beans(ProcessLatteMacchiato* handle);
static void react_main_region_Make_Coffee_r_Brew_Coffee(ProcessLatteMacchiato* handle);
static void react_main_region_Make_Milk_r_Make_Steam(ProcessLatteMacchiato* handle);
static void react_main_region__final_(ProcessLatteMacchiato* handle);
static void react_main_region__entry_Default(ProcessLatteMacchiato* handle);
static void react_main_region_Make_Coffee_r__entry_Default(ProcessLatteMacchiato* handle);
static void react_main_region_Make_Milk_r__entry_Default(ProcessLatteMacchiato* handle);
static void react_main_region_Make_Coffee_r__exit_Default(ProcessLatteMacchiato* handle);
static void react_main_region_Make_Milk_r__exit_Default(ProcessLatteMacchiato* handle);
static void clearInEvents(ProcessLatteMacchiato* handle);
static void clearOutEvents(ProcessLatteMacchiato* handle);


void processLatteMacchiato_init(ProcessLatteMacchiato* handle)
{
		sc_integer i;
	
		for (i = 0; i < PROCESSLATTEMACCHIATO_MAX_ORTHOGONAL_STATES; ++i)
		{
			handle->stateConfVector[i] = ProcessLatteMacchiato_last_state;
		}
		
		
		handle->stateConfVectorPosition = 0;
	
		clearInEvents(handle);
		clearOutEvents(handle);
	
}

void processLatteMacchiato_enter(ProcessLatteMacchiato* handle)
{
	/* Default enter sequence for statechart ProcessLatteMacchiato */
	enact(handle);
	enseq_main_region_default(handle);
}

void processLatteMacchiato_runCycle(ProcessLatteMacchiato* handle)
{
	clearOutEvents(handle);
	for (handle->stateConfVectorPosition = 0;
		handle->stateConfVectorPosition < PROCESSLATTEMACCHIATO_MAX_ORTHOGONAL_STATES;
		handle->stateConfVectorPosition++)
		{
			
		switch (handle->stateConfVector[handle->stateConfVectorPosition])
		{
		case ProcessLatteMacchiato_main_region_Make_Coffee_r_Milling_Beans:
		{
			react_main_region_Make_Coffee_r_Milling_Beans(handle);
			break;
		}
		case ProcessLatteMacchiato_main_region_Make_Coffee_r_Brew_Coffee:
		{
			react_main_region_Make_Coffee_r_Brew_Coffee(handle);
			break;
		}
		case ProcessLatteMacchiato_main_region_Make_Milk_r_Make_Steam:
		{
			react_main_region_Make_Milk_r_Make_Steam(handle);
			break;
		}
		case ProcessLatteMacchiato_main_region__final_:
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

void processLatteMacchiato_exit(ProcessLatteMacchiato* handle)
{
	/* Default exit sequence for statechart ProcessLatteMacchiato */
	exseq_main_region(handle);
}

sc_boolean processLatteMacchiato_isActive(const ProcessLatteMacchiato* handle)
{
	sc_boolean result = bool_false;
	int i;
	
	for(i = 0; i < PROCESSLATTEMACCHIATO_MAX_ORTHOGONAL_STATES; i++)
	{
		result = result || handle->stateConfVector[i] != ProcessLatteMacchiato_last_state;
	}
	
	return result;
}

sc_boolean processLatteMacchiato_isFinal(const ProcessLatteMacchiato* handle)
{
	return (handle->stateConfVector[0] == ProcessLatteMacchiato_main_region__final_);

}

void processLatteMacchiato_raiseTimeEvent(ProcessLatteMacchiato* handle, sc_eventid evid)
{
	if ( ((sc_intptr_t)evid) >= ((sc_intptr_t)&(handle->timeEvents))
		&&  ((sc_intptr_t)evid) < ((sc_intptr_t)&(handle->timeEvents)) + sizeof(ProcessLatteMacchiatoTimeEvents))
		{
		*(sc_boolean*)evid = bool_true;
	}		
}

sc_boolean processLatteMacchiato_isStateActive(const ProcessLatteMacchiato* handle, ProcessLatteMacchiatoStates state)
{
	sc_boolean result = bool_false;
	switch (state)
	{
		case ProcessLatteMacchiato_main_region_Make_Coffee :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSLATTEMACCHIATO_MAIN_REGION_MAKE_COFFEE] >= ProcessLatteMacchiato_main_region_Make_Coffee
				&& handle->stateConfVector[SCVI_PROCESSLATTEMACCHIATO_MAIN_REGION_MAKE_COFFEE] <= ProcessLatteMacchiato_main_region_Make_Coffee_r_Brew_Coffee);
			break;
		case ProcessLatteMacchiato_main_region_Make_Coffee_r_Milling_Beans :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSLATTEMACCHIATO_MAIN_REGION_MAKE_COFFEE_R_MILLING_BEANS] == ProcessLatteMacchiato_main_region_Make_Coffee_r_Milling_Beans
			);
			break;
		case ProcessLatteMacchiato_main_region_Make_Coffee_r_Brew_Coffee :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSLATTEMACCHIATO_MAIN_REGION_MAKE_COFFEE_R_BREW_COFFEE] == ProcessLatteMacchiato_main_region_Make_Coffee_r_Brew_Coffee
			);
			break;
		case ProcessLatteMacchiato_main_region_Make_Milk :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSLATTEMACCHIATO_MAIN_REGION_MAKE_MILK] >= ProcessLatteMacchiato_main_region_Make_Milk
				&& handle->stateConfVector[SCVI_PROCESSLATTEMACCHIATO_MAIN_REGION_MAKE_MILK] <= ProcessLatteMacchiato_main_region_Make_Milk_r_Make_Steam);
			break;
		case ProcessLatteMacchiato_main_region_Make_Milk_r_Make_Steam :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSLATTEMACCHIATO_MAIN_REGION_MAKE_MILK_R_MAKE_STEAM] == ProcessLatteMacchiato_main_region_Make_Milk_r_Make_Steam
			);
			break;
		case ProcessLatteMacchiato_main_region__final_ :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSLATTEMACCHIATO_MAIN_REGION__FINAL_] == ProcessLatteMacchiato_main_region__final_
			);
			break;
		default:
			result = bool_false;
			break;
	}
	return result;
}

static void clearInEvents(ProcessLatteMacchiato* handle)
{
	handle->timeEvents.processLatteMacchiato_main_region_Make_Coffee_r_Milling_Beans_tev0_raised = bool_false;
	handle->timeEvents.processLatteMacchiato_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised = bool_false;
	handle->timeEvents.processLatteMacchiato_main_region_Make_Milk_r_Make_Steam_tev0_raised = bool_false;
}

static void clearOutEvents(ProcessLatteMacchiato* handle)
{
}



cm_recipe_t processLatteMacchiatoIface_get_recipe(const ProcessLatteMacchiato* handle)
{
	return handle->iface.recipe;
}
void processLatteMacchiatoIface_set_recipe(ProcessLatteMacchiato* handle, cm_recipe_t value)
{
	handle->iface.recipe = value;
}

/* implementations of all internal functions */

static sc_boolean check_main_region_Make_Coffee_r_Milling_Beans_tr0_tr0(const ProcessLatteMacchiato* handle)
{
	return handle->timeEvents.processLatteMacchiato_main_region_Make_Coffee_r_Milling_Beans_tev0_raised;
}

static sc_boolean check_main_region_Make_Coffee_r_Brew_Coffee_tr0_tr0(const ProcessLatteMacchiato* handle)
{
	return handle->timeEvents.processLatteMacchiato_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised;
}

static sc_boolean check_main_region_Make_Milk_r_Make_Steam_tr0_tr0(const ProcessLatteMacchiato* handle)
{
	return handle->timeEvents.processLatteMacchiato_main_region_Make_Milk_r_Make_Steam_tev0_raised;
}

static void effect_main_region_Make_Coffee_tr0(ProcessLatteMacchiato* handle)
{
	exseq_main_region_Make_Coffee(handle);
	enseq_main_region__final__default(handle);
}

static void effect_main_region_Make_Coffee_r_Milling_Beans_tr0(ProcessLatteMacchiato* handle)
{
	exseq_main_region_Make_Coffee_r_Milling_Beans(handle);
	enseq_main_region_Make_Coffee_r_Brew_Coffee_default(handle);
}

static void effect_main_region_Make_Coffee_r_Brew_Coffee_tr0(ProcessLatteMacchiato* handle)
{
	exseq_main_region_Make_Coffee_r_Brew_Coffee(handle);
	react_main_region_Make_Coffee_r__exit_Default(handle);
}

static void effect_main_region_Make_Milk_tr0(ProcessLatteMacchiato* handle)
{
	exseq_main_region_Make_Milk(handle);
	enseq_main_region_Make_Coffee_default(handle);
}

static void effect_main_region_Make_Milk_r_Make_Steam_tr0(ProcessLatteMacchiato* handle)
{
	exseq_main_region_Make_Milk_r_Make_Steam(handle);
	react_main_region_Make_Milk_r__exit_Default(handle);
}

/* Entry action for statechart 'ProcessLatteMacchiato'. */
static void enact(ProcessLatteMacchiato* handle)
{
	/* Entry action for statechart 'ProcessLatteMacchiato'. */
	handle->iface.recipe.coffee_mass = 10;
	handle->iface.recipe.water_volume = 80;
	handle->iface.recipe.milk_volume = 120;
}

/* Entry action for state 'Milling Beans'. */
static void enact_main_region_Make_Coffee_r_Milling_Beans(ProcessLatteMacchiato* handle)
{
	/* Entry action for state 'Milling Beans'. */
	processLatteMacchiato_setTimer(handle, (sc_eventid) &(handle->timeEvents.processLatteMacchiato_main_region_Make_Coffee_r_Milling_Beans_tev0_raised) , handle->iface.recipe.coffee_mass * 1000, bool_false);
	startMilling();
}

/* Entry action for state 'Brew Coffee'. */
static void enact_main_region_Make_Coffee_r_Brew_Coffee(ProcessLatteMacchiato* handle)
{
	/* Entry action for state 'Brew Coffee'. */
	processLatteMacchiato_setTimer(handle, (sc_eventid) &(handle->timeEvents.processLatteMacchiato_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised) , handle->iface.recipe.water_volume * 60, bool_false);
	startPumping();
}

/* Entry action for state 'Make Steam'. */
static void enact_main_region_Make_Milk_r_Make_Steam(ProcessLatteMacchiato* handle)
{
	/* Entry action for state 'Make Steam'. */
	processLatteMacchiato_setTimer(handle, (sc_eventid) &(handle->timeEvents.processLatteMacchiato_main_region_Make_Milk_r_Make_Steam_tev0_raised) , handle->iface.recipe.milk_volume * 60, bool_false);
}

/* Exit action for state 'Milling Beans'. */
static void exact_main_region_Make_Coffee_r_Milling_Beans(ProcessLatteMacchiato* handle)
{
	/* Exit action for state 'Milling Beans'. */
	processLatteMacchiato_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.processLatteMacchiato_main_region_Make_Coffee_r_Milling_Beans_tev0_raised) );		
	stopMilling();
}

/* Exit action for state 'Brew Coffee'. */
static void exact_main_region_Make_Coffee_r_Brew_Coffee(ProcessLatteMacchiato* handle)
{
	/* Exit action for state 'Brew Coffee'. */
	processLatteMacchiato_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.processLatteMacchiato_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised) );		
	stopPumping();
}

/* Exit action for state 'Make Steam'. */
static void exact_main_region_Make_Milk_r_Make_Steam(ProcessLatteMacchiato* handle)
{
	/* Exit action for state 'Make Steam'. */
	processLatteMacchiato_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.processLatteMacchiato_main_region_Make_Milk_r_Make_Steam_tev0_raised) );		
}

/* 'default' enter sequence for state Make Coffee */
static void enseq_main_region_Make_Coffee_default(ProcessLatteMacchiato* handle)
{
	/* 'default' enter sequence for state Make Coffee */
	processLatteMacchiato_stateEntered(handle, ProcessLatteMacchiato_main_region_Make_Coffee);
	enseq_main_region_Make_Coffee_r_default(handle);
}

/* 'default' enter sequence for state Milling Beans */
static void enseq_main_region_Make_Coffee_r_Milling_Beans_default(ProcessLatteMacchiato* handle)
{
	/* 'default' enter sequence for state Milling Beans */
	enact_main_region_Make_Coffee_r_Milling_Beans(handle);
	processLatteMacchiato_stateEntered(handle, ProcessLatteMacchiato_main_region_Make_Coffee_r_Milling_Beans);
	handle->stateConfVector[0] = ProcessLatteMacchiato_main_region_Make_Coffee_r_Milling_Beans;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Brew Coffee */
static void enseq_main_region_Make_Coffee_r_Brew_Coffee_default(ProcessLatteMacchiato* handle)
{
	/* 'default' enter sequence for state Brew Coffee */
	enact_main_region_Make_Coffee_r_Brew_Coffee(handle);
	processLatteMacchiato_stateEntered(handle, ProcessLatteMacchiato_main_region_Make_Coffee_r_Brew_Coffee);
	handle->stateConfVector[0] = ProcessLatteMacchiato_main_region_Make_Coffee_r_Brew_Coffee;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Make Milk */
static void enseq_main_region_Make_Milk_default(ProcessLatteMacchiato* handle)
{
	/* 'default' enter sequence for state Make Milk */
	processLatteMacchiato_stateEntered(handle, ProcessLatteMacchiato_main_region_Make_Milk);
	enseq_main_region_Make_Milk_r_default(handle);
}

/* 'default' enter sequence for state Make Steam */
static void enseq_main_region_Make_Milk_r_Make_Steam_default(ProcessLatteMacchiato* handle)
{
	/* 'default' enter sequence for state Make Steam */
	enact_main_region_Make_Milk_r_Make_Steam(handle);
	processLatteMacchiato_stateEntered(handle, ProcessLatteMacchiato_main_region_Make_Milk_r_Make_Steam);
	handle->stateConfVector[0] = ProcessLatteMacchiato_main_region_Make_Milk_r_Make_Steam;
	handle->stateConfVectorPosition = 0;
}

/* Default enter sequence for state null */
static void enseq_main_region__final__default(ProcessLatteMacchiato* handle)
{
	/* Default enter sequence for state null */
	processLatteMacchiato_stateEntered(handle, ProcessLatteMacchiato_main_region__final_);
	handle->stateConfVector[0] = ProcessLatteMacchiato_main_region__final_;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for region main region */
static void enseq_main_region_default(ProcessLatteMacchiato* handle)
{
	/* 'default' enter sequence for region main region */
	react_main_region__entry_Default(handle);
}

/* 'default' enter sequence for region r */
static void enseq_main_region_Make_Coffee_r_default(ProcessLatteMacchiato* handle)
{
	/* 'default' enter sequence for region r */
	react_main_region_Make_Coffee_r__entry_Default(handle);
}

/* 'default' enter sequence for region r */
static void enseq_main_region_Make_Milk_r_default(ProcessLatteMacchiato* handle)
{
	/* 'default' enter sequence for region r */
	react_main_region_Make_Milk_r__entry_Default(handle);
}

/* Default exit sequence for state Make Coffee */
static void exseq_main_region_Make_Coffee(ProcessLatteMacchiato* handle)
{
	/* Default exit sequence for state Make Coffee */
	exseq_main_region_Make_Coffee_r(handle);
	processLatteMacchiato_stateExited(handle, ProcessLatteMacchiato_main_region_Make_Coffee);
}

/* Default exit sequence for state Milling Beans */
static void exseq_main_region_Make_Coffee_r_Milling_Beans(ProcessLatteMacchiato* handle)
{
	/* Default exit sequence for state Milling Beans */
	handle->stateConfVector[0] = ProcessLatteMacchiato_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_region_Make_Coffee_r_Milling_Beans(handle);
	processLatteMacchiato_stateExited(handle, ProcessLatteMacchiato_main_region_Make_Coffee_r_Milling_Beans);
}

/* Default exit sequence for state Brew Coffee */
static void exseq_main_region_Make_Coffee_r_Brew_Coffee(ProcessLatteMacchiato* handle)
{
	/* Default exit sequence for state Brew Coffee */
	handle->stateConfVector[0] = ProcessLatteMacchiato_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_region_Make_Coffee_r_Brew_Coffee(handle);
	processLatteMacchiato_stateExited(handle, ProcessLatteMacchiato_main_region_Make_Coffee_r_Brew_Coffee);
}

/* Default exit sequence for state Make Milk */
static void exseq_main_region_Make_Milk(ProcessLatteMacchiato* handle)
{
	/* Default exit sequence for state Make Milk */
	exseq_main_region_Make_Milk_r(handle);
	processLatteMacchiato_stateExited(handle, ProcessLatteMacchiato_main_region_Make_Milk);
}

/* Default exit sequence for state Make Steam */
static void exseq_main_region_Make_Milk_r_Make_Steam(ProcessLatteMacchiato* handle)
{
	/* Default exit sequence for state Make Steam */
	handle->stateConfVector[0] = ProcessLatteMacchiato_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_region_Make_Milk_r_Make_Steam(handle);
	processLatteMacchiato_stateExited(handle, ProcessLatteMacchiato_main_region_Make_Milk_r_Make_Steam);
}

/* Default exit sequence for final state. */
static void exseq_main_region__final_(ProcessLatteMacchiato* handle)
{
	/* Default exit sequence for final state. */
	handle->stateConfVector[0] = ProcessLatteMacchiato_last_state;
	handle->stateConfVectorPosition = 0;
	processLatteMacchiato_stateExited(handle, ProcessLatteMacchiato_main_region__final_);
}

/* Default exit sequence for region main region */
static void exseq_main_region(ProcessLatteMacchiato* handle)
{
	/* Default exit sequence for region main region */
	/* Handle exit of all possible states (of ProcessLatteMacchiato.main_region) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case ProcessLatteMacchiato_main_region_Make_Coffee_r_Milling_Beans :
		{
			exseq_main_region_Make_Coffee_r_Milling_Beans(handle);
			processLatteMacchiato_stateExited(handle, ProcessLatteMacchiato_main_region_Make_Coffee);
			break;
		}
		case ProcessLatteMacchiato_main_region_Make_Coffee_r_Brew_Coffee :
		{
			exseq_main_region_Make_Coffee_r_Brew_Coffee(handle);
			processLatteMacchiato_stateExited(handle, ProcessLatteMacchiato_main_region_Make_Coffee);
			break;
		}
		case ProcessLatteMacchiato_main_region_Make_Milk_r_Make_Steam :
		{
			exseq_main_region_Make_Milk_r_Make_Steam(handle);
			processLatteMacchiato_stateExited(handle, ProcessLatteMacchiato_main_region_Make_Milk);
			break;
		}
		case ProcessLatteMacchiato_main_region__final_ :
		{
			exseq_main_region__final_(handle);
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
static void exseq_main_region_Make_Coffee_r(ProcessLatteMacchiato* handle)
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of ProcessLatteMacchiato.main_region.Make_Coffee.r) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case ProcessLatteMacchiato_main_region_Make_Coffee_r_Milling_Beans :
		{
			exseq_main_region_Make_Coffee_r_Milling_Beans(handle);
			break;
		}
		case ProcessLatteMacchiato_main_region_Make_Coffee_r_Brew_Coffee :
		{
			exseq_main_region_Make_Coffee_r_Brew_Coffee(handle);
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
static void exseq_main_region_Make_Milk_r(ProcessLatteMacchiato* handle)
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of ProcessLatteMacchiato.main_region.Make_Milk.r) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case ProcessLatteMacchiato_main_region_Make_Milk_r_Make_Steam :
		{
			exseq_main_region_Make_Milk_r_Make_Steam(handle);
			break;
		}
		default: break;
	}
}

/* The reactions of state Milling Beans. */
static void react_main_region_Make_Coffee_r_Milling_Beans(ProcessLatteMacchiato* handle)
{
	/* The reactions of state Milling Beans. */
	if (check_main_region_Make_Coffee_r_Milling_Beans_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_region_Make_Coffee_r_Milling_Beans_tr0(handle);
	} 
}

/* The reactions of state Brew Coffee. */
static void react_main_region_Make_Coffee_r_Brew_Coffee(ProcessLatteMacchiato* handle)
{
	/* The reactions of state Brew Coffee. */
	if (check_main_region_Make_Coffee_r_Brew_Coffee_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_region_Make_Coffee_r_Brew_Coffee_tr0(handle);
	} 
}

/* The reactions of state Make Steam. */
static void react_main_region_Make_Milk_r_Make_Steam(ProcessLatteMacchiato* handle)
{
	/* The reactions of state Make Steam. */
	if (check_main_region_Make_Milk_r_Make_Steam_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_region_Make_Milk_r_Make_Steam_tr0(handle);
	} 
}

/* The reactions of state null. */
static void react_main_region__final_(ProcessLatteMacchiato* handle)
{
}

/* Default react sequence for initial entry  */
static void react_main_region__entry_Default(ProcessLatteMacchiato* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_region_Make_Milk_default(handle);
}

/* Default react sequence for initial entry  */
static void react_main_region_Make_Coffee_r__entry_Default(ProcessLatteMacchiato* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_region_Make_Coffee_r_Milling_Beans_default(handle);
}

/* Default react sequence for initial entry  */
static void react_main_region_Make_Milk_r__entry_Default(ProcessLatteMacchiato* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_region_Make_Milk_r_Make_Steam_default(handle);
}

/* The reactions of exit default. */
static void react_main_region_Make_Coffee_r__exit_Default(ProcessLatteMacchiato* handle)
{
	/* The reactions of exit default. */
	effect_main_region_Make_Coffee_tr0(handle);
}

/* The reactions of exit default. */
static void react_main_region_Make_Milk_r__exit_Default(ProcessLatteMacchiato* handle)
{
	/* The reactions of exit default. */
	effect_main_region_Make_Milk_tr0(handle);
}


