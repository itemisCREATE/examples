
#ifndef BLINKYSTATEMACHINE_H_
#define BLINKYSTATEMACHINE_H_

#include "..\src\sc_types.h"
		
#ifdef __cplusplus
extern "C" { 
#endif 

/*! \file Header of the state machine 'blinkyStateMachine'.
*/

/*! Enumeration of all states */ 
typedef enum
{
	BlinkyStateMachine_main_region_Initialization,
	BlinkyStateMachine_main_region_red_LED_on,
	BlinkyStateMachine_main_region_red_LED_off,
	BlinkyStateMachine_last_state
} BlinkyStateMachineStates;

/*! Type definition of the data structure for the BlinkyStateMachineTimeEvents interface scope. */
typedef struct
{
	sc_boolean blinkyStateMachine_main_region_red_LED_on_tev0_raised;
	sc_boolean blinkyStateMachine_main_region_red_LED_off_tev0_raised;
} BlinkyStateMachineTimeEvents;


/*! Define dimension of the state configuration vector for orthogonal states. */
#define BLINKYSTATEMACHINE_MAX_ORTHOGONAL_STATES 1

/*! 
 * Type definition of the data structure for the BlinkyStateMachine state machine.
 * This data structure has to be allocated by the client code. 
 */
typedef struct
{
	BlinkyStateMachineStates stateConfVector[BLINKYSTATEMACHINE_MAX_ORTHOGONAL_STATES];
	sc_ushort stateConfVectorPosition; 
	
	BlinkyStateMachineTimeEvents timeEvents;
} BlinkyStateMachine;

/*! Initializes the BlinkyStateMachine state machine data structures. Must be called before first usage.*/
extern void blinkyStateMachine_init(BlinkyStateMachine* handle);

/*! Activates the state machine */
extern void blinkyStateMachine_enter(BlinkyStateMachine* handle);

/*! Deactivates the state machine */
extern void blinkyStateMachine_exit(BlinkyStateMachine* handle);

/*! Performs a 'run to completion' step. */
extern void blinkyStateMachine_runCycle(BlinkyStateMachine* handle);

/*! Raises a time event. */
extern void blinkyStateMachine_raiseTimeEvent(const BlinkyStateMachine* handle, sc_eventid evid);


/*!
 * Checks whether the state machine is active (until 2.4.1 this method was used for states).
 * A state machine is active if it was entered. It is inactive if it has not been entered at all or if it has been exited.
 */
extern sc_boolean blinkyStateMachine_isActive(const BlinkyStateMachine* handle);

/*!
 * Checks if all active states are final. 
 * If there are no active states then the state machine is considered being inactive. In this case this method returns false.
 */
extern sc_boolean blinkyStateMachine_isFinal(const BlinkyStateMachine* handle);

/*! Checks if the specified state is active (until 2.4.1 the used method for states was called isActive()). */
extern sc_boolean blinkyStateMachine_isStateActive(const BlinkyStateMachine* handle, BlinkyStateMachineStates state);

#ifdef __cplusplus
}
#endif 

#endif /* BLINKYSTATEMACHINE_H_ */
