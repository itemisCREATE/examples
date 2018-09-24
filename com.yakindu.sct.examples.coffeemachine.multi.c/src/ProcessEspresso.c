
#include "ProcessEspresso.h"
#include "sc/sc_types.h"
#include "ProcessEspressoRequired.h"

#include <stdlib.h>
#include <string.h>
/*! \file Implementation of the state machine 'ProcessEspresso'
*/

/* prototypes of all internal functions */
static sc_boolean check_main_region_Make_Coffee_r_Milling_Beans_tr0_tr0(const ProcessEspresso* handle);
static sc_boolean check_main_region_Make_Coffee_r_Brew_Coffee_tr0_tr0(const ProcessEspresso* handle);
static void effect_main_region_Make_Coffee_tr0(ProcessEspresso* handle);
static void effect_main_region_Make_Coffee_r_Milling_Beans_tr0(ProcessEspresso* handle);
static void effect_main_region_Make_Coffee_r_Brew_Coffee_tr0(ProcessEspresso* handle);
static void enact(ProcessEspresso* handle);
static void enact_main_region_Make_Coffee_r_Milling_Beans(ProcessEspresso* handle);
static void enact_main_region_Make_Coffee_r_Brew_Coffee(ProcessEspresso* handle);
static void exact_main_region_Make_Coffee_r_Milling_Beans(ProcessEspresso* handle);
static void exact_main_region_Make_Coffee_r_Brew_Coffee(ProcessEspresso* handle);
static void enseq_main_region_Make_Coffee_default(ProcessEspresso* handle);
static void enseq_main_region_Make_Coffee_r_Milling_Beans_default(ProcessEspresso* handle);
static void enseq_main_region_Make_Coffee_r_Brew_Coffee_default(ProcessEspresso* handle);
static void enseq_main_region__final__default(ProcessEspresso* handle);
static void enseq_main_region_default(ProcessEspresso* handle);
static void enseq_main_region_Make_Coffee_r_default(ProcessEspresso* handle);
static void exseq_main_region_Make_Coffee(ProcessEspresso* handle);
static void exseq_main_region_Make_Coffee_r_Milling_Beans(ProcessEspresso* handle);
static void exseq_main_region_Make_Coffee_r_Brew_Coffee(ProcessEspresso* handle);
static void exseq_main_region__final_(ProcessEspresso* handle);
static void exseq_main_region(ProcessEspresso* handle);
static void exseq_main_region_Make_Coffee_r(ProcessEspresso* handle);
static void react_main_region_Make_Coffee_r_Milling_Beans(ProcessEspresso* handle);
static void react_main_region_Make_Coffee_r_Brew_Coffee(ProcessEspresso* handle);
static void react_main_region__final_(ProcessEspresso* handle);
static void react_main_region__entry_Default(ProcessEspresso* handle);
static void react_main_region_Make_Coffee_r__entry_Default(ProcessEspresso* handle);
static void react_main_region_Make_Coffee_r__exit_Default(ProcessEspresso* handle);
static void clearInEvents(ProcessEspresso* handle);
static void clearOutEvents(ProcessEspresso* handle);


void processEspresso_init(ProcessEspresso* handle)
{
		sc_integer i;
	
		for (i = 0; i < PROCESSESPRESSO_MAX_ORTHOGONAL_STATES; ++i)
		{
			handle->stateConfVector[i] = ProcessEspresso_last_state;
		}
		
		
		handle->stateConfVectorPosition = 0;
	
		clearInEvents(handle);
		clearOutEvents(handle);
	
}

void processEspresso_enter(ProcessEspresso* handle)
{
	/* Default enter sequence for statechart ProcessEspresso */
	enact(handle);
	enseq_main_region_default(handle);
}

void processEspresso_runCycle(ProcessEspresso* handle)
{
	clearOutEvents(handle);
	for (handle->stateConfVectorPosition = 0;
		handle->stateConfVectorPosition < PROCESSESPRESSO_MAX_ORTHOGONAL_STATES;
		handle->stateConfVectorPosition++)
		{
			
		switch (handle->stateConfVector[handle->stateConfVectorPosition])
		{
		case ProcessEspresso_main_region_Make_Coffee_r_Milling_Beans:
		{
			react_main_region_Make_Coffee_r_Milling_Beans(handle);
			break;
		}
		case ProcessEspresso_main_region_Make_Coffee_r_Brew_Coffee:
		{
			react_main_region_Make_Coffee_r_Brew_Coffee(handle);
			break;
		}
		case ProcessEspresso_main_region__final_:
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

void processEspresso_exit(ProcessEspresso* handle)
{
	/* Default exit sequence for statechart ProcessEspresso */
	exseq_main_region(handle);
}

sc_boolean processEspresso_isActive(const ProcessEspresso* handle)
{
	sc_boolean result = bool_false;
	int i;
	
	for(i = 0; i < PROCESSESPRESSO_MAX_ORTHOGONAL_STATES; i++)
	{
		result = result || handle->stateConfVector[i] != ProcessEspresso_last_state;
	}
	
	return result;
}

sc_boolean processEspresso_isFinal(const ProcessEspresso* handle)
{
	return (handle->stateConfVector[0] == ProcessEspresso_main_region__final_);

}

void processEspresso_raiseTimeEvent(ProcessEspresso* handle, sc_eventid evid)
{
	if ( ((sc_intptr_t)evid) >= ((sc_intptr_t)&(handle->timeEvents))
		&&  ((sc_intptr_t)evid) < ((sc_intptr_t)&(handle->timeEvents)) + sizeof(ProcessEspressoTimeEvents))
		{
		*(sc_boolean*)evid = bool_true;
	}		
}

sc_boolean processEspresso_isStateActive(const ProcessEspresso* handle, ProcessEspressoStates state)
{
	sc_boolean result = bool_false;
	switch (state)
	{
		case ProcessEspresso_main_region_Make_Coffee :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSESPRESSO_MAIN_REGION_MAKE_COFFEE] >= ProcessEspresso_main_region_Make_Coffee
				&& handle->stateConfVector[SCVI_PROCESSESPRESSO_MAIN_REGION_MAKE_COFFEE] <= ProcessEspresso_main_region_Make_Coffee_r_Brew_Coffee);
			break;
		case ProcessEspresso_main_region_Make_Coffee_r_Milling_Beans :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSESPRESSO_MAIN_REGION_MAKE_COFFEE_R_MILLING_BEANS] == ProcessEspresso_main_region_Make_Coffee_r_Milling_Beans
			);
			break;
		case ProcessEspresso_main_region_Make_Coffee_r_Brew_Coffee :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSESPRESSO_MAIN_REGION_MAKE_COFFEE_R_BREW_COFFEE] == ProcessEspresso_main_region_Make_Coffee_r_Brew_Coffee
			);
			break;
		case ProcessEspresso_main_region__final_ :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSESPRESSO_MAIN_REGION__FINAL_] == ProcessEspresso_main_region__final_
			);
			break;
		default:
			result = bool_false;
			break;
	}
	return result;
}

static void clearInEvents(ProcessEspresso* handle)
{
	handle->timeEvents.processEspresso_main_region_Make_Coffee_r_Milling_Beans_tev0_raised = bool_false;
	handle->timeEvents.processEspresso_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised = bool_false;
}

static void clearOutEvents(ProcessEspresso* handle)
{
}



cm_recipe_t processEspressoIface_get_recipe(const ProcessEspresso* handle)
{
	return handle->iface.recipe;
}
void processEspressoIface_set_recipe(ProcessEspresso* handle, cm_recipe_t value)
{
	handle->iface.recipe = value;
}

/* implementations of all internal functions */

static sc_boolean check_main_region_Make_Coffee_r_Milling_Beans_tr0_tr0(const ProcessEspresso* handle)
{
	return handle->timeEvents.processEspresso_main_region_Make_Coffee_r_Milling_Beans_tev0_raised;
}

static sc_boolean check_main_region_Make_Coffee_r_Brew_Coffee_tr0_tr0(const ProcessEspresso* handle)
{
	return handle->timeEvents.processEspresso_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised;
}

static void effect_main_region_Make_Coffee_tr0(ProcessEspresso* handle)
{
	exseq_main_region_Make_Coffee(handle);
	enseq_main_region__final__default(handle);
}

static void effect_main_region_Make_Coffee_r_Milling_Beans_tr0(ProcessEspresso* handle)
{
	exseq_main_region_Make_Coffee_r_Milling_Beans(handle);
	enseq_main_region_Make_Coffee_r_Brew_Coffee_default(handle);
}

static void effect_main_region_Make_Coffee_r_Brew_Coffee_tr0(ProcessEspresso* handle)
{
	exseq_main_region_Make_Coffee_r_Brew_Coffee(handle);
	react_main_region_Make_Coffee_r__exit_Default(handle);
}

/* Entry action for statechart 'ProcessEspresso'. */
static void enact(ProcessEspresso* handle)
{
	/* Entry action for statechart 'ProcessEspresso'. */
	handle->iface.recipe.coffee_mass = 10;
	handle->iface.recipe.water_volume = 30;
	handle->iface.recipe.milk_volume = 0;
}

/* Entry action for state 'Milling Beans'. */
static void enact_main_region_Make_Coffee_r_Milling_Beans(ProcessEspresso* handle)
{
	/* Entry action for state 'Milling Beans'. */
	processEspresso_setTimer(handle, (sc_eventid) &(handle->timeEvents.processEspresso_main_region_Make_Coffee_r_Milling_Beans_tev0_raised) , handle->iface.recipe.coffee_mass * 1000, bool_false);
	startMilling();
}

/* Entry action for state 'Brew Coffee'. */
static void enact_main_region_Make_Coffee_r_Brew_Coffee(ProcessEspresso* handle)
{
	/* Entry action for state 'Brew Coffee'. */
	processEspresso_setTimer(handle, (sc_eventid) &(handle->timeEvents.processEspresso_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised) , handle->iface.recipe.water_volume * 60, bool_false);
	startPumping();
}

/* Exit action for state 'Milling Beans'. */
static void exact_main_region_Make_Coffee_r_Milling_Beans(ProcessEspresso* handle)
{
	/* Exit action for state 'Milling Beans'. */
	processEspresso_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.processEspresso_main_region_Make_Coffee_r_Milling_Beans_tev0_raised) );		
	stopMilling();
}

/* Exit action for state 'Brew Coffee'. */
static void exact_main_region_Make_Coffee_r_Brew_Coffee(ProcessEspresso* handle)
{
	/* Exit action for state 'Brew Coffee'. */
	processEspresso_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.processEspresso_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised) );		
	stopPumping();
}

/* 'default' enter sequence for state Make Coffee */
static void enseq_main_region_Make_Coffee_default(ProcessEspresso* handle)
{
	/* 'default' enter sequence for state Make Coffee */
	processEspresso_stateEntered(handle, ProcessEspresso_main_region_Make_Coffee);
	enseq_main_region_Make_Coffee_r_default(handle);
}

/* 'default' enter sequence for state Milling Beans */
static void enseq_main_region_Make_Coffee_r_Milling_Beans_default(ProcessEspresso* handle)
{
	/* 'default' enter sequence for state Milling Beans */
	enact_main_region_Make_Coffee_r_Milling_Beans(handle);
	processEspresso_stateEntered(handle, ProcessEspresso_main_region_Make_Coffee_r_Milling_Beans);
	handle->stateConfVector[0] = ProcessEspresso_main_region_Make_Coffee_r_Milling_Beans;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Brew Coffee */
static void enseq_main_region_Make_Coffee_r_Brew_Coffee_default(ProcessEspresso* handle)
{
	/* 'default' enter sequence for state Brew Coffee */
	enact_main_region_Make_Coffee_r_Brew_Coffee(handle);
	processEspresso_stateEntered(handle, ProcessEspresso_main_region_Make_Coffee_r_Brew_Coffee);
	handle->stateConfVector[0] = ProcessEspresso_main_region_Make_Coffee_r_Brew_Coffee;
	handle->stateConfVectorPosition = 0;
}

/* Default enter sequence for state null */
static void enseq_main_region__final__default(ProcessEspresso* handle)
{
	/* Default enter sequence for state null */
	processEspresso_stateEntered(handle, ProcessEspresso_main_region__final_);
	handle->stateConfVector[0] = ProcessEspresso_main_region__final_;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for region main region */
static void enseq_main_region_default(ProcessEspresso* handle)
{
	/* 'default' enter sequence for region main region */
	react_main_region__entry_Default(handle);
}

/* 'default' enter sequence for region r */
static void enseq_main_region_Make_Coffee_r_default(ProcessEspresso* handle)
{
	/* 'default' enter sequence for region r */
	react_main_region_Make_Coffee_r__entry_Default(handle);
}

/* Default exit sequence for state Make Coffee */
static void exseq_main_region_Make_Coffee(ProcessEspresso* handle)
{
	/* Default exit sequence for state Make Coffee */
	exseq_main_region_Make_Coffee_r(handle);
	processEspresso_stateExited(handle, ProcessEspresso_main_region_Make_Coffee);
}

/* Default exit sequence for state Milling Beans */
static void exseq_main_region_Make_Coffee_r_Milling_Beans(ProcessEspresso* handle)
{
	/* Default exit sequence for state Milling Beans */
	handle->stateConfVector[0] = ProcessEspresso_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_region_Make_Coffee_r_Milling_Beans(handle);
	processEspresso_stateExited(handle, ProcessEspresso_main_region_Make_Coffee_r_Milling_Beans);
}

/* Default exit sequence for state Brew Coffee */
static void exseq_main_region_Make_Coffee_r_Brew_Coffee(ProcessEspresso* handle)
{
	/* Default exit sequence for state Brew Coffee */
	handle->stateConfVector[0] = ProcessEspresso_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_region_Make_Coffee_r_Brew_Coffee(handle);
	processEspresso_stateExited(handle, ProcessEspresso_main_region_Make_Coffee_r_Brew_Coffee);
}

/* Default exit sequence for final state. */
static void exseq_main_region__final_(ProcessEspresso* handle)
{
	/* Default exit sequence for final state. */
	handle->stateConfVector[0] = ProcessEspresso_last_state;
	handle->stateConfVectorPosition = 0;
	processEspresso_stateExited(handle, ProcessEspresso_main_region__final_);
}

/* Default exit sequence for region main region */
static void exseq_main_region(ProcessEspresso* handle)
{
	/* Default exit sequence for region main region */
	/* Handle exit of all possible states (of ProcessEspresso.main_region) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case ProcessEspresso_main_region_Make_Coffee_r_Milling_Beans :
		{
			exseq_main_region_Make_Coffee_r_Milling_Beans(handle);
			processEspresso_stateExited(handle, ProcessEspresso_main_region_Make_Coffee);
			break;
		}
		case ProcessEspresso_main_region_Make_Coffee_r_Brew_Coffee :
		{
			exseq_main_region_Make_Coffee_r_Brew_Coffee(handle);
			processEspresso_stateExited(handle, ProcessEspresso_main_region_Make_Coffee);
			break;
		}
		case ProcessEspresso_main_region__final_ :
		{
			exseq_main_region__final_(handle);
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
static void exseq_main_region_Make_Coffee_r(ProcessEspresso* handle)
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of ProcessEspresso.main_region.Make_Coffee.r) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case ProcessEspresso_main_region_Make_Coffee_r_Milling_Beans :
		{
			exseq_main_region_Make_Coffee_r_Milling_Beans(handle);
			break;
		}
		case ProcessEspresso_main_region_Make_Coffee_r_Brew_Coffee :
		{
			exseq_main_region_Make_Coffee_r_Brew_Coffee(handle);
			break;
		}
		default: break;
	}
}

/* The reactions of state Milling Beans. */
static void react_main_region_Make_Coffee_r_Milling_Beans(ProcessEspresso* handle)
{
	/* The reactions of state Milling Beans. */
	if (check_main_region_Make_Coffee_r_Milling_Beans_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_region_Make_Coffee_r_Milling_Beans_tr0(handle);
	} 
}

/* The reactions of state Brew Coffee. */
static void react_main_region_Make_Coffee_r_Brew_Coffee(ProcessEspresso* handle)
{
	/* The reactions of state Brew Coffee. */
	if (check_main_region_Make_Coffee_r_Brew_Coffee_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_region_Make_Coffee_r_Brew_Coffee_tr0(handle);
	} 
}

/* The reactions of state null. */
static void react_main_region__final_(ProcessEspresso* handle)
{
}

/* Default react sequence for initial entry  */
static void react_main_region__entry_Default(ProcessEspresso* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_region_Make_Coffee_default(handle);
}

/* Default react sequence for initial entry  */
static void react_main_region_Make_Coffee_r__entry_Default(ProcessEspresso* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_region_Make_Coffee_r_Milling_Beans_default(handle);
}

/* The reactions of exit default. */
static void react_main_region_Make_Coffee_r__exit_Default(ProcessEspresso* handle)
{
	/* The reactions of exit default. */
	effect_main_region_Make_Coffee_tr0(handle);
}


