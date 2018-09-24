
#ifndef PROCESSMILK_H_
#define PROCESSMILK_H_

#include "sc/sc_types.h"
#include "coffee_machine.h"

#ifdef __cplusplus
extern "C" { 
#endif 

/*! \file Header of the state machine 'ProcessMilk'.
*/

/*! Define dimension of the state configuration vector for orthogonal states. */
#define PROCESSMILK_MAX_ORTHOGONAL_STATES 1

/*! Define maximum number of time events that can be active at once */
#define PROCESSMILK_MAX_PARALLEL_TIME_EVENTS 1

/*! Define indices of states in the StateConfVector */
#define SCVI_PROCESSMILK_MAIN_REGION_MAKE_MILK 0
#define SCVI_PROCESSMILK_MAIN_REGION_MAKE_MILK_R_MAKE_STEAM 0
#define SCVI_PROCESSMILK_MAIN_REGION__FINAL_ 0

/*! Enumeration of all states */ 
typedef enum
{
	ProcessMilk_last_state,
	ProcessMilk_main_region_Make_Milk,
	ProcessMilk_main_region_Make_Milk_r_Make_Steam,
	ProcessMilk_main_region__final_
} ProcessMilkStates;



/*! Type definition of the data structure for the ProcessMilkIface interface scope. */
typedef struct
{
	cm_recipe_t recipe;
} ProcessMilkIface;





/*! Type definition of the data structure for the ProcessMilkTimeEvents interface scope. */
typedef struct
{
	sc_boolean processMilk_main_region_Make_Milk_r_Make_Steam_tev0_raised;
} ProcessMilkTimeEvents;




/*! 
 * Type definition of the data structure for the ProcessMilk state machine.
 * This data structure has to be allocated by the client code. 
 */
typedef struct
{
	ProcessMilkStates stateConfVector[PROCESSMILK_MAX_ORTHOGONAL_STATES];
	sc_ushort stateConfVectorPosition; 
	
	ProcessMilkIface iface;
	ProcessMilkTimeEvents timeEvents;
} ProcessMilk;



/*! Initializes the ProcessMilk state machine data structures. Must be called before first usage.*/
extern void processMilk_init(ProcessMilk* handle);

/*! Activates the state machine */
extern void processMilk_enter(ProcessMilk* handle);

/*! Deactivates the state machine */
extern void processMilk_exit(ProcessMilk* handle);

/*! Performs a 'run to completion' step. */
extern void processMilk_runCycle(ProcessMilk* handle);

/*! Raises a time event. */
extern void processMilk_raiseTimeEvent(ProcessMilk* handle, sc_eventid evid);

/*! Gets the value of the variable 'recipe' that is defined in the default interface scope. */ 
extern cm_recipe_t processMilkIface_get_recipe(const ProcessMilk* handle);
/*! Sets the value of the variable 'recipe' that is defined in the default interface scope. */ 
extern void processMilkIface_set_recipe(ProcessMilk* handle, cm_recipe_t value);

/*!
 * Checks whether the state machine is active (until 2.4.1 this method was used for states).
 * A state machine is active if it was entered. It is inactive if it has not been entered at all or if it has been exited.
 */
extern sc_boolean processMilk_isActive(const ProcessMilk* handle);

/*!
 * Checks if all active states are final. 
 * If there are no active states then the state machine is considered being inactive. In this case this method returns false.
 */
extern sc_boolean processMilk_isFinal(const ProcessMilk* handle);

/*! Checks if the specified state is active (until 2.4.1 the used method for states was called isActive()). */
extern sc_boolean processMilk_isStateActive(const ProcessMilk* handle, ProcessMilkStates state);


#ifdef __cplusplus
}
#endif 

#endif /* PROCESSMILK_H_ */
