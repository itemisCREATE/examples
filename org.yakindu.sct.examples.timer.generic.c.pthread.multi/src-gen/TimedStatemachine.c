
#include "TimedStatemachine.h"
#include "../src/sc_types.h"
#include "TimedStatemachineRequired.h"

#include <stdlib.h>
#include <string.h>
/*! \file Implementation of the state machine 'TimedStatemachine'
*/

/* prototypes of all internal functions */
static sc_boolean check_main_region_StateA_tr0_tr0(const TimedStatemachine* handle);
static sc_boolean check_main_region_StateB_tr0_tr0(const TimedStatemachine* handle);
static void effect_main_region_StateA_tr0(TimedStatemachine* handle);
static void effect_main_region_StateB_tr0(TimedStatemachine* handle);
static void enact_main_region_StateA(TimedStatemachine* handle);
static void enact_main_region_StateB(TimedStatemachine* handle);
static void exact_main_region_StateA(TimedStatemachine* handle);
static void exact_main_region_StateB(TimedStatemachine* handle);
static void enseq_main_region_StateA_default(TimedStatemachine* handle);
static void enseq_main_region_StateB_default(TimedStatemachine* handle);
static void enseq_main_region_default(TimedStatemachine* handle);
static void exseq_main_region_StateA(TimedStatemachine* handle);
static void exseq_main_region_StateB(TimedStatemachine* handle);
static void exseq_main_region(TimedStatemachine* handle);
static void react_main_region_StateA(TimedStatemachine* handle);
static void react_main_region_StateB(TimedStatemachine* handle);
static void react_main_region__entry_Default(TimedStatemachine* handle);
static void clearInEvents(TimedStatemachine* handle);
static void clearOutEvents(TimedStatemachine* handle);


void timedStatemachine_init(TimedStatemachine* handle)
{
		sc_integer i;
	
		for (i = 0; i < TIMEDSTATEMACHINE_MAX_ORTHOGONAL_STATES; ++i)
		{
			handle->stateConfVector[i] = TimedStatemachine_last_state;
		}
		
		
		handle->stateConfVectorPosition = 0;
	
		clearInEvents(handle);
		clearOutEvents(handle);
	
}

void timedStatemachine_enter(TimedStatemachine* handle)
{
	/* Default enter sequence for statechart TimedStatemachine */
	enseq_main_region_default(handle);
}

void timedStatemachine_runCycle(TimedStatemachine* handle)
{
	clearOutEvents(handle);
	for (handle->stateConfVectorPosition = 0;
		handle->stateConfVectorPosition < TIMEDSTATEMACHINE_MAX_ORTHOGONAL_STATES;
		handle->stateConfVectorPosition++)
		{
			
		switch (handle->stateConfVector[handle->stateConfVectorPosition])
		{
		case TimedStatemachine_main_region_StateA:
		{
			react_main_region_StateA(handle);
			break;
		}
		case TimedStatemachine_main_region_StateB:
		{
			react_main_region_StateB(handle);
			break;
		}
		default:
			break;
		}
	}
	
	clearInEvents(handle);
}

void timedStatemachine_exit(TimedStatemachine* handle)
{
	/* Default exit sequence for statechart TimedStatemachine */
	exseq_main_region(handle);
}

sc_boolean timedStatemachine_isActive(const TimedStatemachine* handle)
{
	sc_boolean result = bool_false;
	int i;
	
	for(i = 0; i < TIMEDSTATEMACHINE_MAX_ORTHOGONAL_STATES; i++)
	{
		result = result || handle->stateConfVector[i] != TimedStatemachine_last_state;
	}
	
	return result;
}

/* 
 * Always returns 'false' since this state machine can never become final.
 */
sc_boolean timedStatemachine_isFinal(const TimedStatemachine* handle)
{
   return bool_false;
}

void timedStatemachine_raiseTimeEvent(TimedStatemachine* handle, sc_eventid evid)
{
	if ( ((sc_intptr_t)evid) >= ((sc_intptr_t)&(handle->timeEvents))
		&&  ((sc_intptr_t)evid) < ((sc_intptr_t)&(handle->timeEvents)) + sizeof(TimedStatemachineTimeEvents))
		{
		*(sc_boolean*)evid = bool_true;
	}		
}

sc_boolean timedStatemachine_isStateActive(const TimedStatemachine* handle, TimedStatemachineStates state)
{
	sc_boolean result = bool_false;
	switch (state)
	{
		case TimedStatemachine_main_region_StateA :
			result = (sc_boolean) (handle->stateConfVector[SCVI_TIMEDSTATEMACHINE_MAIN_REGION_STATEA] == TimedStatemachine_main_region_StateA
			);
			break;
		case TimedStatemachine_main_region_StateB :
			result = (sc_boolean) (handle->stateConfVector[SCVI_TIMEDSTATEMACHINE_MAIN_REGION_STATEB] == TimedStatemachine_main_region_StateB
			);
			break;
		default:
			result = bool_false;
			break;
	}
	return result;
}

static void clearInEvents(TimedStatemachine* handle)
{
	handle->timeEvents.timedStatemachine_main_region_StateA_tev0_raised = bool_false;
	handle->timeEvents.timedStatemachine_main_region_StateB_tev0_raised = bool_false;
}

static void clearOutEvents(TimedStatemachine* handle)
{
}


/* implementations of all internal functions */

static sc_boolean check_main_region_StateA_tr0_tr0(const TimedStatemachine* handle)
{
	return handle->timeEvents.timedStatemachine_main_region_StateA_tev0_raised;
}

static sc_boolean check_main_region_StateB_tr0_tr0(const TimedStatemachine* handle)
{
	return handle->timeEvents.timedStatemachine_main_region_StateB_tev0_raised;
}

static void effect_main_region_StateA_tr0(TimedStatemachine* handle)
{
	exseq_main_region_StateA(handle);
	enseq_main_region_StateB_default(handle);
}

static void effect_main_region_StateB_tr0(TimedStatemachine* handle)
{
	exseq_main_region_StateB(handle);
	enseq_main_region_StateA_default(handle);
}

/* Entry action for state 'StateA'. */
static void enact_main_region_StateA(TimedStatemachine* handle)
{
	/* Entry action for state 'StateA'. */
	timedStatemachine_setTimer(handle, (sc_eventid) &(handle->timeEvents.timedStatemachine_main_region_StateA_tev0_raised) , 1 * 1000, bool_false);
}

/* Entry action for state 'StateB'. */
static void enact_main_region_StateB(TimedStatemachine* handle)
{
	/* Entry action for state 'StateB'. */
	timedStatemachine_setTimer(handle, (sc_eventid) &(handle->timeEvents.timedStatemachine_main_region_StateB_tev0_raised) , 1 * 1000, bool_false);
}

/* Exit action for state 'StateA'. */
static void exact_main_region_StateA(TimedStatemachine* handle)
{
	/* Exit action for state 'StateA'. */
	timedStatemachine_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.timedStatemachine_main_region_StateA_tev0_raised) );		
}

/* Exit action for state 'StateB'. */
static void exact_main_region_StateB(TimedStatemachine* handle)
{
	/* Exit action for state 'StateB'. */
	timedStatemachine_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.timedStatemachine_main_region_StateB_tev0_raised) );		
}

/* 'default' enter sequence for state StateA */
static void enseq_main_region_StateA_default(TimedStatemachine* handle)
{
	/* 'default' enter sequence for state StateA */
	enact_main_region_StateA(handle);
	handle->stateConfVector[0] = TimedStatemachine_main_region_StateA;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state StateB */
static void enseq_main_region_StateB_default(TimedStatemachine* handle)
{
	/* 'default' enter sequence for state StateB */
	enact_main_region_StateB(handle);
	handle->stateConfVector[0] = TimedStatemachine_main_region_StateB;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for region main region */
static void enseq_main_region_default(TimedStatemachine* handle)
{
	/* 'default' enter sequence for region main region */
	react_main_region__entry_Default(handle);
}

/* Default exit sequence for state StateA */
static void exseq_main_region_StateA(TimedStatemachine* handle)
{
	/* Default exit sequence for state StateA */
	handle->stateConfVector[0] = TimedStatemachine_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_region_StateA(handle);
}

/* Default exit sequence for state StateB */
static void exseq_main_region_StateB(TimedStatemachine* handle)
{
	/* Default exit sequence for state StateB */
	handle->stateConfVector[0] = TimedStatemachine_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_region_StateB(handle);
}

/* Default exit sequence for region main region */
static void exseq_main_region(TimedStatemachine* handle)
{
	/* Default exit sequence for region main region */
	/* Handle exit of all possible states (of TimedStatemachine.main_region) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case TimedStatemachine_main_region_StateA :
		{
			exseq_main_region_StateA(handle);
			break;
		}
		case TimedStatemachine_main_region_StateB :
		{
			exseq_main_region_StateB(handle);
			break;
		}
		default: break;
	}
}

/* The reactions of state StateA. */
static void react_main_region_StateA(TimedStatemachine* handle)
{
	/* The reactions of state StateA. */
	if (check_main_region_StateA_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_region_StateA_tr0(handle);
	} 
}

/* The reactions of state StateB. */
static void react_main_region_StateB(TimedStatemachine* handle)
{
	/* The reactions of state StateB. */
	if (check_main_region_StateB_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_region_StateB_tr0(handle);
	} 
}

/* Default react sequence for initial entry  */
static void react_main_region__entry_Default(TimedStatemachine* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_region_StateA_default(handle);
}


