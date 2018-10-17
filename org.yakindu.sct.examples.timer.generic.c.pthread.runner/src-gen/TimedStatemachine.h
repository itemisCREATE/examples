
#ifndef TIMEDSTATEMACHINE_H_
#define TIMEDSTATEMACHINE_H_

#include "../src/sc_types.h"

#ifdef __cplusplus
extern "C" { 
#endif 

/*! \file Header of the state machine 'TimedStatemachine'.
*/

/*! Define dimension of the state configuration vector for orthogonal states. */
#define TIMEDSTATEMACHINE_MAX_ORTHOGONAL_STATES 1

/*! Define maximum number of time events that can be active at once */
#define TIMEDSTATEMACHINE_MAX_PARALLEL_TIME_EVENTS 1

/*! Define indices of states in the StateConfVector */
#define SCVI_TIMEDSTATEMACHINE_MAIN_REGION_STATEA 0
#define SCVI_TIMEDSTATEMACHINE_MAIN_REGION_STATEB 0

/*! Enumeration of all states */ 
typedef enum
{
	TimedStatemachine_last_state,
	TimedStatemachine_main_region_StateA,
	TimedStatemachine_main_region_StateB
} TimedStatemachineStates;

/*! Type definition of the data structure for the TimedStatemachineTimeEvents interface scope. */
typedef struct
{
	sc_boolean timedStatemachine_main_region_StateA_tev0_raised;
	sc_boolean timedStatemachine_main_region_StateB_tev0_raised;
} TimedStatemachineTimeEvents;




/*! 
 * Type definition of the data structure for the TimedStatemachine state machine.
 * This data structure has to be allocated by the client code. 
 */
typedef struct
{
	TimedStatemachineStates stateConfVector[TIMEDSTATEMACHINE_MAX_ORTHOGONAL_STATES];
	sc_ushort stateConfVectorPosition; 
	
	TimedStatemachineTimeEvents timeEvents;
} TimedStatemachine;



/*! Initializes the TimedStatemachine state machine data structures. Must be called before first usage.*/
extern void timedStatemachine_init(TimedStatemachine* handle);

/*! Activates the state machine */
extern void timedStatemachine_enter(TimedStatemachine* handle);

/*! Deactivates the state machine */
extern void timedStatemachine_exit(TimedStatemachine* handle);

/*! Performs a 'run to completion' step. */
extern void timedStatemachine_runCycle(TimedStatemachine* handle);

/*! Raises a time event. */
extern void timedStatemachine_raiseTimeEvent(TimedStatemachine* handle, sc_eventid evid);


/*!
 * Checks whether the state machine is active (until 2.4.1 this method was used for states).
 * A state machine is active if it was entered. It is inactive if it has not been entered at all or if it has been exited.
 */
extern sc_boolean timedStatemachine_isActive(const TimedStatemachine* handle);

/*!
 * Checks if all active states are final. 
 * If there are no active states then the state machine is considered being inactive. In this case this method returns false.
 */
extern sc_boolean timedStatemachine_isFinal(const TimedStatemachine* handle);

/*! Checks if the specified state is active (until 2.4.1 the used method for states was called isActive()). */
extern sc_boolean timedStatemachine_isStateActive(const TimedStatemachine* handle, TimedStatemachineStates state);


#ifdef __cplusplus
}
#endif 

#endif /* TIMEDSTATEMACHINE_H_ */
