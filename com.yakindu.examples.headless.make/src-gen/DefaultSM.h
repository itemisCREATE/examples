
#ifndef DEFAULTSM_H_
#define DEFAULTSM_H_

#include "../src/sc_types.h"
		
#ifdef __cplusplus
extern "C" { 
#endif 

/*! \file Header of the state machine 'defaultSM'.
*/

/*! Enumeration of all states */ 
typedef enum
{
	DefaultSM_main_region_StateA,
	DefaultSM_main_region__final_,
	DefaultSM_last_state
} DefaultSMStates;

/*! Type definition of the data structure for the DefaultSMIface interface scope. */
typedef struct
{
	sc_integer a;
} DefaultSMIface;


/*! Define dimension of the state configuration vector for orthogonal states. */
#define DEFAULTSM_MAX_ORTHOGONAL_STATES 1

/*! 
 * Type definition of the data structure for the DefaultSM state machine.
 * This data structure has to be allocated by the client code. 
 */
typedef struct
{
	DefaultSMStates stateConfVector[DEFAULTSM_MAX_ORTHOGONAL_STATES];
	sc_ushort stateConfVectorPosition; 
	
	DefaultSMIface iface;
} DefaultSM;

/*! Initializes the DefaultSM state machine data structures. Must be called before first usage.*/
extern void defaultSM_init(DefaultSM* handle);

/*! Activates the state machine */
extern void defaultSM_enter(DefaultSM* handle);

/*! Deactivates the state machine */
extern void defaultSM_exit(DefaultSM* handle);

/*! Performs a 'run to completion' step. */
extern void defaultSM_runCycle(DefaultSM* handle);


/*! Gets the value of the variable 'a' that is defined in the default interface scope. */ 
extern sc_integer defaultSMIface_get_a(const DefaultSM* handle);
/*! Sets the value of the variable 'a' that is defined in the default interface scope. */ 
extern void defaultSMIface_set_a(DefaultSM* handle, sc_integer value);

/*!
 * Checks whether the state machine is active (until 2.4.1 this method was used for states).
 * A state machine is active if it was entered. It is inactive if it has not been entered at all or if it has been exited.
 */
extern sc_boolean defaultSM_isActive(const DefaultSM* handle);

/*!
 * Checks if all active states are final. 
 * If there are no active states then the state machine is considered being inactive. In this case this method returns false.
 */
extern sc_boolean defaultSM_isFinal(const DefaultSM* handle);

/*! Checks if the specified state is active (until 2.4.1 the used method for states was called isActive()). */
extern sc_boolean defaultSM_isStateActive(const DefaultSM* handle, DefaultSMStates state);

#ifdef __cplusplus
}
#endif 

#endif /* DEFAULTSM_H_ */
