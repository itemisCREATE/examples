
#include <stdlib.h>
#include <string.h>
#include "sc_types.h"
#include "LightCtrl.h"
#include "LightCtrlRequired.h"
/*! \file Implementation of the state machine 'LightCtrl'
*/

/* prototypes of all internal functions */
static sc_boolean lightCtrl_check_main_region_Light_Off_tr0_tr0(const LightCtrl* handle);
static sc_boolean lightCtrl_check_main_region_Light_On_tr0_tr0(const LightCtrl* handle);
static sc_boolean lightCtrl_check_main_region_Light_On_tr1_tr1(const LightCtrl* handle);
static void lightCtrl_effect_main_region_Light_Off_tr0(LightCtrl* handle);
static void lightCtrl_effect_main_region_Light_On_tr0(LightCtrl* handle);
static void lightCtrl_effect_main_region_Light_On_tr1(LightCtrl* handle);
static void lightCtrl_enact_main_region_Light_On(LightCtrl* handle);
static void lightCtrl_exact_main_region_Light_On(LightCtrl* handle);
static void lightCtrl_enseq_main_region_Light_Off_default(LightCtrl* handle);
static void lightCtrl_enseq_main_region_Light_On_default(LightCtrl* handle);
static void lightCtrl_enseq_main_region_default(LightCtrl* handle);
static void lightCtrl_exseq_main_region_Light_Off(LightCtrl* handle);
static void lightCtrl_exseq_main_region_Light_On(LightCtrl* handle);
static void lightCtrl_exseq_main_region(LightCtrl* handle);
static void lightCtrl_react_main_region_Light_Off(LightCtrl* handle);
static void lightCtrl_react_main_region_Light_On(LightCtrl* handle);
static void lightCtrl_react_main_region__entry_Default(LightCtrl* handle);
static void lightCtrl_clearInEvents(LightCtrl* handle);
static void lightCtrl_clearOutEvents(LightCtrl* handle);


void lightCtrl_init(LightCtrl* handle)
{
	sc_integer i;

	for (i = 0; i < LIGHTCTRL_MAX_ORTHOGONAL_STATES; ++i)
	{
		handle->stateConfVector[i] = LightCtrl_last_state;
	}
	
	
	handle->stateConfVectorPosition = 0;

	lightCtrl_clearInEvents(handle);
	lightCtrl_clearOutEvents(handle);


}

void lightCtrl_enter(LightCtrl* handle)
{
	/* Default enter sequence for statechart LightCtrl */
	lightCtrl_enseq_main_region_default(handle);
}

void lightCtrl_exit(LightCtrl* handle)
{
	/* Default exit sequence for statechart LightCtrl */
	lightCtrl_exseq_main_region(handle);
}

sc_boolean lightCtrl_isActive(const LightCtrl* handle)
{
	sc_boolean result;
	if (handle->stateConfVector[0] != LightCtrl_last_state)
	{
		result =  bool_true;
	}
	else
	{
		result = bool_false;
	}
	return result;
}

/* 
 * Always returns 'false' since this state machine can never become final.
 */
sc_boolean lightCtrl_isFinal(const LightCtrl* handle)
{
   return bool_false;
}

static void lightCtrl_clearInEvents(LightCtrl* handle)
{
	handle->iface.button_raised = bool_false;
	handle->timeEvents.lightCtrl_main_region_Light_On_tev0_raised = bool_false;
}

static void lightCtrl_clearOutEvents(LightCtrl* handle)
{
}

void lightCtrl_runCycle(LightCtrl* handle)
{
	
	lightCtrl_clearOutEvents(handle);
	
	for (handle->stateConfVectorPosition = 0;
		handle->stateConfVectorPosition < LIGHTCTRL_MAX_ORTHOGONAL_STATES;
		handle->stateConfVectorPosition++)
		{
			
		switch (handle->stateConfVector[handle->stateConfVectorPosition])
		{
		case LightCtrl_main_region_Light_Off :
		{
			lightCtrl_react_main_region_Light_Off(handle);
			break;
		}
		case LightCtrl_main_region_Light_On :
		{
			lightCtrl_react_main_region_Light_On(handle);
			break;
		}
		default:
			break;
		}
	}
	
	lightCtrl_clearInEvents(handle);
}

void lightCtrl_raiseTimeEvent(const LightCtrl* handle, sc_eventid evid)
{
	if ( ((sc_intptr_t)evid) >= ((sc_intptr_t)&(handle->timeEvents))
		&&  ((sc_intptr_t)evid) < ((sc_intptr_t)&(handle->timeEvents)) + sizeof(LightCtrlTimeEvents))
		{
		*(sc_boolean*)evid = bool_true;
	}		
}

sc_boolean lightCtrl_isStateActive(const LightCtrl* handle, LightCtrlStates state)
{
	sc_boolean result = bool_false;
	switch (state)
	{
		case LightCtrl_main_region_Light_Off :
			result = (sc_boolean) (handle->stateConfVector[0] == LightCtrl_main_region_Light_Off
			);
			break;
		case LightCtrl_main_region_Light_On :
			result = (sc_boolean) (handle->stateConfVector[0] == LightCtrl_main_region_Light_On
			);
			break;
		default:
			result = bool_false;
			break;
	}
	return result;
}

void lightCtrlIface_raise_button(LightCtrl* handle)
{
	handle->iface.button_raised = bool_true;
}



/* implementations of all internal functions */

static sc_boolean lightCtrl_check_main_region_Light_Off_tr0_tr0(const LightCtrl* handle)
{
	return handle->iface.button_raised;
}

static sc_boolean lightCtrl_check_main_region_Light_On_tr0_tr0(const LightCtrl* handle)
{
	return handle->timeEvents.lightCtrl_main_region_Light_On_tev0_raised;
}

static sc_boolean lightCtrl_check_main_region_Light_On_tr1_tr1(const LightCtrl* handle)
{
	return handle->iface.button_raised;
}

static void lightCtrl_effect_main_region_Light_Off_tr0(LightCtrl* handle)
{
	lightCtrl_exseq_main_region_Light_Off(handle);
	lightCtrlIface_setLight(handle, bool_true);
	lightCtrl_enseq_main_region_Light_On_default(handle);
}

static void lightCtrl_effect_main_region_Light_On_tr0(LightCtrl* handle)
{
	lightCtrl_exseq_main_region_Light_On(handle);
	lightCtrlIface_setLight(handle, bool_false);
	lightCtrl_enseq_main_region_Light_Off_default(handle);
}

static void lightCtrl_effect_main_region_Light_On_tr1(LightCtrl* handle)
{
	lightCtrl_exseq_main_region_Light_On(handle);
	lightCtrl_enseq_main_region_Light_On_default(handle);
}

/* Entry action for state 'Light On'. */
static void lightCtrl_enact_main_region_Light_On(LightCtrl* handle)
{
	/* Entry action for state 'Light On'. */
	lightCtrl_setTimer(handle, (sc_eventid) &(handle->timeEvents.lightCtrl_main_region_Light_On_tev0_raised) , 5 * 1000, bool_false);
}

/* Exit action for state 'Light On'. */
static void lightCtrl_exact_main_region_Light_On(LightCtrl* handle)
{
	/* Exit action for state 'Light On'. */
	lightCtrl_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.lightCtrl_main_region_Light_On_tev0_raised) );		
}

/* 'default' enter sequence for state Light Off */
static void lightCtrl_enseq_main_region_Light_Off_default(LightCtrl* handle)
{
	/* 'default' enter sequence for state Light Off */
	handle->stateConfVector[0] = LightCtrl_main_region_Light_Off;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Light On */
static void lightCtrl_enseq_main_region_Light_On_default(LightCtrl* handle)
{
	/* 'default' enter sequence for state Light On */
	lightCtrl_enact_main_region_Light_On(handle);
	handle->stateConfVector[0] = LightCtrl_main_region_Light_On;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for region main region */
static void lightCtrl_enseq_main_region_default(LightCtrl* handle)
{
	/* 'default' enter sequence for region main region */
	lightCtrl_react_main_region__entry_Default(handle);
}

/* Default exit sequence for state Light Off */
static void lightCtrl_exseq_main_region_Light_Off(LightCtrl* handle)
{
	/* Default exit sequence for state Light Off */
	handle->stateConfVector[0] = LightCtrl_last_state;
	handle->stateConfVectorPosition = 0;
}

/* Default exit sequence for state Light On */
static void lightCtrl_exseq_main_region_Light_On(LightCtrl* handle)
{
	/* Default exit sequence for state Light On */
	handle->stateConfVector[0] = LightCtrl_last_state;
	handle->stateConfVectorPosition = 0;
	lightCtrl_exact_main_region_Light_On(handle);
}

/* Default exit sequence for region main region */
static void lightCtrl_exseq_main_region(LightCtrl* handle)
{
	/* Default exit sequence for region main region */
	/* Handle exit of all possible states (of LightCtrl.main_region) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case LightCtrl_main_region_Light_Off :
		{
			lightCtrl_exseq_main_region_Light_Off(handle);
			break;
		}
		case LightCtrl_main_region_Light_On :
		{
			lightCtrl_exseq_main_region_Light_On(handle);
			break;
		}
		default: break;
	}
}

/* The reactions of state Light Off. */
static void lightCtrl_react_main_region_Light_Off(LightCtrl* handle)
{
	/* The reactions of state Light Off. */
	if (lightCtrl_check_main_region_Light_Off_tr0_tr0(handle) == bool_true)
	{ 
		lightCtrl_effect_main_region_Light_Off_tr0(handle);
	} 
}

/* The reactions of state Light On. */
static void lightCtrl_react_main_region_Light_On(LightCtrl* handle)
{
	/* The reactions of state Light On. */
	if (lightCtrl_check_main_region_Light_On_tr0_tr0(handle) == bool_true)
	{ 
		lightCtrl_effect_main_region_Light_On_tr0(handle);
	}  else
	{
		if (lightCtrl_check_main_region_Light_On_tr1_tr1(handle) == bool_true)
		{ 
			lightCtrl_effect_main_region_Light_On_tr1(handle);
		} 
	}
}

/* Default react sequence for initial entry  */
static void lightCtrl_react_main_region__entry_Default(LightCtrl* handle)
{
	/* Default react sequence for initial entry  */
	lightCtrl_enseq_main_region_Light_Off_default(handle);
}


