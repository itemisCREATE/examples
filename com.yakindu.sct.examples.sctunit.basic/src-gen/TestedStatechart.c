
#include <stdlib.h>
#include <string.h>
#include "sc_types.h"
#include "TestedStatechart.h"
#include "TestedStatechartRequired.h"
/*! \file Implementation of the state machine 'testedStatechart'
*/

/* prototypes of all internal functions */
static sc_boolean testedStatechart_check_main_region_Idle_tr0_tr0(const TestedStatechart* handle);
static sc_boolean testedStatechart_check_main_region_Process_tr0_tr0(const TestedStatechart* handle);
static sc_boolean testedStatechart_check_main_region_Done_tr0_tr0(const TestedStatechart* handle);
static sc_boolean testedStatechart_check_main_region__choice_0_tr0_tr0(const TestedStatechart* handle);
static sc_boolean testedStatechart_check_main_region__choice_0_tr1_tr1(const TestedStatechart* handle);
static void testedStatechart_effect_main_region_Idle_tr0(TestedStatechart* handle);
static void testedStatechart_effect_main_region_Process_tr0(TestedStatechart* handle);
static void testedStatechart_effect_main_region_Done_tr0(TestedStatechart* handle);
static void testedStatechart_effect_main_region__choice_0_tr0(TestedStatechart* handle);
static void testedStatechart_effect_main_region__choice_0_tr1(TestedStatechart* handle);
static void testedStatechart_enact_main_region_Process(TestedStatechart* handle);
static void testedStatechart_enact_main_region_Done(TestedStatechart* handle);
static void testedStatechart_exact_main_region_Process(TestedStatechart* handle);
static void testedStatechart_enseq_main_region_Idle_default(TestedStatechart* handle);
static void testedStatechart_enseq_main_region_Process_default(TestedStatechart* handle);
static void testedStatechart_enseq_main_region_Done_default(TestedStatechart* handle);
static void testedStatechart_enseq_main_region_default(TestedStatechart* handle);
static void testedStatechart_exseq_main_region_Idle(TestedStatechart* handle);
static void testedStatechart_exseq_main_region_Process(TestedStatechart* handle);
static void testedStatechart_exseq_main_region_Done(TestedStatechart* handle);
static void testedStatechart_exseq_main_region(TestedStatechart* handle);
static void testedStatechart_react_main_region_Idle(TestedStatechart* handle);
static void testedStatechart_react_main_region_Process(TestedStatechart* handle);
static void testedStatechart_react_main_region_Done(TestedStatechart* handle);
static void testedStatechart_react_main_region__choice_0(TestedStatechart* handle);
static void testedStatechart_react_main_region__entry_Default(TestedStatechart* handle);
static void testedStatechart_clearInEvents(TestedStatechart* handle);
static void testedStatechart_clearOutEvents(TestedStatechart* handle);


void testedStatechart_init(TestedStatechart* handle)
{
		sc_integer i;
	
		for (i = 0; i < TESTEDSTATECHART_MAX_ORTHOGONAL_STATES; ++i)
		{
			handle->stateConfVector[i] = TestedStatechart_last_state;
		}
		
		
		handle->stateConfVectorPosition = 0;
	
		testedStatechart_clearInEvents(handle);
		testedStatechart_clearOutEvents(handle);
	
		/* Default init sequence for statechart testedStatechart */
		handle->iface.quality = 0.0;
		handle->iface.good = 0;
		handle->iface.bad = 0;
}

void testedStatechart_enter(TestedStatechart* handle)
{
	/* Default enter sequence for statechart testedStatechart */
	testedStatechart_enseq_main_region_default(handle);
}

void testedStatechart_exit(TestedStatechart* handle)
{
	/* Default exit sequence for statechart testedStatechart */
	testedStatechart_exseq_main_region(handle);
}

sc_boolean testedStatechart_isActive(const TestedStatechart* handle)
{
	sc_boolean result = bool_false;
	int i;
	
	for(i = 0; i < TESTEDSTATECHART_MAX_ORTHOGONAL_STATES; i++)
	{
		result = result || handle->stateConfVector[i] != TestedStatechart_last_state;
	}
	
	return result;
}

/* 
 * Always returns 'false' since this state machine can never become final.
 */
sc_boolean testedStatechart_isFinal(const TestedStatechart* handle)
{
   return bool_false;
}

static void testedStatechart_clearInEvents(TestedStatechart* handle)
{
	handle->iface.start_raised = bool_false;
	handle->timeEvents.testedStatechart_main_region_Process_tev0_raised = bool_false;
}

static void testedStatechart_clearOutEvents(TestedStatechart* handle)
{
	handle->iface.QA_bad_raised = bool_false;
	handle->iface.QA_good_raised = bool_false;
}

void testedStatechart_runCycle(TestedStatechart* handle)
{
	
	testedStatechart_clearOutEvents(handle);
	for (handle->stateConfVectorPosition = 0;
		handle->stateConfVectorPosition < TESTEDSTATECHART_MAX_ORTHOGONAL_STATES;
		handle->stateConfVectorPosition++)
		{
			
		switch (handle->stateConfVector[handle->stateConfVectorPosition])
		{
		case TestedStatechart_main_region_Idle:
		{
			testedStatechart_react_main_region_Idle(handle);
			break;
		}
		case TestedStatechart_main_region_Process:
		{
			testedStatechart_react_main_region_Process(handle);
			break;
		}
		case TestedStatechart_main_region_Done:
		{
			testedStatechart_react_main_region_Done(handle);
			break;
		}
		default:
			break;
		}
	}
	
	testedStatechart_clearInEvents(handle);
}

void testedStatechart_raiseTimeEvent(const TestedStatechart* handle, sc_eventid evid)
{
	if ( ((sc_intptr_t)evid) >= ((sc_intptr_t)&(handle->timeEvents))
		&&  ((sc_intptr_t)evid) < ((sc_intptr_t)&(handle->timeEvents)) + sizeof(TestedStatechartTimeEvents))
		{
		*(sc_boolean*)evid = bool_true;
	}		
}

sc_boolean testedStatechart_isStateActive(const TestedStatechart* handle, TestedStatechartStates state)
{
	sc_boolean result = bool_false;
	switch (state)
	{
		case TestedStatechart_main_region_Idle :
			result = (sc_boolean) (handle->stateConfVector[SCVI_TESTEDSTATECHART_MAIN_REGION_IDLE] == TestedStatechart_main_region_Idle
			);
			break;
		case TestedStatechart_main_region_Process :
			result = (sc_boolean) (handle->stateConfVector[SCVI_TESTEDSTATECHART_MAIN_REGION_PROCESS] == TestedStatechart_main_region_Process
			);
			break;
		case TestedStatechart_main_region_Done :
			result = (sc_boolean) (handle->stateConfVector[SCVI_TESTEDSTATECHART_MAIN_REGION_DONE] == TestedStatechart_main_region_Done
			);
			break;
		default:
			result = bool_false;
			break;
	}
	return result;
}

void testedStatechartIface_raise_start(TestedStatechart* handle)
{
	handle->iface.start_raised = bool_true;
}

sc_boolean testedStatechartIface_israised_qA_bad(const TestedStatechart* handle)
{
	return handle->iface.QA_bad_raised;
}
sc_boolean testedStatechartIface_israised_qA_good(const TestedStatechart* handle)
{
	return handle->iface.QA_good_raised;
}

sc_real testedStatechartIface_get_quality(const TestedStatechart* handle)
{
	return handle->iface.quality;
}
void testedStatechartIface_set_quality(TestedStatechart* handle, sc_real value)
{
	handle->iface.quality = value;
}
sc_integer testedStatechartIface_get_good(const TestedStatechart* handle)
{
	return handle->iface.good;
}
void testedStatechartIface_set_good(TestedStatechart* handle, sc_integer value)
{
	handle->iface.good = value;
}
sc_integer testedStatechartIface_get_bad(const TestedStatechart* handle)
{
	return handle->iface.bad;
}
void testedStatechartIface_set_bad(TestedStatechart* handle, sc_integer value)
{
	handle->iface.bad = value;
}

/* implementations of all internal functions */

static sc_boolean testedStatechart_check_main_region_Idle_tr0_tr0(const TestedStatechart* handle)
{
	return handle->iface.start_raised;
}

static sc_boolean testedStatechart_check_main_region_Process_tr0_tr0(const TestedStatechart* handle)
{
	return handle->timeEvents.testedStatechart_main_region_Process_tev0_raised;
}

static sc_boolean testedStatechart_check_main_region_Done_tr0_tr0(const TestedStatechart* handle)
{
	return bool_true;
}

static sc_boolean testedStatechart_check_main_region__choice_0_tr0_tr0(const TestedStatechart* handle)
{
	return (handle->iface.quality > 0.95) ? bool_true : bool_false;
}

static sc_boolean testedStatechart_check_main_region__choice_0_tr1_tr1(const TestedStatechart* handle)
{
	return bool_true;
}

static void testedStatechart_effect_main_region_Idle_tr0(TestedStatechart* handle)
{
	testedStatechart_exseq_main_region_Idle(handle);
	testedStatechart_enseq_main_region_Process_default(handle);
}

static void testedStatechart_effect_main_region_Process_tr0(TestedStatechart* handle)
{
	testedStatechart_exseq_main_region_Process(handle);
	testedStatechart_enseq_main_region_Done_default(handle);
}

static void testedStatechart_effect_main_region_Done_tr0(TestedStatechart* handle)
{
	testedStatechart_exseq_main_region_Done(handle);
	testedStatechart_react_main_region__choice_0(handle);
}

static void testedStatechart_effect_main_region__choice_0_tr0(TestedStatechart* handle)
{
	handle->iface.good += 1;
	handle->iface.QA_good_raised = bool_true;
	testedStatechart_enseq_main_region_Idle_default(handle);
}

static void testedStatechart_effect_main_region__choice_0_tr1(TestedStatechart* handle)
{
	handle->iface.bad += 1;
	handle->iface.QA_bad_raised = bool_true;
	testedStatechart_enseq_main_region_Idle_default(handle);
}

/* Entry action for state 'Process'. */
static void testedStatechart_enact_main_region_Process(TestedStatechart* handle)
{
	/* Entry action for state 'Process'. */
	testedStatechart_setTimer(handle, (sc_eventid) &(handle->timeEvents.testedStatechart_main_region_Process_tev0_raised) , 10 * 1000, bool_false);
}

/* Entry action for state 'Done'. */
static void testedStatechart_enact_main_region_Done(TestedStatechart* handle)
{
	/* Entry action for state 'Done'. */
	handle->iface.quality = testedStatechartIface_getQuality(handle);
}

/* Exit action for state 'Process'. */
static void testedStatechart_exact_main_region_Process(TestedStatechart* handle)
{
	/* Exit action for state 'Process'. */
	testedStatechart_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.testedStatechart_main_region_Process_tev0_raised) );		
}

/* 'default' enter sequence for state Idle */
static void testedStatechart_enseq_main_region_Idle_default(TestedStatechart* handle)
{
	/* 'default' enter sequence for state Idle */
	handle->stateConfVector[0] = TestedStatechart_main_region_Idle;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Process */
static void testedStatechart_enseq_main_region_Process_default(TestedStatechart* handle)
{
	/* 'default' enter sequence for state Process */
	testedStatechart_enact_main_region_Process(handle);
	handle->stateConfVector[0] = TestedStatechart_main_region_Process;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Done */
static void testedStatechart_enseq_main_region_Done_default(TestedStatechart* handle)
{
	/* 'default' enter sequence for state Done */
	testedStatechart_enact_main_region_Done(handle);
	handle->stateConfVector[0] = TestedStatechart_main_region_Done;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for region main region */
static void testedStatechart_enseq_main_region_default(TestedStatechart* handle)
{
	/* 'default' enter sequence for region main region */
	testedStatechart_react_main_region__entry_Default(handle);
}

/* Default exit sequence for state Idle */
static void testedStatechart_exseq_main_region_Idle(TestedStatechart* handle)
{
	/* Default exit sequence for state Idle */
	handle->stateConfVector[0] = TestedStatechart_last_state;
	handle->stateConfVectorPosition = 0;
}

/* Default exit sequence for state Process */
static void testedStatechart_exseq_main_region_Process(TestedStatechart* handle)
{
	/* Default exit sequence for state Process */
	handle->stateConfVector[0] = TestedStatechart_last_state;
	handle->stateConfVectorPosition = 0;
	testedStatechart_exact_main_region_Process(handle);
}

/* Default exit sequence for state Done */
static void testedStatechart_exseq_main_region_Done(TestedStatechart* handle)
{
	/* Default exit sequence for state Done */
	handle->stateConfVector[0] = TestedStatechart_last_state;
	handle->stateConfVectorPosition = 0;
}

/* Default exit sequence for region main region */
static void testedStatechart_exseq_main_region(TestedStatechart* handle)
{
	/* Default exit sequence for region main region */
	/* Handle exit of all possible states (of testedStatechart.main_region) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case TestedStatechart_main_region_Idle :
		{
			testedStatechart_exseq_main_region_Idle(handle);
			break;
		}
		case TestedStatechart_main_region_Process :
		{
			testedStatechart_exseq_main_region_Process(handle);
			break;
		}
		case TestedStatechart_main_region_Done :
		{
			testedStatechart_exseq_main_region_Done(handle);
			break;
		}
		default: break;
	}
}

/* The reactions of state Idle. */
static void testedStatechart_react_main_region_Idle(TestedStatechart* handle)
{
	/* The reactions of state Idle. */
	if (testedStatechart_check_main_region_Idle_tr0_tr0(handle) == bool_true)
	{ 
		testedStatechart_effect_main_region_Idle_tr0(handle);
	} 
}

/* The reactions of state Process. */
static void testedStatechart_react_main_region_Process(TestedStatechart* handle)
{
	/* The reactions of state Process. */
	if (testedStatechart_check_main_region_Process_tr0_tr0(handle) == bool_true)
	{ 
		testedStatechart_effect_main_region_Process_tr0(handle);
	} 
}

/* The reactions of state Done. */
static void testedStatechart_react_main_region_Done(TestedStatechart* handle)
{
	/* The reactions of state Done. */
	testedStatechart_effect_main_region_Done_tr0(handle);
}

/* The reactions of state null. */
static void testedStatechart_react_main_region__choice_0(TestedStatechart* handle)
{
	/* The reactions of state null. */
	if (testedStatechart_check_main_region__choice_0_tr0_tr0(handle) == bool_true)
	{ 
		testedStatechart_effect_main_region__choice_0_tr0(handle);
	}  else
	{
		testedStatechart_effect_main_region__choice_0_tr1(handle);
	}
}

/* Default react sequence for initial entry  */
static void testedStatechart_react_main_region__entry_Default(TestedStatechart* handle)
{
	/* Default react sequence for initial entry  */
	testedStatechart_enseq_main_region_Idle_default(handle);
}


