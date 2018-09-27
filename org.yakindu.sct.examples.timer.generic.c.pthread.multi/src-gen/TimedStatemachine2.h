
#ifndef TIMEDSTATEMACHINE2_H_
#define TIMEDSTATEMACHINE2_H_

#include "../src/sc_types.h"

#ifdef __cplusplus
extern "C" { 
#endif 

/*! \file Header of the state machine 'TimedStatemachine2'.
*/

/*! Define dimension of the state configuration vector for orthogonal states. */
#define TIMEDSTATEMACHINE2_MAX_ORTHOGONAL_STATES 1

/*! Define maximum number of time events that can be active at once */
#define TIMEDSTATEMACHINE2_MAX_PARALLEL_TIME_EVENTS 1

/*! Define indices of states in the StateConfVector */
#define SCVI_TIMEDSTATEMACHINE2_MAIN_REGION_STATEA 0
#define SCVI_TIMEDSTATEMACHINE2_MAIN_REGION_STATEB 0

/*! Enumeration of all states */ 
typedef enum
{
	TimedStatemachine2_last_state,
	TimedStatemachine2_main_region_StateA,
	TimedStatemachine2_main_region_StateB
} TimedStatemachine2States;

/*! Type definition of the data structure for the TimedStatemachine2TimeEvents interface scope. */
typedef struct
{
	sc_boolean timedStatemachine2_main_region_StateA_tev0_raised;
	sc_boolean timedStatemachine2_main_region_StateB_tev0_raised;
} TimedStatemachine2TimeEvents;




/*! 
 * Type definition of the data structure for the TimedStatemachine2 state machine.
 * This data structure has to be allocated by the client code. 
 */
typedef struct
{
	TimedStatemachine2States stateConfVector[TIMEDSTATEMACHINE2_MAX_ORTHOGONAL_STATES];
	sc_ushort stateConfVectorPosition; 
	
	TimedStatemachine2TimeEvents timeEvents;
} TimedStatemachine2;



/*! Initializes the TimedStatemachine2 state machine data structures. Must be called before first usage.*/
extern void timedStatemachine2_init(TimedStatemachine2* handle);

/*! Activates the state machine */
extern void timedStatemachine2_enter(TimedStatemachine2* handle);

/*! Deactivates the state machine */
extern void timedStatemachine2_exit(TimedStatemachine2* handle);

/*! Performs a 'run to completion' step. */
extern void timedStatemachine2_runCycle(TimedStatemachine2* handle);

/*! Raises a time event. */
extern void timedStatemachine2_raiseTimeEvent(TimedStatemachine2* handle, sc_eventid evid);


/*!
 * Checks whether the state machine is active (until 2.4.1 this method was used for states).
 * A state machine is active if it was entered. It is inactive if it has not been entered at all or if it has been exited.
 */
extern sc_boolean timedStatemachine2_isActive(const TimedStatemachine2* handle);

/*!
 * Checks if all active states are final. 
 * If there are no active states then the state machine is considered being inactive. In this case this method returns false.
 */
extern sc_boolean timedStatemachine2_isFinal(const TimedStatemachine2* handle);

/*! Checks if the specified state is active (until 2.4.1 the used method for states was called isActive()). */
extern sc_boolean timedStatemachine2_isStateActive(const TimedStatemachine2* handle, TimedStatemachine2States state);


#ifdef __cplusplus
}
#endif 

#endif /* TIMEDSTATEMACHINE2_H_ */
