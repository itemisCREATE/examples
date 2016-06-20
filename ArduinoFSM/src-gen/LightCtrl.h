
#ifndef LIGHTCTRL_H_
#define LIGHTCTRL_H_

#include "sc_types.h"
		
#ifdef __cplusplus
extern "C" { 
#endif 

/*! \file Header of the state machine 'LightCtrl'.
*/

/*! Enumeration of all states */ 
typedef enum
{
	LightCtrl_main_region_Light_Off,
	LightCtrl_main_region_Light_On,
	LightCtrl_last_state
} LightCtrlStates;

/*! Type definition of the data structure for the LightCtrlIface interface scope. */
typedef struct
{
	sc_boolean button_raised;
} LightCtrlIface;

/*! Type definition of the data structure for the LightCtrlTimeEvents interface scope. */
typedef struct
{
	sc_boolean lightCtrl_main_region_Light_On_tev0_raised;
} LightCtrlTimeEvents;


/*! Define dimension of the state configuration vector for orthogonal states. */
#define LIGHTCTRL_MAX_ORTHOGONAL_STATES 1

/*! 
 * Type definition of the data structure for the LightCtrl state machine.
 * This data structure has to be allocated by the client code. 
 */
typedef struct
{
	LightCtrlStates stateConfVector[LIGHTCTRL_MAX_ORTHOGONAL_STATES];
	sc_ushort stateConfVectorPosition; 
	
	LightCtrlIface iface;
	LightCtrlTimeEvents timeEvents;
} LightCtrl;

/*! Initializes the LightCtrl state machine data structures. Must be called before first usage.*/
extern void lightCtrl_init(LightCtrl* handle);

/*! Activates the state machine */
extern void lightCtrl_enter(LightCtrl* handle);

/*! Deactivates the state machine */
extern void lightCtrl_exit(LightCtrl* handle);

/*! Performs a 'run to completion' step. */
extern void lightCtrl_runCycle(LightCtrl* handle);

/*! Raises a time event. */
extern void lightCtrl_raiseTimeEvent(const LightCtrl* handle, sc_eventid evid);

/*! Raises the in event 'button' that is defined in the default interface scope. */ 
extern void lightCtrlIface_raise_button(LightCtrl* handle);


/*!
 * Checks whether the state machine is active (until 2.4.1 this method was used for states).
 * A state machine is active if it was entered. It is inactive if it has not been entered at all or if it has been exited.
 */
extern sc_boolean lightCtrl_isActive(const LightCtrl* handle);

/*!
 * Checks if all active states are final. 
 * If there are no active states then the state machine is considered being inactive. In this case this method returns false.
 */
extern sc_boolean lightCtrl_isFinal(const LightCtrl* handle);

/*! Checks if the specified state is active (until 2.4.1 the used method for states was called isActive()). */
extern sc_boolean lightCtrl_isStateActive(const LightCtrl* handle, LightCtrlStates state);

#ifdef __cplusplus
}
#endif 

#endif /* LIGHTCTRL_H_ */
