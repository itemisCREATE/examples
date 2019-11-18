
#include "Heater.h"
#include "../src/sc_types.h"
#include "../src/sc_yet.h"

/*! \file Implementation of the state machine 'Heater'
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/* prototypes of all internal functions */
static void enseq_main_region_Off_default(Heater* handle);
static void enseq_main_region_On_default(Heater* handle);
static void enseq_main_region_default(Heater* handle);
static void exseq_main_region_Off(Heater* handle);
static void exseq_main_region_On(Heater* handle);
static void exseq_main_region(Heater* handle);
static void react_main_region__entry_Default(Heater* handle);
static sc_boolean react(Heater* handle);
static sc_boolean main_region_Off_react(Heater* handle, const sc_boolean try_transition);
static sc_boolean main_region_On_react(Heater* handle, const sc_boolean try_transition);
static void clearInEvents(Heater* handle);
static void clearOutEvents(Heater* handle);



/* Write functions */

static void heater_yet_send(Heater* handle, char* key, char* value);


static void yet_convert_sc_real_tostring(char* buf, sc_real value);

static char *Heater_name = "Heater";

static char key_scoped[255];

void heater_init(Heater* handle)
{
	handle->is_running = false;
	handle->skip_yet_send = 0;
	if(handle->scope.name == 0) {
		handle->scope.name = Heater_name;
	}
	handle->scope.handler = heater_yet_dispatch_message;
	handle->scope.instance = handle;
	sc_integer i;
	
	for (i = 0; i < HEATER_MAX_ORTHOGONAL_STATES; ++i)
	{
		handle->stateConfVector[i] = Heater_last_state;
	}
	
	
	handle->stateConfVectorPosition = 0;
	
	clearInEvents(handle);
	clearOutEvents(handle);
	
	/* Default init sequence for statechart Heater */
	heaterIface_set_t(handle, 20);
}

void heater_enter(Heater* handle)
{
	heater_yet_send(handle, "@Enter", "1");
	handle->is_running = true;
	/* Default enter sequence for statechart Heater */
	enseq_main_region_default(handle);
}

void heater_runCycle(Heater* handle)
{
	heater_yet_send(handle, "@RunCycleStart", 0);
	clearOutEvents(handle);
	for (handle->stateConfVectorPosition = 0;
		handle->stateConfVectorPosition < HEATER_MAX_ORTHOGONAL_STATES;
		handle->stateConfVectorPosition++)
		{
			
		switch (handle->stateConfVector[handle->stateConfVectorPosition])
		{
		case Heater_main_region_Off:
		{
			main_region_Off_react(handle, bool_true);
			break;
		}
		case Heater_main_region_On:
		{
			main_region_On_react(handle, bool_true);
			break;
		}
		default:
			break;
		}
	}
	
	clearInEvents(handle);
	heater_yet_send(handle, "@RunCycleEnd", 0);
}

void heater_exit(Heater* handle)
{
	handle->is_running = false;
	/* Default exit sequence for statechart Heater */
	exseq_main_region(handle);
}

sc_boolean heater_isActive(const Heater* handle)
{
	sc_boolean result = bool_false;
	sc_integer i;
	
	for(i = 0; i < HEATER_MAX_ORTHOGONAL_STATES; i++)
	{
		result = result || handle->stateConfVector[i] != Heater_last_state;
	}
	
	return result;
}

/* 
 * Always returns 'false' since this state machine can never become final.
 */
sc_boolean heater_isFinal(const Heater* handle)
{
   return bool_false;
}

sc_boolean heater_isStateActive(const Heater* handle, HeaterStates state)
{
	sc_boolean result = bool_false;
	switch (state)
	{
		case Heater_main_region_Off :
			result = (sc_boolean) (handle->stateConfVector[SCVI_HEATER_MAIN_REGION_OFF] == Heater_main_region_Off
			);
				break;
		case Heater_main_region_On :
			result = (sc_boolean) (handle->stateConfVector[SCVI_HEATER_MAIN_REGION_ON] == Heater_main_region_On
			);
				break;
			default:
				result = bool_false;
				break;
		}
		return result;
	}

static void clearInEvents(Heater* handle)
{
	handle->iface.off_raised = bool_false;
	handle->iface.on_raised = bool_false;
}

static void clearOutEvents(Heater* handle)
{
}

void heaterIface_raise_off(Heater* handle)
{
	heater_yet_send(handle, "off", 0);
	handle->iface.off_raised = bool_true;
}
void heaterIface_raise_on(Heater* handle)
{
	heater_yet_send(handle, "on", 0);
	handle->iface.on_raised = bool_true;
}


sc_real heaterIface_get_t(const Heater* handle)
{
	return handle->iface.T;
}
void heaterIface_set_t(Heater* handle, sc_real value)
{
	char valueBuf[21];
	yet_convert_sc_real_tostring(valueBuf, value);
	heater_yet_send(handle, "T", valueBuf);
	
	handle->iface.T = value;
}

/* implementations of all internal functions */

/* 'default' enter sequence for state Off */
static void enseq_main_region_Off_default(Heater* handle)
{
	/* 'default' enter sequence for state Off */
	handle->stateConfVector[0] = Heater_main_region_Off;
	handle->stateConfVectorPosition = 0;
	heater_yet_send(handle, "@StateEntered", "main_region.Off");
}

/* 'default' enter sequence for state On */
static void enseq_main_region_On_default(Heater* handle)
{
	/* 'default' enter sequence for state On */
	handle->stateConfVector[0] = Heater_main_region_On;
	handle->stateConfVectorPosition = 0;
	heater_yet_send(handle, "@StateEntered", "main_region.On");
}

/* 'default' enter sequence for region main region */
static void enseq_main_region_default(Heater* handle)
{
	/* 'default' enter sequence for region main region */
	react_main_region__entry_Default(handle);
}

/* Default exit sequence for state Off */
static void exseq_main_region_Off(Heater* handle)
{
	/* Default exit sequence for state Off */
	handle->stateConfVector[0] = Heater_last_state;
	handle->stateConfVectorPosition = 0;
	heater_yet_send(handle, "@StateExited", "main_region.Off");
}

/* Default exit sequence for state On */
static void exseq_main_region_On(Heater* handle)
{
	/* Default exit sequence for state On */
	handle->stateConfVector[0] = Heater_last_state;
	handle->stateConfVectorPosition = 0;
	heater_yet_send(handle, "@StateExited", "main_region.On");
}

/* Default exit sequence for region main region */
static void exseq_main_region(Heater* handle)
{
	/* Default exit sequence for region main region */
	/* Handle exit of all possible states (of Heater.main_region) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case Heater_main_region_Off :
		{
			exseq_main_region_Off(handle);
			break;
		}
		case Heater_main_region_On :
		{
			exseq_main_region_On(handle);
			break;
		}
		default: break;
	}
}

/* Default react sequence for initial entry  */
static void react_main_region__entry_Default(Heater* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_region_Off_default(handle);
}

static sc_boolean react(Heater* handle) {
	/* State machine reactions. */
	return bool_false;
}

static sc_boolean main_region_Off_react(Heater* handle, const sc_boolean try_transition) {
	/* The reactions of state Off. */
	sc_boolean did_transition = try_transition;
	if (try_transition == bool_true)
	{ 
		if (handle->iface.on_raised == bool_true)
		{ 
			exseq_main_region_Off(handle);
			enseq_main_region_On_default(handle);
			react(handle);
		}  else
			{
				did_transition = bool_false;
			}
	} 
	if ((did_transition) == (bool_false))
	{ 
		heaterIface_set_t(handle, (handle->iface.T - (((handle->iface.T - 20)) * 0.05)));
		did_transition = react(handle);
	} 
	return did_transition;
}

static sc_boolean main_region_On_react(Heater* handle, const sc_boolean try_transition) {
	/* The reactions of state On. */
	sc_boolean did_transition = try_transition;
	if (try_transition == bool_true)
	{ 
		if (handle->iface.off_raised == bool_true)
		{ 
			exseq_main_region_On(handle);
			enseq_main_region_Off_default(handle);
			react(handle);
		}  else
			{
				did_transition = bool_false;
			}
	} 
	if ((did_transition) == (bool_false))
	{ 
		heaterIface_set_t(handle, (handle->iface.T + (((120 - handle->iface.T)) * 0.05)));
		did_transition = react(handle);
	} 
	return did_transition;
}


void heater_yet_send(Heater* handle, char* key, char* value)
{
	if(handle->skip_yet_send > 0) {
		handle->skip_yet_send--;
		return;
	}
	
	struct yet_message msg;
	
	if(handle->is_running) {
		msg.type = UPDATE;
		msg.timestamp = get_current_timestamp();
	} else {
		msg.type = INIT;
	}
	
	yet_create_scoped_message(&(handle->scope), key, key_scoped);
	
	msg.key = key_scoped;
	msg.value = value;
	yet_send(&msg);
}


void yet_convert_sc_real_tostring(char* buf, sc_real value)
{
	sprintf(buf, "%f", value);
}


uint8_t heater_yet_dispatch_message(yet_scope *scope, yet_message * msg, char *fqn)
{
	Heater* handle = scope->instance;
	char* member;
	member = fqn;
	if(strcmp(member, "T") == 0) {
		sc_real converted = atof(msg->value);
		heaterIface_set_t(handle, converted);
		return 0;
	}
	if(strcmp(member, "off") == 0) {
		// Skip one message; this should not be re-raised on host
		handle->skip_yet_send++;
		heaterIface_raise_off(handle);
		return 0;
	}
	if(strcmp(member, "on") == 0) {
		// Skip one message; this should not be re-raised on host
		handle->skip_yet_send++;
		heaterIface_raise_on(handle);
		return 0;
	}
	return -2;
}
