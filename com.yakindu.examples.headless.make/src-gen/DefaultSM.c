
#include <stdlib.h>
#include <string.h>
#include "../src/sc_types.h"
#include "DefaultSM.h"
/*! \file Implementation of the state machine 'defaultSM'
*/

/* prototypes of all internal functions */
static sc_boolean defaultSM_check_main_region_StateA_tr0_tr0(const DefaultSM* handle);
static sc_boolean defaultSM_check_main_region_StateA_lr0_lr0(const DefaultSM* handle);
static void defaultSM_effect_main_region_StateA_tr0(DefaultSM* handle);
static void defaultSM_effect_main_region_StateA_lr0_lr0(DefaultSM* handle);
static void defaultSM_enseq_main_region_StateA_default(DefaultSM* handle);
static void defaultSM_enseq_main_region__final__default(DefaultSM* handle);
static void defaultSM_enseq_main_region_default(DefaultSM* handle);
static void defaultSM_exseq_main_region_StateA(DefaultSM* handle);
static void defaultSM_exseq_main_region__final_(DefaultSM* handle);
static void defaultSM_exseq_main_region(DefaultSM* handle);
static void defaultSM_react_main_region_StateA(DefaultSM* handle);
static void defaultSM_react_main_region__final_(DefaultSM* handle);
static void defaultSM_react_main_region__entry_Default(DefaultSM* handle);
static void defaultSM_clearInEvents(DefaultSM* handle);
static void defaultSM_clearOutEvents(DefaultSM* handle);


void defaultSM_init(DefaultSM* handle)
{
	sc_integer i;

	for (i = 0; i < DEFAULTSM_MAX_ORTHOGONAL_STATES; ++i)
	{
		handle->stateConfVector[i] = DefaultSM_last_state;
	}
	
	
	handle->stateConfVectorPosition = 0;

	defaultSM_clearInEvents(handle);
	defaultSM_clearOutEvents(handle);

	/* Default init sequence for statechart defaultSM */
	handle->iface.a = 0;

}

void defaultSM_enter(DefaultSM* handle)
{
	/* Default enter sequence for statechart defaultSM */
	defaultSM_enseq_main_region_default(handle);
}

void defaultSM_exit(DefaultSM* handle)
{
	/* Default exit sequence for statechart defaultSM */
	defaultSM_exseq_main_region(handle);
}

sc_boolean defaultSM_isActive(const DefaultSM* handle)
{
	sc_boolean result;
	if (handle->stateConfVector[0] != DefaultSM_last_state)
	{
		result =  bool_true;
	}
	else
	{
		result = bool_false;
	}
	return result;
}

sc_boolean defaultSM_isFinal(const DefaultSM* handle)
{
	return (handle->stateConfVector[0] == DefaultSM_main_region__final_);

}

static void defaultSM_clearInEvents(DefaultSM* handle)
{
}

static void defaultSM_clearOutEvents(DefaultSM* handle)
{
}

void defaultSM_runCycle(DefaultSM* handle)
{
	
	defaultSM_clearOutEvents(handle);
	
	for (handle->stateConfVectorPosition = 0;
		handle->stateConfVectorPosition < DEFAULTSM_MAX_ORTHOGONAL_STATES;
		handle->stateConfVectorPosition++)
		{
			
		switch (handle->stateConfVector[handle->stateConfVectorPosition])
		{
		case DefaultSM_main_region_StateA :
		{
			defaultSM_react_main_region_StateA(handle);
			break;
		}
		case DefaultSM_main_region__final_ :
		{
			defaultSM_react_main_region__final_(handle);
			break;
		}
		default:
			break;
		}
	}
	
	defaultSM_clearInEvents(handle);
}


sc_boolean defaultSM_isStateActive(const DefaultSM* handle, DefaultSMStates state)
{
	sc_boolean result = bool_false;
	switch (state)
	{
		case DefaultSM_main_region_StateA :
			result = (sc_boolean) (handle->stateConfVector[0] == DefaultSM_main_region_StateA
			);
			break;
		case DefaultSM_main_region__final_ :
			result = (sc_boolean) (handle->stateConfVector[0] == DefaultSM_main_region__final_
			);
			break;
		default:
			result = bool_false;
			break;
	}
	return result;
}



uint32_t defaultSMIface_get_a(const DefaultSM* handle)
{
	return handle->iface.a;
}
void defaultSMIface_set_a(DefaultSM* handle, uint32_t value)
{
	handle->iface.a = value;
}

/* implementations of all internal functions */

static sc_boolean defaultSM_check_main_region_StateA_tr0_tr0(const DefaultSM* handle)
{
	return (handle->iface.a == 10) ? bool_true : bool_false;
}

static sc_boolean defaultSM_check_main_region_StateA_lr0_lr0(const DefaultSM* handle)
{
	return (handle->iface.a < 10) ? bool_true : bool_false;
}

static void defaultSM_effect_main_region_StateA_tr0(DefaultSM* handle)
{
	defaultSM_exseq_main_region_StateA(handle);
	defaultSM_enseq_main_region__final__default(handle);
}

static void defaultSM_effect_main_region_StateA_lr0_lr0(DefaultSM* handle)
{
	handle->iface.a += 1;
}

/* 'default' enter sequence for state StateA */
static void defaultSM_enseq_main_region_StateA_default(DefaultSM* handle)
{
	/* 'default' enter sequence for state StateA */
	handle->stateConfVector[0] = DefaultSM_main_region_StateA;
	handle->stateConfVectorPosition = 0;
}

/* Default enter sequence for state null */
static void defaultSM_enseq_main_region__final__default(DefaultSM* handle)
{
	/* Default enter sequence for state null */
	handle->stateConfVector[0] = DefaultSM_main_region__final_;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for region main region */
static void defaultSM_enseq_main_region_default(DefaultSM* handle)
{
	/* 'default' enter sequence for region main region */
	defaultSM_react_main_region__entry_Default(handle);
}

/* Default exit sequence for state StateA */
static void defaultSM_exseq_main_region_StateA(DefaultSM* handle)
{
	/* Default exit sequence for state StateA */
	handle->stateConfVector[0] = DefaultSM_last_state;
	handle->stateConfVectorPosition = 0;
}

/* Default exit sequence for final state. */
static void defaultSM_exseq_main_region__final_(DefaultSM* handle)
{
	/* Default exit sequence for final state. */
	handle->stateConfVector[0] = DefaultSM_last_state;
	handle->stateConfVectorPosition = 0;
}

/* Default exit sequence for region main region */
static void defaultSM_exseq_main_region(DefaultSM* handle)
{
	/* Default exit sequence for region main region */
	/* Handle exit of all possible states (of defaultSM.main_region) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case DefaultSM_main_region_StateA :
		{
			defaultSM_exseq_main_region_StateA(handle);
			break;
		}
		case DefaultSM_main_region__final_ :
		{
			defaultSM_exseq_main_region__final_(handle);
			break;
		}
		default: break;
	}
}

/* The reactions of state StateA. */
static void defaultSM_react_main_region_StateA(DefaultSM* handle)
{
	/* The reactions of state StateA. */
	if (defaultSM_check_main_region_StateA_tr0_tr0(handle) == bool_true)
	{ 
		defaultSM_effect_main_region_StateA_tr0(handle);
	}  else
	{
		if (defaultSM_check_main_region_StateA_lr0_lr0(handle) == bool_true)
		{ 
			defaultSM_effect_main_region_StateA_lr0_lr0(handle);
		} 
	}
}

/* The reactions of state null. */
static void defaultSM_react_main_region__final_(DefaultSM* handle)
{
	/* The reactions of state null. */
}

/* Default react sequence for initial entry  */
static void defaultSM_react_main_region__entry_Default(DefaultSM* handle)
{
	/* Default react sequence for initial entry  */
	defaultSM_enseq_main_region_StateA_default(handle);
}


