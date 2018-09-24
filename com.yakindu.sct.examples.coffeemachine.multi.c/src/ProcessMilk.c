
#include "ProcessMilk.h"
#include "sc/sc_types.h"
#include "ProcessMilkRequired.h"

#include <stdlib.h>
#include <string.h>
/*! \file Implementation of the state machine 'ProcessMilk'
*/

/* prototypes of all internal functions */
static sc_boolean check_main_region_Make_Milk_r_Make_Steam_tr0_tr0(const ProcessMilk* handle);
static void effect_main_region_Make_Milk_tr0(ProcessMilk* handle);
static void effect_main_region_Make_Milk_r_Make_Steam_tr0(ProcessMilk* handle);
static void enact(ProcessMilk* handle);
static void enact_main_region_Make_Milk_r_Make_Steam(ProcessMilk* handle);
static void exact_main_region_Make_Milk_r_Make_Steam(ProcessMilk* handle);
static void enseq_main_region_Make_Milk_default(ProcessMilk* handle);
static void enseq_main_region_Make_Milk_r_Make_Steam_default(ProcessMilk* handle);
static void enseq_main_region__final__default(ProcessMilk* handle);
static void enseq_main_region_default(ProcessMilk* handle);
static void enseq_main_region_Make_Milk_r_default(ProcessMilk* handle);
static void exseq_main_region_Make_Milk(ProcessMilk* handle);
static void exseq_main_region_Make_Milk_r_Make_Steam(ProcessMilk* handle);
static void exseq_main_region__final_(ProcessMilk* handle);
static void exseq_main_region(ProcessMilk* handle);
static void exseq_main_region_Make_Milk_r(ProcessMilk* handle);
static void react_main_region_Make_Milk_r_Make_Steam(ProcessMilk* handle);
static void react_main_region__final_(ProcessMilk* handle);
static void react_main_region__entry_Default(ProcessMilk* handle);
static void react_main_region_Make_Milk_r__entry_Default(ProcessMilk* handle);
static void react_main_region_Make_Milk_r_done(ProcessMilk* handle);
static void clearInEvents(ProcessMilk* handle);
static void clearOutEvents(ProcessMilk* handle);


void processMilk_init(ProcessMilk* handle)
{
		sc_integer i;
	
		for (i = 0; i < PROCESSMILK_MAX_ORTHOGONAL_STATES; ++i)
		{
			handle->stateConfVector[i] = ProcessMilk_last_state;
		}
		
		
		handle->stateConfVectorPosition = 0;
	
		clearInEvents(handle);
		clearOutEvents(handle);
	
}

void processMilk_enter(ProcessMilk* handle)
{
	/* Default enter sequence for statechart ProcessMilk */
	enact(handle);
	enseq_main_region_default(handle);
}

void processMilk_runCycle(ProcessMilk* handle)
{
	clearOutEvents(handle);
	for (handle->stateConfVectorPosition = 0;
		handle->stateConfVectorPosition < PROCESSMILK_MAX_ORTHOGONAL_STATES;
		handle->stateConfVectorPosition++)
		{
			
		switch (handle->stateConfVector[handle->stateConfVectorPosition])
		{
		case ProcessMilk_main_region_Make_Milk_r_Make_Steam:
		{
			react_main_region_Make_Milk_r_Make_Steam(handle);
			break;
		}
		case ProcessMilk_main_region__final_:
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

void processMilk_exit(ProcessMilk* handle)
{
	/* Default exit sequence for statechart ProcessMilk */
	exseq_main_region(handle);
}

sc_boolean processMilk_isActive(const ProcessMilk* handle)
{
	sc_boolean result = bool_false;
	int i;
	
	for(i = 0; i < PROCESSMILK_MAX_ORTHOGONAL_STATES; i++)
	{
		result = result || handle->stateConfVector[i] != ProcessMilk_last_state;
	}
	
	return result;
}

sc_boolean processMilk_isFinal(const ProcessMilk* handle)
{
	return (handle->stateConfVector[0] == ProcessMilk_main_region__final_);

}

void processMilk_raiseTimeEvent(ProcessMilk* handle, sc_eventid evid)
{
	if ( ((sc_intptr_t)evid) >= ((sc_intptr_t)&(handle->timeEvents))
		&&  ((sc_intptr_t)evid) < ((sc_intptr_t)&(handle->timeEvents)) + sizeof(ProcessMilkTimeEvents))
		{
		*(sc_boolean*)evid = bool_true;
	}		
}

sc_boolean processMilk_isStateActive(const ProcessMilk* handle, ProcessMilkStates state)
{
	sc_boolean result = bool_false;
	switch (state)
	{
		case ProcessMilk_main_region_Make_Milk :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSMILK_MAIN_REGION_MAKE_MILK] >= ProcessMilk_main_region_Make_Milk
				&& handle->stateConfVector[SCVI_PROCESSMILK_MAIN_REGION_MAKE_MILK] <= ProcessMilk_main_region_Make_Milk_r_Make_Steam);
			break;
		case ProcessMilk_main_region_Make_Milk_r_Make_Steam :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSMILK_MAIN_REGION_MAKE_MILK_R_MAKE_STEAM] == ProcessMilk_main_region_Make_Milk_r_Make_Steam
			);
			break;
		case ProcessMilk_main_region__final_ :
			result = (sc_boolean) (handle->stateConfVector[SCVI_PROCESSMILK_MAIN_REGION__FINAL_] == ProcessMilk_main_region__final_
			);
			break;
		default:
			result = bool_false;
			break;
	}
	return result;
}

static void clearInEvents(ProcessMilk* handle)
{
	handle->timeEvents.processMilk_main_region_Make_Milk_r_Make_Steam_tev0_raised = bool_false;
}

static void clearOutEvents(ProcessMilk* handle)
{
}



cm_recipe_t processMilkIface_get_recipe(const ProcessMilk* handle)
{
	return handle->iface.recipe;
}
void processMilkIface_set_recipe(ProcessMilk* handle, cm_recipe_t value)
{
	handle->iface.recipe = value;
}

/* implementations of all internal functions */

static sc_boolean check_main_region_Make_Milk_r_Make_Steam_tr0_tr0(const ProcessMilk* handle)
{
	return handle->timeEvents.processMilk_main_region_Make_Milk_r_Make_Steam_tev0_raised;
}

static void effect_main_region_Make_Milk_tr0(ProcessMilk* handle)
{
	exseq_main_region_Make_Milk(handle);
	enseq_main_region__final__default(handle);
}

static void effect_main_region_Make_Milk_r_Make_Steam_tr0(ProcessMilk* handle)
{
	exseq_main_region_Make_Milk_r_Make_Steam(handle);
	react_main_region_Make_Milk_r_done(handle);
}

/* Entry action for statechart 'ProcessMilk'. */
static void enact(ProcessMilk* handle)
{
	/* Entry action for statechart 'ProcessMilk'. */
	handle->iface.recipe.coffee_mass = 0;
	handle->iface.recipe.water_volume = 0;
	handle->iface.recipe.milk_volume = 150;
}

/* Entry action for state 'Make Steam'. */
static void enact_main_region_Make_Milk_r_Make_Steam(ProcessMilk* handle)
{
	/* Entry action for state 'Make Steam'. */
	processMilk_setTimer(handle, (sc_eventid) &(handle->timeEvents.processMilk_main_region_Make_Milk_r_Make_Steam_tev0_raised) , handle->iface.recipe.milk_volume * 60, bool_false);
}

/* Exit action for state 'Make Steam'. */
static void exact_main_region_Make_Milk_r_Make_Steam(ProcessMilk* handle)
{
	/* Exit action for state 'Make Steam'. */
	processMilk_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.processMilk_main_region_Make_Milk_r_Make_Steam_tev0_raised) );		
}

/* 'default' enter sequence for state Make Milk */
static void enseq_main_region_Make_Milk_default(ProcessMilk* handle)
{
	/* 'default' enter sequence for state Make Milk */
	processMilk_stateEntered(handle, ProcessMilk_main_region_Make_Milk);
	enseq_main_region_Make_Milk_r_default(handle);
}

/* 'default' enter sequence for state Make Steam */
static void enseq_main_region_Make_Milk_r_Make_Steam_default(ProcessMilk* handle)
{
	/* 'default' enter sequence for state Make Steam */
	enact_main_region_Make_Milk_r_Make_Steam(handle);
	processMilk_stateEntered(handle, ProcessMilk_main_region_Make_Milk_r_Make_Steam);
	handle->stateConfVector[0] = ProcessMilk_main_region_Make_Milk_r_Make_Steam;
	handle->stateConfVectorPosition = 0;
}

/* Default enter sequence for state null */
static void enseq_main_region__final__default(ProcessMilk* handle)
{
	/* Default enter sequence for state null */
	processMilk_stateEntered(handle, ProcessMilk_main_region__final_);
	handle->stateConfVector[0] = ProcessMilk_main_region__final_;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for region main region */
static void enseq_main_region_default(ProcessMilk* handle)
{
	/* 'default' enter sequence for region main region */
	react_main_region__entry_Default(handle);
}

/* 'default' enter sequence for region r */
static void enseq_main_region_Make_Milk_r_default(ProcessMilk* handle)
{
	/* 'default' enter sequence for region r */
	react_main_region_Make_Milk_r__entry_Default(handle);
}

/* Default exit sequence for state Make Milk */
static void exseq_main_region_Make_Milk(ProcessMilk* handle)
{
	/* Default exit sequence for state Make Milk */
	exseq_main_region_Make_Milk_r(handle);
	processMilk_stateExited(handle, ProcessMilk_main_region_Make_Milk);
}

/* Default exit sequence for state Make Steam */
static void exseq_main_region_Make_Milk_r_Make_Steam(ProcessMilk* handle)
{
	/* Default exit sequence for state Make Steam */
	handle->stateConfVector[0] = ProcessMilk_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_region_Make_Milk_r_Make_Steam(handle);
	processMilk_stateExited(handle, ProcessMilk_main_region_Make_Milk_r_Make_Steam);
}

/* Default exit sequence for final state. */
static void exseq_main_region__final_(ProcessMilk* handle)
{
	/* Default exit sequence for final state. */
	handle->stateConfVector[0] = ProcessMilk_last_state;
	handle->stateConfVectorPosition = 0;
	processMilk_stateExited(handle, ProcessMilk_main_region__final_);
}

/* Default exit sequence for region main region */
static void exseq_main_region(ProcessMilk* handle)
{
	/* Default exit sequence for region main region */
	/* Handle exit of all possible states (of ProcessMilk.main_region) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case ProcessMilk_main_region_Make_Milk_r_Make_Steam :
		{
			exseq_main_region_Make_Milk_r_Make_Steam(handle);
			processMilk_stateExited(handle, ProcessMilk_main_region_Make_Milk);
			break;
		}
		case ProcessMilk_main_region__final_ :
		{
			exseq_main_region__final_(handle);
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
static void exseq_main_region_Make_Milk_r(ProcessMilk* handle)
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of ProcessMilk.main_region.Make_Milk.r) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case ProcessMilk_main_region_Make_Milk_r_Make_Steam :
		{
			exseq_main_region_Make_Milk_r_Make_Steam(handle);
			break;
		}
		default: break;
	}
}

/* The reactions of state Make Steam. */
static void react_main_region_Make_Milk_r_Make_Steam(ProcessMilk* handle)
{
	/* The reactions of state Make Steam. */
	if (check_main_region_Make_Milk_r_Make_Steam_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_region_Make_Milk_r_Make_Steam_tr0(handle);
	} 
}

/* The reactions of state null. */
static void react_main_region__final_(ProcessMilk* handle)
{
}

/* Default react sequence for initial entry  */
static void react_main_region__entry_Default(ProcessMilk* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_region_Make_Milk_default(handle);
}

/* Default react sequence for initial entry  */
static void react_main_region_Make_Milk_r__entry_Default(ProcessMilk* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_region_Make_Milk_r_Make_Steam_default(handle);
}

/* The reactions of exit done. */
static void react_main_region_Make_Milk_r_done(ProcessMilk* handle)
{
	/* The reactions of exit done. */
	effect_main_region_Make_Milk_tr0(handle);
}


