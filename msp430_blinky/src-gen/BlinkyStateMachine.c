
#include <stdlib.h>
#include <string.h>
#include "..\src\sc_types.h"
#include "BlinkyStateMachine.h"
#include "BlinkyStateMachineRequired.h"
/*! \file Implementation of the state machine 'blinkyStateMachine'
*/

/* prototypes of all internal functions */
static sc_boolean blinkyStateMachine_check_main_region_Initialization_tr0_tr0(const BlinkyStateMachine* handle);
static sc_boolean blinkyStateMachine_check_main_region_red_LED_on_tr0_tr0(const BlinkyStateMachine* handle);
static sc_boolean blinkyStateMachine_check_main_region_red_LED_off_tr0_tr0(const BlinkyStateMachine* handle);
static void blinkyStateMachine_effect_main_region_Initialization_tr0(BlinkyStateMachine* handle);
static void blinkyStateMachine_effect_main_region_red_LED_on_tr0(BlinkyStateMachine* handle);
static void blinkyStateMachine_effect_main_region_red_LED_off_tr0(BlinkyStateMachine* handle);
static void blinkyStateMachine_enact_main_region_Initialization(BlinkyStateMachine* handle);
static void blinkyStateMachine_enact_main_region_red_LED_on(BlinkyStateMachine* handle);
static void blinkyStateMachine_enact_main_region_red_LED_off(BlinkyStateMachine* handle);
static void blinkyStateMachine_exact_main_region_red_LED_on(BlinkyStateMachine* handle);
static void blinkyStateMachine_exact_main_region_red_LED_off(BlinkyStateMachine* handle);
static void blinkyStateMachine_enseq_main_region_Initialization_default(BlinkyStateMachine* handle);
static void blinkyStateMachine_enseq_main_region_red_LED_on_default(BlinkyStateMachine* handle);
static void blinkyStateMachine_enseq_main_region_red_LED_off_default(BlinkyStateMachine* handle);
static void blinkyStateMachine_enseq_main_region_default(BlinkyStateMachine* handle);
static void blinkyStateMachine_exseq_main_region_Initialization(BlinkyStateMachine* handle);
static void blinkyStateMachine_exseq_main_region_red_LED_on(BlinkyStateMachine* handle);
static void blinkyStateMachine_exseq_main_region_red_LED_off(BlinkyStateMachine* handle);
static void blinkyStateMachine_exseq_main_region(BlinkyStateMachine* handle);
static void blinkyStateMachine_react_main_region_Initialization(BlinkyStateMachine* handle);
static void blinkyStateMachine_react_main_region_red_LED_on(BlinkyStateMachine* handle);
static void blinkyStateMachine_react_main_region_red_LED_off(BlinkyStateMachine* handle);
static void blinkyStateMachine_react_main_region__entry_Default(BlinkyStateMachine* handle);
static void blinkyStateMachine_clearInEvents(BlinkyStateMachine* handle);
static void blinkyStateMachine_clearOutEvents(BlinkyStateMachine* handle);


void blinkyStateMachine_init(BlinkyStateMachine* handle)
{
	sc_integer i;

	for (i = 0; i < BLINKYSTATEMACHINE_MAX_ORTHOGONAL_STATES; ++i)
	{
		handle->stateConfVector[i] = BlinkyStateMachine_last_state;
	}
	
	
	handle->stateConfVectorPosition = 0;

	blinkyStateMachine_clearInEvents(handle);
	blinkyStateMachine_clearOutEvents(handle);


}

void blinkyStateMachine_enter(BlinkyStateMachine* handle)
{
	/* Default enter sequence for statechart blinkyStateMachine */
	blinkyStateMachine_enseq_main_region_default(handle);
}

void blinkyStateMachine_exit(BlinkyStateMachine* handle)
{
	/* Default exit sequence for statechart blinkyStateMachine */
	blinkyStateMachine_exseq_main_region(handle);
}

sc_boolean blinkyStateMachine_isActive(const BlinkyStateMachine* handle)
{
	sc_boolean result;
	if (handle->stateConfVector[0] != BlinkyStateMachine_last_state)
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
sc_boolean blinkyStateMachine_isFinal(const BlinkyStateMachine* handle)
{
   return bool_false;
}

static void blinkyStateMachine_clearInEvents(BlinkyStateMachine* handle)
{
	handle->timeEvents.blinkyStateMachine_main_region_red_LED_on_tev0_raised = bool_false;
	handle->timeEvents.blinkyStateMachine_main_region_red_LED_off_tev0_raised = bool_false;
}

static void blinkyStateMachine_clearOutEvents(BlinkyStateMachine* handle)
{
}

void blinkyStateMachine_runCycle(BlinkyStateMachine* handle)
{
	
	blinkyStateMachine_clearOutEvents(handle);
	
	for (handle->stateConfVectorPosition = 0;
		handle->stateConfVectorPosition < BLINKYSTATEMACHINE_MAX_ORTHOGONAL_STATES;
		handle->stateConfVectorPosition++)
		{
			
		switch (handle->stateConfVector[handle->stateConfVectorPosition])
		{
		case BlinkyStateMachine_main_region_Initialization :
		{
			blinkyStateMachine_react_main_region_Initialization(handle);
			break;
		}
		case BlinkyStateMachine_main_region_red_LED_on :
		{
			blinkyStateMachine_react_main_region_red_LED_on(handle);
			break;
		}
		case BlinkyStateMachine_main_region_red_LED_off :
		{
			blinkyStateMachine_react_main_region_red_LED_off(handle);
			break;
		}
		default:
			break;
		}
	}
	
	blinkyStateMachine_clearInEvents(handle);
}

void blinkyStateMachine_raiseTimeEvent(const BlinkyStateMachine* handle, sc_eventid evid)
{
	if ( ((sc_intptr_t)evid) >= ((sc_intptr_t)&(handle->timeEvents))
		&&  ((sc_intptr_t)evid) < ((sc_intptr_t)&(handle->timeEvents)) + sizeof(BlinkyStateMachineTimeEvents))
		{
		*(sc_boolean*)evid = bool_true;
	}		
}

sc_boolean blinkyStateMachine_isStateActive(const BlinkyStateMachine* handle, BlinkyStateMachineStates state)
{
	sc_boolean result = bool_false;
	switch (state)
	{
		case BlinkyStateMachine_main_region_Initialization :
			result = (sc_boolean) (handle->stateConfVector[0] == BlinkyStateMachine_main_region_Initialization
			);
			break;
		case BlinkyStateMachine_main_region_red_LED_on :
			result = (sc_boolean) (handle->stateConfVector[0] == BlinkyStateMachine_main_region_red_LED_on
			);
			break;
		case BlinkyStateMachine_main_region_red_LED_off :
			result = (sc_boolean) (handle->stateConfVector[0] == BlinkyStateMachine_main_region_red_LED_off
			);
			break;
		default:
			result = bool_false;
			break;
	}
	return result;
}




/* implementations of all internal functions */

static sc_boolean blinkyStateMachine_check_main_region_Initialization_tr0_tr0(const BlinkyStateMachine* handle)
{
	return bool_true;
}

static sc_boolean blinkyStateMachine_check_main_region_red_LED_on_tr0_tr0(const BlinkyStateMachine* handle)
{
	return handle->timeEvents.blinkyStateMachine_main_region_red_LED_on_tev0_raised;
}

static sc_boolean blinkyStateMachine_check_main_region_red_LED_off_tr0_tr0(const BlinkyStateMachine* handle)
{
	return handle->timeEvents.blinkyStateMachine_main_region_red_LED_off_tev0_raised;
}

static void blinkyStateMachine_effect_main_region_Initialization_tr0(BlinkyStateMachine* handle)
{
	blinkyStateMachine_exseq_main_region_Initialization(handle);
	blinkyStateMachine_enseq_main_region_red_LED_on_default(handle);
}

static void blinkyStateMachine_effect_main_region_red_LED_on_tr0(BlinkyStateMachine* handle)
{
	blinkyStateMachine_exseq_main_region_red_LED_on(handle);
	blinkyStateMachine_enseq_main_region_red_LED_off_default(handle);
}

static void blinkyStateMachine_effect_main_region_red_LED_off_tr0(BlinkyStateMachine* handle)
{
	blinkyStateMachine_exseq_main_region_red_LED_off(handle);
	blinkyStateMachine_enseq_main_region_red_LED_on_default(handle);
}

/* Entry action for state 'Initialization'. */
static void blinkyStateMachine_enact_main_region_Initialization(BlinkyStateMachine* handle)
{
	/* Entry action for state 'Initialization'. */
	blinkyStateMachineInternal_init(handle);
}

/* Entry action for state 'red LED on'. */
static void blinkyStateMachine_enact_main_region_red_LED_on(BlinkyStateMachine* handle)
{
	/* Entry action for state 'red LED on'. */
	blinkyStateMachine_setTimer(handle, (sc_eventid) &(handle->timeEvents.blinkyStateMachine_main_region_red_LED_on_tev0_raised) , 1 * 1000, bool_false);
	blinkyStateMachineInternal_redOn(handle);
}

/* Entry action for state 'red LED off'. */
static void blinkyStateMachine_enact_main_region_red_LED_off(BlinkyStateMachine* handle)
{
	/* Entry action for state 'red LED off'. */
	blinkyStateMachine_setTimer(handle, (sc_eventid) &(handle->timeEvents.blinkyStateMachine_main_region_red_LED_off_tev0_raised) , 1 * 1000, bool_false);
	blinkyStateMachineInternal_redOff(handle);
}

/* Exit action for state 'red LED on'. */
static void blinkyStateMachine_exact_main_region_red_LED_on(BlinkyStateMachine* handle)
{
	/* Exit action for state 'red LED on'. */
	blinkyStateMachine_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.blinkyStateMachine_main_region_red_LED_on_tev0_raised) );		
}

/* Exit action for state 'red LED off'. */
static void blinkyStateMachine_exact_main_region_red_LED_off(BlinkyStateMachine* handle)
{
	/* Exit action for state 'red LED off'. */
	blinkyStateMachine_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.blinkyStateMachine_main_region_red_LED_off_tev0_raised) );		
}

/* 'default' enter sequence for state Initialization */
static void blinkyStateMachine_enseq_main_region_Initialization_default(BlinkyStateMachine* handle)
{
	/* 'default' enter sequence for state Initialization */
	blinkyStateMachine_enact_main_region_Initialization(handle);
	handle->stateConfVector[0] = BlinkyStateMachine_main_region_Initialization;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state red LED on */
static void blinkyStateMachine_enseq_main_region_red_LED_on_default(BlinkyStateMachine* handle)
{
	/* 'default' enter sequence for state red LED on */
	blinkyStateMachine_enact_main_region_red_LED_on(handle);
	handle->stateConfVector[0] = BlinkyStateMachine_main_region_red_LED_on;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state red LED off */
static void blinkyStateMachine_enseq_main_region_red_LED_off_default(BlinkyStateMachine* handle)
{
	/* 'default' enter sequence for state red LED off */
	blinkyStateMachine_enact_main_region_red_LED_off(handle);
	handle->stateConfVector[0] = BlinkyStateMachine_main_region_red_LED_off;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for region main region */
static void blinkyStateMachine_enseq_main_region_default(BlinkyStateMachine* handle)
{
	/* 'default' enter sequence for region main region */
	blinkyStateMachine_react_main_region__entry_Default(handle);
}

/* Default exit sequence for state Initialization */
static void blinkyStateMachine_exseq_main_region_Initialization(BlinkyStateMachine* handle)
{
	/* Default exit sequence for state Initialization */
	handle->stateConfVector[0] = BlinkyStateMachine_last_state;
	handle->stateConfVectorPosition = 0;
}

/* Default exit sequence for state red LED on */
static void blinkyStateMachine_exseq_main_region_red_LED_on(BlinkyStateMachine* handle)
{
	/* Default exit sequence for state red LED on */
	handle->stateConfVector[0] = BlinkyStateMachine_last_state;
	handle->stateConfVectorPosition = 0;
	blinkyStateMachine_exact_main_region_red_LED_on(handle);
}

/* Default exit sequence for state red LED off */
static void blinkyStateMachine_exseq_main_region_red_LED_off(BlinkyStateMachine* handle)
{
	/* Default exit sequence for state red LED off */
	handle->stateConfVector[0] = BlinkyStateMachine_last_state;
	handle->stateConfVectorPosition = 0;
	blinkyStateMachine_exact_main_region_red_LED_off(handle);
}

/* Default exit sequence for region main region */
static void blinkyStateMachine_exseq_main_region(BlinkyStateMachine* handle)
{
	/* Default exit sequence for region main region */
	/* Handle exit of all possible states (of blinkyStateMachine.main_region) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case BlinkyStateMachine_main_region_Initialization :
		{
			blinkyStateMachine_exseq_main_region_Initialization(handle);
			break;
		}
		case BlinkyStateMachine_main_region_red_LED_on :
		{
			blinkyStateMachine_exseq_main_region_red_LED_on(handle);
			break;
		}
		case BlinkyStateMachine_main_region_red_LED_off :
		{
			blinkyStateMachine_exseq_main_region_red_LED_off(handle);
			break;
		}
		default: break;
	}
}

/* The reactions of state Initialization. */
static void blinkyStateMachine_react_main_region_Initialization(BlinkyStateMachine* handle)
{
	/* The reactions of state Initialization. */
	blinkyStateMachine_effect_main_region_Initialization_tr0(handle);
}

/* The reactions of state red LED on. */
static void blinkyStateMachine_react_main_region_red_LED_on(BlinkyStateMachine* handle)
{
	/* The reactions of state red LED on. */
	if (blinkyStateMachine_check_main_region_red_LED_on_tr0_tr0(handle) == bool_true)
	{ 
		blinkyStateMachine_effect_main_region_red_LED_on_tr0(handle);
	} 
}

/* The reactions of state red LED off. */
static void blinkyStateMachine_react_main_region_red_LED_off(BlinkyStateMachine* handle)
{
	/* The reactions of state red LED off. */
	if (blinkyStateMachine_check_main_region_red_LED_off_tr0_tr0(handle) == bool_true)
	{ 
		blinkyStateMachine_effect_main_region_red_LED_off_tr0(handle);
	} 
}

/* Default react sequence for initial entry  */
static void blinkyStateMachine_react_main_region__entry_Default(BlinkyStateMachine* handle)
{
	/* Default react sequence for initial entry  */
	blinkyStateMachine_enseq_main_region_Initialization_default(handle);
}


