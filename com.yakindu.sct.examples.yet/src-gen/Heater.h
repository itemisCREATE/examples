


#ifndef HEATER_H_
#define HEATER_H_

#include "../src/sc_types.h"

#include "../src/sc_yet.h"


#ifdef __cplusplus
extern "C" { 
#endif 

/*! \file Header of the state machine 'Heater'.
*/

/*! Define number of states in the state enum */

#define HEATER_STATE_COUNT 2

/*! Define dimension of the state configuration vector for orthogonal states. */
#define HEATER_MAX_ORTHOGONAL_STATES 1


/*! Define indices of states in the StateConfVector */
#define SCVI_HEATER_MAIN_REGION_OFF 0
#define SCVI_HEATER_MAIN_REGION_ON 0



/*! Enumeration of all states */ 
typedef enum
{
	Heater_last_state,
	Heater_main_region_Off,
	Heater_main_region_On
} HeaterStates;

/*! Type definition of the data structure for the HeaterIface interface scope. */
typedef struct
{
	sc_real T;
	sc_boolean off_raised;
	sc_boolean on_raised;
} HeaterIface;




/*! 
 * Type definition of the data structure for the Heater state machine.
 * This data structure has to be allocated by the client code. 
 */
typedef struct
{
	yet_scope scope;
	sc_boolean is_running;
	sc_integer skip_yet_send;
	HeaterStates stateConfVector[HEATER_MAX_ORTHOGONAL_STATES];
	sc_ushort stateConfVectorPosition; 
	
	HeaterIface iface;
} Heater;





/*! Initializes the Heater state machine data structures. Must be called before first usage.*/
extern void heater_init(Heater* handle);

/*! Activates the state machine */
extern void heater_enter(Heater* handle);

/*! Deactivates the state machine */
extern void heater_exit(Heater* handle);

/*! Performs a 'run to completion' step. */
extern void heater_runCycle(Heater* handle);


/*! Gets the value of the variable 'T' that is defined in the default interface scope. */ 
extern sc_real heaterIface_get_t(const Heater* handle);
/*! Sets the value of the variable 'T' that is defined in the default interface scope. */ 
extern void heaterIface_set_t(Heater* handle, sc_real value);
/*! Raises the in event 'off' that is defined in the default interface scope. */ 
extern void heaterIface_raise_off(Heater* handle);

/*! Raises the in event 'on' that is defined in the default interface scope. */ 
extern void heaterIface_raise_on(Heater* handle);


/*!
 * Checks whether the state machine is active (until 2.4.1 this method was used for states).
 * A state machine is active if it was entered. It is inactive if it has not been entered at all or if it has been exited.
 */
extern sc_boolean heater_isActive(const Heater* handle);

/*!
 * Checks if all active states are final. 
 * If there are no active states then the state machine is considered being inactive. In this case this method returns false.
 */
extern sc_boolean heater_isFinal(const Heater* handle);

/*! Checks if the specified state is active (until 2.4.1 the used method for states was called isActive()). */
extern sc_boolean heater_isStateActive(const Heater* handle, HeaterStates state);

extern void heater_accept_message(Heater* handle, char* text);

uint8_t heater_yet_dispatch_message(yet_scope *scope, yet_message * msg, char *fqn);


#ifdef __cplusplus
}
#endif 

#endif /* HEATER_H_ */
