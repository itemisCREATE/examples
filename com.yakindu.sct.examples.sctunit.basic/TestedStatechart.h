
#ifndef TESTEDSTATECHART_H_
#define TESTEDSTATECHART_H_

#include "src/sc_types.h"
		
#ifdef __cplusplus
extern "C" { 
#endif 

/*! \file Header of the state machine 'testedStatechart'.
*/

/*! Enumeration of all states */ 
typedef enum
{
	TestedStatechart_last_state,
	TestedStatechart_main_region_Idle,
	TestedStatechart_main_region_Process,
	TestedStatechart_main_region_Done
} TestedStatechartStates;

/*! Type definition of the data structure for the TestedStatechartIface interface scope. */
typedef struct
{
	sc_boolean start_raised;
	sc_boolean QA_bad_raised;
	sc_boolean QA_good_raised;
	sc_real quality;
	sc_integer good;
	sc_integer bad;
} TestedStatechartIface;

/*! Type definition of the data structure for the TestedStatechartTimeEvents interface scope. */
typedef struct
{
	sc_boolean testedStatechart_main_region_Process_tev0_raised;
} TestedStatechartTimeEvents;


/*! Define dimension of the state configuration vector for orthogonal states. */
#define TESTEDSTATECHART_MAX_ORTHOGONAL_STATES 1

/*! Define indices of states in the StateConfVector */
#define SCVI_TESTEDSTATECHART_MAIN_REGION_IDLE 0
#define SCVI_TESTEDSTATECHART_MAIN_REGION_PROCESS 0
#define SCVI_TESTEDSTATECHART_MAIN_REGION_DONE 0

/*! 
 * Type definition of the data structure for the TestedStatechart state machine.
 * This data structure has to be allocated by the client code. 
 */
typedef struct
{
	TestedStatechartStates stateConfVector[TESTEDSTATECHART_MAX_ORTHOGONAL_STATES];
	sc_ushort stateConfVectorPosition; 
	
	TestedStatechartIface iface;
	TestedStatechartTimeEvents timeEvents;
} TestedStatechart;

/*! Initializes the TestedStatechart state machine data structures. Must be called before first usage.*/
extern void testedStatechart_init(TestedStatechart* handle);

/*! Activates the state machine */
extern void testedStatechart_enter(TestedStatechart* handle);

/*! Deactivates the state machine */
extern void testedStatechart_exit(TestedStatechart* handle);

/*! Performs a 'run to completion' step. */
extern void testedStatechart_runCycle(TestedStatechart* handle);

/*! Raises a time event. */
extern void testedStatechart_raiseTimeEvent(const TestedStatechart* handle, sc_eventid evid);

/*! Raises the in event 'start' that is defined in the default interface scope. */ 
extern void testedStatechartIface_raise_start(TestedStatechart* handle);

/*! Checks if the out event 'QA_bad' that is defined in the default interface scope has been raised. */ 
extern sc_boolean testedStatechartIface_israised_qA_bad(const TestedStatechart* handle);

/*! Checks if the out event 'QA_good' that is defined in the default interface scope has been raised. */ 
extern sc_boolean testedStatechartIface_israised_qA_good(const TestedStatechart* handle);

/*! Gets the value of the variable 'quality' that is defined in the default interface scope. */ 
extern sc_real testedStatechartIface_get_quality(const TestedStatechart* handle);
/*! Sets the value of the variable 'quality' that is defined in the default interface scope. */ 
extern void testedStatechartIface_set_quality(TestedStatechart* handle, sc_real value);
/*! Gets the value of the variable 'good' that is defined in the default interface scope. */ 
extern sc_integer testedStatechartIface_get_good(const TestedStatechart* handle);
/*! Sets the value of the variable 'good' that is defined in the default interface scope. */ 
extern void testedStatechartIface_set_good(TestedStatechart* handle, sc_integer value);
/*! Gets the value of the variable 'bad' that is defined in the default interface scope. */ 
extern sc_integer testedStatechartIface_get_bad(const TestedStatechart* handle);
/*! Sets the value of the variable 'bad' that is defined in the default interface scope. */ 
extern void testedStatechartIface_set_bad(TestedStatechart* handle, sc_integer value);

/*!
 * Checks whether the state machine is active (until 2.4.1 this method was used for states).
 * A state machine is active if it was entered. It is inactive if it has not been entered at all or if it has been exited.
 */
extern sc_boolean testedStatechart_isActive(const TestedStatechart* handle);

/*!
 * Checks if all active states are final. 
 * If there are no active states then the state machine is considered being inactive. In this case this method returns false.
 */
extern sc_boolean testedStatechart_isFinal(const TestedStatechart* handle);

/*! Checks if the specified state is active (until 2.4.1 the used method for states was called isActive()). */
extern sc_boolean testedStatechart_isStateActive(const TestedStatechart* handle, TestedStatechartStates state);

#ifdef __cplusplus
}
#endif 

#endif /* TESTEDSTATECHART_H_ */
