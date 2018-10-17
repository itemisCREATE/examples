
#include "TimedStatemachine2.h"
#include "../src/sc_types.h"
#include "TimedStatemachine2Required.h"

#include <stdlib.h>
#include <string.h>
/*! \file Implementation of the state machine 'TimedStatemachine2'
*/

/* prototypes of all internal functions */
static sc_boolean check_main_region_StateA_tr0_tr0(const TimedStatemachine2* handle);
static sc_boolean check_main_region_StateB_tr0_tr0(const TimedStatemachine2* handle);
static void effect_main_region_StateA_tr0(TimedStatemachine2* handle);
static void effect_main_region_StateB_tr0(TimedStatemachine2* handle);
static void enact_main_region_StateA(TimedStatemachine2* handle);
static void enact_main_region_StateB(TimedStatemachine2* handle);
static void exact_main_region_StateA(TimedStatemachine2* handle);
static void exact_main_region_StateB(TimedStatemachine2* handle);
static void enseq_main_region_StateA_default(TimedStatemachine2* handle);
static void enseq_main_region_StateB_default(TimedStatemachine2* handle);
static void enseq_main_region_default(TimedStatemachine2* handle);
static void exseq_main_region_StateA(TimedStatemachine2* handle);
static void exseq_main_region_StateB(TimedStatemachine2* handle);
static void exseq_main_region(TimedStatemachine2* handle);
static void react_main_region_StateA(TimedStatemachine2* handle);
static void react_main_region_StateB(TimedStatemachine2* handle);
static void react_main_region__entry_Default(TimedStatemachine2* handle);
static void clearInEvents(TimedStatemachine2* handle);
static void clearOutEvents(TimedStatemachine2* handle);


void timedStatemachine2_init(TimedStatemachine2* handle)
{
		sc_integer i;
	
		for (i = 0; i < TIMEDSTATEMACHINE2_MAX_ORTHOGONAL_STATES; ++i)
		{
			handle->stateConfVector[i] = TimedStatemachine2_last_state;
		}
		
		
		handle->stateConfVectorPosition = 0;
	
		clearInEvents(handle);
		clearOutEvents(handle);
	
}

void timedStatemachine2_enter(TimedStatemachine2* handle)
{
	/* Default enter sequence for statechart TimedStatemachine2 */
	enseq_main_region_default(handle);
}

void timedStatemachine2_runCycle(TimedStatemachine2* handle)
{
	clearOutEvents(handle);
	for (handle->stateConfVectorPosition = 0;
		handle->stateConfVectorPosition < TIMEDSTATEMACHINE2_MAX_ORTHOGONAL_STATES;
		handle->stateConfVectorPosition++)
		{
			
		switch (handle->stateConfVector[handle->stateConfVectorPosition])
		{
		case TimedStatemachine2_main_region_StateA:
		{
			react_main_region_StateA(handle);
			break;
		}
		case TimedStatemachine2_main_region_StateB:
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

void timedStatemachine2_exit(TimedStatemachine2* handle)
{
	/* Default exit sequence for statechart TimedStatemachine2 */
	exseq_main_region(handle);
}

sc_boolean timedStatemachine2_isActive(const TimedStatemachine2* handle)
{
	sc_boolean result = bool_false;
	int i;
	
	for(i = 0; i < TIMEDSTATEMACHINE2_MAX_ORTHOGONAL_STATES; i++)
	{
		result = result || handle->stateConfVector[i] != TimedStatemachine2_last_state;
	}
	
	return result;
}

/* 
 * Always returns 'false' since this state machine can never become final.
 */
sc_boolean timedStatemachine2_isFinal(const TimedStatemachine2* handle)
{
   return bool_false;
}

void timedStatemachine2_raiseTimeEvent(TimedStatemachine2* handle, sc_eventid evid)
{
	if ( ((sc_intptr_t)evid) >= ((sc_intptr_t)&(handle->timeEvents))
		&&  ((sc_intptr_t)evid) < ((sc_intptr_t)&(handle->timeEvents)) + sizeof(TimedStatemachine2TimeEvents))
		{
		*(sc_boolean*)evid = bool_true;
	}		
}

sc_boolean timedStatemachine2_isStateActive(const TimedStatemachine2* handle, TimedStatemachine2States state)
{
	sc_boolean result = bool_false;
	switch (state)
	{
		case TimedStatemachine2_main_region_StateA :
			result = (sc_boolean) (handle->stateConfVector[SCVI_TIMEDSTATEMACHINE2_MAIN_REGION_STATEA] == TimedStatemachine2_main_region_StateA
			);
			break;
		case TimedStatemachine2_main_region_StateB :
			result = (sc_boolean) (handle->stateConfVector[SCVI_TIMEDSTATEMACHINE2_MAIN_REGION_STATEB] == TimedStatemachine2_main_region_StateB
			);
			break;
		default:
			result = bool_false;
			break;
	}
	return result;
}

static void clearInEvents(TimedStatemachine2* handle)
{
	handle->timeEvents.timedStatemachine2_main_region_StateA_tev0_raised = bool_false;
	handle->timeEvents.timedStatemachine2_main_region_StateB_tev0_raised = bool_false;
}

static void clearOutEvents(TimedStatemachine2* handle)
{
}


/* implementations of all internal functions */

static sc_boolean check_main_region_StateA_tr0_tr0(const TimedStatemachine2* handle)
{
	return handle->timeEvents.timedStatemachine2_main_region_StateA_tev0_raised;
}

static sc_boolean check_main_region_StateB_tr0_tr0(const TimedStatemachine2* handle)
{
	return handle->timeEvents.timedStatemachine2_main_region_StateB_tev0_raised;
}

static void effect_main_region_StateA_tr0(TimedStatemachine2* handle)
{
	exseq_main_region_StateA(handle);
	enseq_main_region_StateB_default(handle);
}

static void effect_main_region_StateB_tr0(TimedStatemachine2* handle)
{
	exseq_main_region_StateB(handle);
	enseq_main_region_StateA_default(handle);
}

/* Entry action for state 'StateA'. */
static void enact_main_region_StateA(TimedStatemachine2* handle)
{
	/* Entry action for state 'StateA'. */
	timedStatemachine2_setTimer(handle, (sc_eventid) &(handle->timeEvents.timedStatemachine2_main_region_StateA_tev0_raised) , 1 * 1000, bool_false);
}

/* Entry action for state 'StateB'. */
static void enact_main_region_StateB(TimedStatemachine2* handle)
{
	/* Entry action for state 'StateB'. */
	timedStatemachine2_setTimer(handle, (sc_eventid) &(handle->timeEvents.timedStatemachine2_main_region_StateB_tev0_raised) , 1 * 1000, bool_false);
}

/* Exit action for state 'StateA'. */
static void exact_main_region_StateA(TimedStatemachine2* handle)
{
	/* Exit action for state 'StateA'. */
	timedStatemachine2_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.timedStatemachine2_main_region_StateA_tev0_raised) );		
}

/* Exit action for state 'StateB'. */
static void exact_main_region_StateB(TimedStatemachine2* handle)
{
	/* Exit action for state 'StateB'. */
	timedStatemachine2_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.timedStatemachine2_main_region_StateB_tev0_raised) );		
}

/* 'default' enter sequence for state StateA */
static void enseq_main_region_StateA_default(TimedStatemachine2* handle)
{
	/* 'default' enter sequence for state StateA */
	enact_main_region_StateA(handle);
	handle->stateConfVector[0] = TimedStatemachine2_main_region_StateA;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state StateB */
static void enseq_main_region_StateB_default(TimedStatemachine2* handle)
{
	/* 'default' enter sequence for state StateB */
	enact_main_region_StateB(handle);
	handle->stateConfVector[0] = TimedStatemachine2_main_region_StateB;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for region main region */
static void enseq_main_region_default(TimedStatemachine2* handle)
{
	/* 'default' enter sequence for region main region */
	react_main_region__entry_Default(handle);
}

/* Default exit sequence for state StateA */
static void exseq_main_region_StateA(TimedStatemachine2* handle)
{
	/* Default exit sequence for state StateA */
	handle->stateConfVector[0] = TimedStatemachine2_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_region_StateA(handle);
}

/* Default exit sequence for state StateB */
static void exseq_main_region_StateB(TimedStatemachine2* handle)
{
	/* Default exit sequence for state StateB */
	handle->stateConfVector[0] = TimedStatemachine2_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_region_StateB(handle);
}

/* Default exit sequence for region main region */
static void exseq_main_region(TimedStatemachine2* handle)
{
	/* Default exit sequence for region main region */
	/* Handle exit of all possible states (of TimedStatemachine2.main_region) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case TimedStatemachine2_main_region_StateA :
		{
			exseq_main_region_StateA(handle);
			break;
		}
		case TimedStatemachine2_main_region_StateB :
		{
			exseq_main_region_StateB(handle);
			break;
		}
		default: break;
	}
}

/* The reactions of state StateA. */
static void react_main_region_StateA(TimedStatemachine2* handle)
{
	/* The reactions of state StateA. */
	if (check_main_region_StateA_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_region_StateA_tr0(handle);
	} 
}

/* The reactions of state StateB. */
static void react_main_region_StateB(TimedStatemachine2* handle)
{
	/* The reactions of state StateB. */
	if (check_main_region_StateB_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_region_StateB_tr0(handle);
	} 
}

/* Default react sequence for initial entry  */
static void react_main_region__entry_Default(TimedStatemachine2* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_region_StateA_default(handle);
}


