
#include "Controller.h"
#include "../src/sc_types.h"
#include "../src/sc_yet.h"

/*! \file Implementation of the state machine 'Controller'
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/* prototypes of all internal functions */
static void enact_main_region_Idle(Controller* handle);
static void enact_main_region_Heating_r1_Off(Controller* handle);
static void enact_main_region_Heating_r1_On(Controller* handle);
static void enseq_main_region_Idle_default(Controller* handle);
static void enseq_main_region_Heating_default(Controller* handle);
static void enseq_main_region_Heating_r1_Off_default(Controller* handle);
static void enseq_main_region_Heating_r1_On_default(Controller* handle);
static void enseq_main_region_default(Controller* handle);
static void enseq_main_region_Heating_r1_default(Controller* handle);
static void exseq_main_region_Idle(Controller* handle);
static void exseq_main_region_Heating(Controller* handle);
static void exseq_main_region_Heating_r1_Off(Controller* handle);
static void exseq_main_region_Heating_r1_On(Controller* handle);
static void exseq_main_region(Controller* handle);
static void exseq_main_region_Heating_r1(Controller* handle);
static void react_main_region__entry_Default(Controller* handle);
static void react_main_region_Heating_r1__entry_Default(Controller* handle);
static sc_boolean react(Controller* handle);
static sc_boolean main_region_Idle_react(Controller* handle, const sc_boolean try_transition);
static sc_boolean main_region_Heating_react(Controller* handle, const sc_boolean try_transition);
static sc_boolean main_region_Heating_r1_Off_react(Controller* handle, const sc_boolean try_transition);
static sc_boolean main_region_Heating_r1_On_react(Controller* handle, const sc_boolean try_transition);
static void clearInEvents(Controller* handle);
static void clearOutEvents(Controller* handle);


static void controllerInternal_set_temperature(Controller* handle, sc_real value);

/* Write functions */

static void controller_yet_send(Controller* handle, char* key, char* value);


static void yet_convert_sc_real_tostring(char* buf, sc_real value);

static char *Controller_name = "Controller";

static char key_scoped[255];

void controller_init(Controller* handle)
{
	handle->is_running = false;
	handle->skip_yet_send = 0;
	if(handle->scope.name == 0) {
		handle->scope.name = Controller_name;
	}
	handle->scope.handler = controller_yet_dispatch_message;
	handle->scope.instance = handle;
	sc_integer i;
	
	for (i = 0; i < CONTROLLER_MAX_ORTHOGONAL_STATES; ++i)
	{
		handle->stateConfVector[i] = Controller_last_state;
	}
	
	
	handle->stateConfVectorPosition = 0;
	
	clearInEvents(handle);
	clearOutEvents(handle);
	
	/* Default init sequence for statechart Controller */
	controllerIface_set_targetTemp(handle, 0.0);
	controllerInternal_set_temperature(handle, 0.0);
}

void controller_enter(Controller* handle)
{
	controller_yet_send(handle, "@Enter", "1");
	handle->is_running = true;
	/* Default enter sequence for statechart Controller */
	enseq_main_region_default(handle);
}

void controller_runCycle(Controller* handle)
{
	controller_yet_send(handle, "@RunCycleStart", 0);
	clearOutEvents(handle);
	for (handle->stateConfVectorPosition = 0;
		handle->stateConfVectorPosition < CONTROLLER_MAX_ORTHOGONAL_STATES;
		handle->stateConfVectorPosition++)
		{
			
		switch (handle->stateConfVector[handle->stateConfVectorPosition])
		{
		case Controller_main_region_Idle:
		{
			main_region_Idle_react(handle, bool_true);
			break;
		}
		case Controller_main_region_Heating_r1_Off:
		{
			main_region_Heating_r1_Off_react(handle, bool_true);
			break;
		}
		case Controller_main_region_Heating_r1_On:
		{
			main_region_Heating_r1_On_react(handle, bool_true);
			break;
		}
		default:
			break;
		}
	}
	
	clearInEvents(handle);
	controller_yet_send(handle, "@RunCycleEnd", 0);
}

void controller_exit(Controller* handle)
{
	handle->is_running = false;
	/* Default exit sequence for statechart Controller */
	exseq_main_region(handle);
}

sc_boolean controller_isActive(const Controller* handle)
{
	sc_boolean result = bool_false;
	sc_integer i;
	
	for(i = 0; i < CONTROLLER_MAX_ORTHOGONAL_STATES; i++)
	{
		result = result || handle->stateConfVector[i] != Controller_last_state;
	}
	
	return result;
}

/* 
 * Always returns 'false' since this state machine can never become final.
 */
sc_boolean controller_isFinal(const Controller* handle)
{
   return bool_false;
}

sc_boolean controller_isStateActive(const Controller* handle, ControllerStates state)
{
	sc_boolean result = bool_false;
	switch (state)
	{
		case Controller_main_region_Idle :
			result = (sc_boolean) (handle->stateConfVector[SCVI_CONTROLLER_MAIN_REGION_IDLE] == Controller_main_region_Idle
			);
				break;
		case Controller_main_region_Heating :
			result = (sc_boolean) (handle->stateConfVector[SCVI_CONTROLLER_MAIN_REGION_HEATING] >= Controller_main_region_Heating
				&& handle->stateConfVector[SCVI_CONTROLLER_MAIN_REGION_HEATING] <= Controller_main_region_Heating_r1_On);
				break;
		case Controller_main_region_Heating_r1_Off :
			result = (sc_boolean) (handle->stateConfVector[SCVI_CONTROLLER_MAIN_REGION_HEATING_R1_OFF] == Controller_main_region_Heating_r1_Off
			);
				break;
		case Controller_main_region_Heating_r1_On :
			result = (sc_boolean) (handle->stateConfVector[SCVI_CONTROLLER_MAIN_REGION_HEATING_R1_ON] == Controller_main_region_Heating_r1_On
			);
				break;
			default:
				result = bool_false;
				break;
		}
		return result;
	}

static void clearInEvents(Controller* handle)
{
	handle->iface.temperatureChanged_raised = bool_false;
	handle->iface.on_raised = bool_false;
	handle->iface.off_raised = bool_false;
}

static void clearOutEvents(Controller* handle)
{
	handle->iface.heaterOn_raised = bool_false;
	handle->iface.heaterOff_raised = bool_false;
}

void controllerIface_raise_temperatureChanged(Controller* handle, sc_real value)
{
	handle->iface.temperatureChanged_value = value;
	char valueBuf[30];
	yet_convert_sc_real_tostring(valueBuf, value);
	controller_yet_send(handle, "temperatureChanged", valueBuf);
	handle->iface.temperatureChanged_raised = bool_true;
	
	controller_runCycle(handle);
}
void controllerIface_raise_on(Controller* handle)
{
	controller_yet_send(handle, "on", 0);
	handle->iface.on_raised = bool_true;
	
	controller_runCycle(handle);
}
void controllerIface_raise_off(Controller* handle)
{
	controller_yet_send(handle, "off", 0);
	handle->iface.off_raised = bool_true;
	
	controller_runCycle(handle);
}

sc_boolean controllerIface_israised_heaterOn(const Controller* handle)
{
	return handle->iface.heaterOn_raised;
}
sc_boolean controllerIface_israised_heaterOff(const Controller* handle)
{
	return handle->iface.heaterOff_raised;
}

sc_real controllerIface_get_targetTemp(const Controller* handle)
{
	return handle->iface.targetTemp;
}
void controllerIface_set_targetTemp(Controller* handle, sc_real value)
{
	char valueBuf[21];
	yet_convert_sc_real_tostring(valueBuf, value);
	controller_yet_send(handle, "targetTemp", valueBuf);
	
	handle->iface.targetTemp = value;
}
void controllerInternal_set_temperature(Controller* handle, sc_real value)
{
	char valueBuf[21];
	yet_convert_sc_real_tostring(valueBuf, value);
	controller_yet_send(handle, "temperature", valueBuf);
	
	handle->internal.temperature = value;
}

/* implementations of all internal functions */

/* Entry action for state 'Idle'. */
static void enact_main_region_Idle(Controller* handle)
{
	/* Entry action for state 'Idle'. */
	controller_yet_send(handle, "heaterOff", 0);
	handle->iface.heaterOff_raised = bool_true;
}

/* Entry action for state 'Off'. */
static void enact_main_region_Heating_r1_Off(Controller* handle)
{
	/* Entry action for state 'Off'. */
	controller_yet_send(handle, "heaterOff", 0);
	handle->iface.heaterOff_raised = bool_true;
}

/* Entry action for state 'On'. */
static void enact_main_region_Heating_r1_On(Controller* handle)
{
	/* Entry action for state 'On'. */
	controller_yet_send(handle, "heaterOn", 0);
	handle->iface.heaterOn_raised = bool_true;
}

/* 'default' enter sequence for state Idle */
static void enseq_main_region_Idle_default(Controller* handle)
{
	/* 'default' enter sequence for state Idle */
	enact_main_region_Idle(handle);
	handle->stateConfVector[0] = Controller_main_region_Idle;
	handle->stateConfVectorPosition = 0;
	controller_yet_send(handle, "@StateEntered", "main_region.Idle");
}

/* 'default' enter sequence for state Heating */
static void enseq_main_region_Heating_default(Controller* handle)
{
	/* 'default' enter sequence for state Heating */
	enseq_main_region_Heating_r1_default(handle);
}

/* 'default' enter sequence for state Off */
static void enseq_main_region_Heating_r1_Off_default(Controller* handle)
{
	/* 'default' enter sequence for state Off */
	enact_main_region_Heating_r1_Off(handle);
	handle->stateConfVector[0] = Controller_main_region_Heating_r1_Off;
	handle->stateConfVectorPosition = 0;
	controller_yet_send(handle, "@StateEntered", "main_region.Heating.r1.Off");
}

/* 'default' enter sequence for state On */
static void enseq_main_region_Heating_r1_On_default(Controller* handle)
{
	/* 'default' enter sequence for state On */
	enact_main_region_Heating_r1_On(handle);
	handle->stateConfVector[0] = Controller_main_region_Heating_r1_On;
	handle->stateConfVectorPosition = 0;
	controller_yet_send(handle, "@StateEntered", "main_region.Heating.r1.On");
}

/* 'default' enter sequence for region main region */
static void enseq_main_region_default(Controller* handle)
{
	/* 'default' enter sequence for region main region */
	react_main_region__entry_Default(handle);
}

/* 'default' enter sequence for region r1 */
static void enseq_main_region_Heating_r1_default(Controller* handle)
{
	/* 'default' enter sequence for region r1 */
	react_main_region_Heating_r1__entry_Default(handle);
}

/* Default exit sequence for state Idle */
static void exseq_main_region_Idle(Controller* handle)
{
	/* Default exit sequence for state Idle */
	handle->stateConfVector[0] = Controller_last_state;
	handle->stateConfVectorPosition = 0;
	controller_yet_send(handle, "@StateExited", "main_region.Idle");
}

/* Default exit sequence for state Heating */
static void exseq_main_region_Heating(Controller* handle)
{
	/* Default exit sequence for state Heating */
	exseq_main_region_Heating_r1(handle);
}

/* Default exit sequence for state Off */
static void exseq_main_region_Heating_r1_Off(Controller* handle)
{
	/* Default exit sequence for state Off */
	handle->stateConfVector[0] = Controller_last_state;
	handle->stateConfVectorPosition = 0;
	controller_yet_send(handle, "@StateExited", "main_region.Heating.r1.Off");
}

/* Default exit sequence for state On */
static void exseq_main_region_Heating_r1_On(Controller* handle)
{
	/* Default exit sequence for state On */
	handle->stateConfVector[0] = Controller_last_state;
	handle->stateConfVectorPosition = 0;
	controller_yet_send(handle, "@StateExited", "main_region.Heating.r1.On");
}

/* Default exit sequence for region main region */
static void exseq_main_region(Controller* handle)
{
	/* Default exit sequence for region main region */
	/* Handle exit of all possible states (of Controller.main_region) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case Controller_main_region_Idle :
		{
			exseq_main_region_Idle(handle);
			break;
		}
		case Controller_main_region_Heating_r1_Off :
		{
			exseq_main_region_Heating_r1_Off(handle);
			break;
		}
		case Controller_main_region_Heating_r1_On :
		{
			exseq_main_region_Heating_r1_On(handle);
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r1 */
static void exseq_main_region_Heating_r1(Controller* handle)
{
	/* Default exit sequence for region r1 */
	/* Handle exit of all possible states (of Controller.main_region.Heating.r1) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case Controller_main_region_Heating_r1_Off :
		{
			exseq_main_region_Heating_r1_Off(handle);
			break;
		}
		case Controller_main_region_Heating_r1_On :
		{
			exseq_main_region_Heating_r1_On(handle);
			break;
		}
		default: break;
	}
}

/* Default react sequence for initial entry  */
static void react_main_region__entry_Default(Controller* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_region_Idle_default(handle);
}

/* Default react sequence for initial entry  */
static void react_main_region_Heating_r1__entry_Default(Controller* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_region_Heating_r1_Off_default(handle);
}

static sc_boolean react(Controller* handle) {
	/* State machine reactions. */
	if (handle->iface.temperatureChanged_raised == bool_true)
	{ 
		controllerInternal_set_temperature(handle, handle->iface.temperatureChanged_value);
	} 
	return bool_false;
}

static sc_boolean main_region_Idle_react(Controller* handle, const sc_boolean try_transition) {
	/* The reactions of state Idle. */
	sc_boolean did_transition = try_transition;
	if (try_transition == bool_true)
	{ 
		if (handle->iface.on_raised == bool_true)
		{ 
			exseq_main_region_Idle(handle);
			enseq_main_region_Heating_default(handle);
			react(handle);
		}  else
			{
				did_transition = bool_false;
			}
	} 
	if ((did_transition) == (bool_false))
	{ 
		did_transition = react(handle);
	} 
	return did_transition;
}

static sc_boolean main_region_Heating_react(Controller* handle, const sc_boolean try_transition) {
	/* The reactions of state Heating. */
	sc_boolean did_transition = try_transition;
	if (try_transition == bool_true)
	{ 
		if (handle->iface.off_raised == bool_true)
		{ 
			exseq_main_region_Heating(handle);
			enseq_main_region_Idle_default(handle);
			react(handle);
		}  else
			{
				did_transition = bool_false;
			}
	} 
	if ((did_transition) == (bool_false))
	{ 
		did_transition = react(handle);
	} 
	return did_transition;
}

static sc_boolean main_region_Heating_r1_Off_react(Controller* handle, const sc_boolean try_transition) {
	/* The reactions of state Off. */
	sc_boolean did_transition = try_transition;
	if (try_transition == bool_true)
	{ 
		if ((handle->internal.temperature) < (handle->iface.targetTemp))
		{ 
			exseq_main_region_Heating_r1_Off(handle);
			enseq_main_region_Heating_r1_On_default(handle);
			main_region_Heating_react(handle, bool_false);
		}  else
			{
				did_transition = bool_false;
			}
	} 
	if ((did_transition) == (bool_false))
	{ 
		did_transition = main_region_Heating_react(handle, try_transition);
	} 
	return did_transition;
}

static sc_boolean main_region_Heating_r1_On_react(Controller* handle, const sc_boolean try_transition) {
	/* The reactions of state On. */
	sc_boolean did_transition = try_transition;
	if (try_transition == bool_true)
	{ 
		if ((handle->internal.temperature) > (handle->iface.targetTemp))
		{ 
			exseq_main_region_Heating_r1_On(handle);
			enseq_main_region_Heating_r1_Off_default(handle);
			main_region_Heating_react(handle, bool_false);
		}  else
			{
				did_transition = bool_false;
			}
	} 
	if ((did_transition) == (bool_false))
	{ 
		did_transition = main_region_Heating_react(handle, try_transition);
	} 
	return did_transition;
}


void controller_yet_send(Controller* handle, char* key, char* value)
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


uint8_t controller_yet_dispatch_message(yet_scope *scope, yet_message * msg, char *fqn)
{
	Controller* handle = scope->instance;
	char* member;
	member = fqn;
	if(strcmp(member, "targetTemp") == 0) {
		sc_real converted = atof(msg->value);
		controllerIface_set_targetTemp(handle, converted);
		return 0;
	}
	if(strcmp(member, "temperatureChanged") == 0) {
		// Skip one message; this should not be re-raised on host
		handle->skip_yet_send++;
		sc_real converted = atof(msg->value);
		controllerIface_raise_temperatureChanged(handle, converted);
		return 0;
	}
	if(strcmp(member, "on") == 0) {
		// Skip one message; this should not be re-raised on host
		handle->skip_yet_send++;
		controllerIface_raise_on(handle);
		return 0;
	}
	if(strcmp(member, "off") == 0) {
		// Skip one message; this should not be re-raised on host
		handle->skip_yet_send++;
		controllerIface_raise_off(handle);
		return 0;
	}
	return -2;
}
