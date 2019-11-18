



#ifndef CONTROLLER_H_
#define CONTROLLER_H_


#include "../src/sc_types.h"

#include "../src/sc_yet.h"


#ifdef __cplusplus
extern "C" { 
#endif 

/*! \file Header of the state machine 'Controller'.
*/

#ifndef CONTROLLER_EVENTQUEUE_BUFFERSIZE
#define CONTROLLER_EVENTQUEUE_BUFFERSIZE 20
#endif
#ifndef SC_INVALID_EVENT_VALUE
#define SC_INVALID_EVENT_VALUE 0
#endif

/*! Define number of states in the state enum */

#define CONTROLLER_STATE_COUNT 4

/*! Define dimension of the state configuration vector for orthogonal states. */
#define CONTROLLER_MAX_ORTHOGONAL_STATES 1


/*! Define indices of states in the StateConfVector */
#define SCVI_CONTROLLER_MAIN_REGION_IDLE 0
#define SCVI_CONTROLLER_MAIN_REGION_HEATING 0
#define SCVI_CONTROLLER_MAIN_REGION_HEATING_R1_OFF 0
#define SCVI_CONTROLLER_MAIN_REGION_HEATING_R1_ON 0





/*! Enumeration of all states */ 
typedef enum
{
	Controller_last_state,
	Controller_main_region_Idle,
	Controller_main_region_Heating,
	Controller_main_region_Heating_r1_Off,
	Controller_main_region_Heating_r1_On
} ControllerStates;

/*! Type definition of the data structure for the ControllerIface interface scope. */
typedef struct
{
	sc_real targetTemp;
	sc_boolean temperatureChanged_raised;
	sc_real temperatureChanged_value;
	sc_boolean heaterOn_raised;
	sc_boolean heaterOff_raised;
	sc_boolean on_raised;
	sc_boolean off_raised;
} ControllerIface;



/*! Type definition of the data structure for the ControllerInternal interface scope. */
typedef struct
{
	sc_real temperature;
} ControllerInternal;




/*! 
 * Type definition of the data structure for the Controller state machine.
 * This data structure has to be allocated by the client code. 
 */
typedef struct
{
	yet_scope scope;
	sc_boolean is_running;
	sc_integer skip_yet_send;
	ControllerStates stateConfVector[CONTROLLER_MAX_ORTHOGONAL_STATES];
	sc_ushort stateConfVectorPosition; 
	
	ControllerIface iface;
	ControllerInternal internal;
} Controller;






/*! Initializes the Controller state machine data structures. Must be called before first usage.*/
extern void controller_init(Controller* handle);

/*! Activates the state machine */
extern void controller_enter(Controller* handle);

/*! Deactivates the state machine */
extern void controller_exit(Controller* handle);

/*! Performs a 'run to completion' step. */
extern void controller_runCycle(Controller* handle);


/*! Gets the value of the variable 'targetTemp' that is defined in the default interface scope. */ 
extern sc_real controllerIface_get_targetTemp(const Controller* handle);
/*! Sets the value of the variable 'targetTemp' that is defined in the default interface scope. */ 
extern void controllerIface_set_targetTemp(Controller* handle, sc_real value);
/*! Raises the in event 'temperatureChanged' that is defined in the default interface scope. */ 
extern void controllerIface_raise_temperatureChanged(Controller* handle, sc_real value);

/*! Checks if the out event 'heaterOn' that is defined in the default interface scope has been raised. */ 
extern sc_boolean controllerIface_israised_heaterOn(const Controller* handle);

/*! Checks if the out event 'heaterOff' that is defined in the default interface scope has been raised. */ 
extern sc_boolean controllerIface_israised_heaterOff(const Controller* handle);

/*! Raises the in event 'on' that is defined in the default interface scope. */ 
extern void controllerIface_raise_on(Controller* handle);

/*! Raises the in event 'off' that is defined in the default interface scope. */ 
extern void controllerIface_raise_off(Controller* handle);


/*!
 * Checks whether the state machine is active (until 2.4.1 this method was used for states).
 * A state machine is active if it was entered. It is inactive if it has not been entered at all or if it has been exited.
 */
extern sc_boolean controller_isActive(const Controller* handle);

/*!
 * Checks if all active states are final. 
 * If there are no active states then the state machine is considered being inactive. In this case this method returns false.
 */
extern sc_boolean controller_isFinal(const Controller* handle);

/*! Checks if the specified state is active (until 2.4.1 the used method for states was called isActive()). */
extern sc_boolean controller_isStateActive(const Controller* handle, ControllerStates state);

extern void controller_accept_message(Controller* handle, char* text);

uint8_t controller_yet_dispatch_message(yet_scope *scope, yet_message * msg, char *fqn);


#ifdef __cplusplus
}
#endif 

#endif /* CONTROLLER_H_ */
