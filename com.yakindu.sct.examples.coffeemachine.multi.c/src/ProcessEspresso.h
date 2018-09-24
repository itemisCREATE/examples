
#ifndef PROCESSESPRESSO_H_
#define PROCESSESPRESSO_H_

#include "sc/sc_types.h"
#include "coffee_machine.h"

#ifdef __cplusplus
extern "C" { 
#endif 

/*! \file Header of the state machine 'ProcessEspresso'.
*/

/*! Define dimension of the state configuration vector for orthogonal states. */
#define PROCESSESPRESSO_MAX_ORTHOGONAL_STATES 1

/*! Define maximum number of time events that can be active at once */
#define PROCESSESPRESSO_MAX_PARALLEL_TIME_EVENTS 1

/*! Define indices of states in the StateConfVector */
#define SCVI_PROCESSESPRESSO_MAIN_REGION_MAKE_COFFEE 0
#define SCVI_PROCESSESPRESSO_MAIN_REGION_MAKE_COFFEE_R_MILLING_BEANS 0
#define SCVI_PROCESSESPRESSO_MAIN_REGION_MAKE_COFFEE_R_BREW_COFFEE 0
#define SCVI_PROCESSESPRESSO_MAIN_REGION__FINAL_ 0

/*! Enumeration of all states */ 
typedef enum
{
	ProcessEspresso_last_state,
	ProcessEspresso_main_region_Make_Coffee,
	ProcessEspresso_main_region_Make_Coffee_r_Milling_Beans,
	ProcessEspresso_main_region_Make_Coffee_r_Brew_Coffee,
	ProcessEspresso_main_region__final_
} ProcessEspressoStates;



/*! Type definition of the data structure for the ProcessEspressoIface interface scope. */
typedef struct
{
	cm_recipe_t recipe;
} ProcessEspressoIface;





/*! Type definition of the data structure for the ProcessEspressoTimeEvents interface scope. */
typedef struct
{
	sc_boolean processEspresso_main_region_Make_Coffee_r_Milling_Beans_tev0_raised;
	sc_boolean processEspresso_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised;
} ProcessEspressoTimeEvents;




/*! 
 * Type definition of the data structure for the ProcessEspresso state machine.
 * This data structure has to be allocated by the client code. 
 */
typedef struct
{
	ProcessEspressoStates stateConfVector[PROCESSESPRESSO_MAX_ORTHOGONAL_STATES];
	sc_ushort stateConfVectorPosition; 
	
	ProcessEspressoIface iface;
	ProcessEspressoTimeEvents timeEvents;
} ProcessEspresso;



/*! Initializes the ProcessEspresso state machine data structures. Must be called before first usage.*/
extern void processEspresso_init(ProcessEspresso* handle);

/*! Activates the state machine */
extern void processEspresso_enter(ProcessEspresso* handle);

/*! Deactivates the state machine */
extern void processEspresso_exit(ProcessEspresso* handle);

/*! Performs a 'run to completion' step. */
extern void processEspresso_runCycle(ProcessEspresso* handle);

/*! Raises a time event. */
extern void processEspresso_raiseTimeEvent(ProcessEspresso* handle, sc_eventid evid);

/*! Gets the value of the variable 'recipe' that is defined in the default interface scope. */ 
extern cm_recipe_t processEspressoIface_get_recipe(const ProcessEspresso* handle);
/*! Sets the value of the variable 'recipe' that is defined in the default interface scope. */ 
extern void processEspressoIface_set_recipe(ProcessEspresso* handle, cm_recipe_t value);

/*!
 * Checks whether the state machine is active (until 2.4.1 this method was used for states).
 * A state machine is active if it was entered. It is inactive if it has not been entered at all or if it has been exited.
 */
extern sc_boolean processEspresso_isActive(const ProcessEspresso* handle);

/*!
 * Checks if all active states are final. 
 * If there are no active states then the state machine is considered being inactive. In this case this method returns false.
 */
extern sc_boolean processEspresso_isFinal(const ProcessEspresso* handle);

/*! Checks if the specified state is active (until 2.4.1 the used method for states was called isActive()). */
extern sc_boolean processEspresso_isStateActive(const ProcessEspresso* handle, ProcessEspressoStates state);


#ifdef __cplusplus
}
#endif 

#endif /* PROCESSESPRESSO_H_ */
