
#ifndef PROCESSCAPPUCINO_H_
#define PROCESSCAPPUCINO_H_

#include "sc/sc_types.h"
#include "coffee_machine.h"

#ifdef __cplusplus
extern "C" { 
#endif 

/*! \file Header of the state machine 'ProcessCappucino'.
*/

/*! Define dimension of the state configuration vector for orthogonal states. */
#define PROCESSCAPPUCINO_MAX_ORTHOGONAL_STATES 1

/*! Define maximum number of time events that can be active at once */
#define PROCESSCAPPUCINO_MAX_PARALLEL_TIME_EVENTS 1

/*! Define indices of states in the StateConfVector */
#define SCVI_PROCESSCAPPUCINO_MAIN_REGION_MAKE_COFFEE 0
#define SCVI_PROCESSCAPPUCINO_MAIN_REGION_MAKE_COFFEE_R_MILLING_BEANS 0
#define SCVI_PROCESSCAPPUCINO_MAIN_REGION_MAKE_COFFEE_R_BREW_COFFEE 0
#define SCVI_PROCESSCAPPUCINO_MAIN_REGION_MAKE_MILK 0
#define SCVI_PROCESSCAPPUCINO_MAIN_REGION_MAKE_MILK_R_MAKE_STEAM 0
#define SCVI_PROCESSCAPPUCINO_MAIN_REGION__FINAL_ 0

/*! Enumeration of all states */ 
typedef enum
{
	ProcessCappucino_last_state,
	ProcessCappucino_main_region_Make_Coffee,
	ProcessCappucino_main_region_Make_Coffee_r_Milling_Beans,
	ProcessCappucino_main_region_Make_Coffee_r_Brew_Coffee,
	ProcessCappucino_main_region_Make_Milk,
	ProcessCappucino_main_region_Make_Milk_r_Make_Steam,
	ProcessCappucino_main_region__final_
} ProcessCappucinoStates;



/*! Type definition of the data structure for the ProcessCappucinoIface interface scope. */
typedef struct
{
	cm_recipe_t recipe;
} ProcessCappucinoIface;





/*! Type definition of the data structure for the ProcessCappucinoTimeEvents interface scope. */
typedef struct
{
	sc_boolean processCappucino_main_region_Make_Coffee_r_Milling_Beans_tev0_raised;
	sc_boolean processCappucino_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised;
	sc_boolean processCappucino_main_region_Make_Milk_r_Make_Steam_tev0_raised;
} ProcessCappucinoTimeEvents;




/*! 
 * Type definition of the data structure for the ProcessCappucino state machine.
 * This data structure has to be allocated by the client code. 
 */
typedef struct
{
	ProcessCappucinoStates stateConfVector[PROCESSCAPPUCINO_MAX_ORTHOGONAL_STATES];
	sc_ushort stateConfVectorPosition; 
	
	ProcessCappucinoIface iface;
	ProcessCappucinoTimeEvents timeEvents;
} ProcessCappucino;



/*! Initializes the ProcessCappucino state machine data structures. Must be called before first usage.*/
extern void processCappucino_init(ProcessCappucino* handle);

/*! Activates the state machine */
extern void processCappucino_enter(ProcessCappucino* handle);

/*! Deactivates the state machine */
extern void processCappucino_exit(ProcessCappucino* handle);

/*! Performs a 'run to completion' step. */
extern void processCappucino_runCycle(ProcessCappucino* handle);

/*! Raises a time event. */
extern void processCappucino_raiseTimeEvent(ProcessCappucino* handle, sc_eventid evid);

/*! Gets the value of the variable 'recipe' that is defined in the default interface scope. */ 
extern cm_recipe_t processCappucinoIface_get_recipe(const ProcessCappucino* handle);
/*! Sets the value of the variable 'recipe' that is defined in the default interface scope. */ 
extern void processCappucinoIface_set_recipe(ProcessCappucino* handle, cm_recipe_t value);

/*!
 * Checks whether the state machine is active (until 2.4.1 this method was used for states).
 * A state machine is active if it was entered. It is inactive if it has not been entered at all or if it has been exited.
 */
extern sc_boolean processCappucino_isActive(const ProcessCappucino* handle);

/*!
 * Checks if all active states are final. 
 * If there are no active states then the state machine is considered being inactive. In this case this method returns false.
 */
extern sc_boolean processCappucino_isFinal(const ProcessCappucino* handle);

/*! Checks if the specified state is active (until 2.4.1 the used method for states was called isActive()). */
extern sc_boolean processCappucino_isStateActive(const ProcessCappucino* handle, ProcessCappucinoStates state);


#ifdef __cplusplus
}
#endif 

#endif /* PROCESSCAPPUCINO_H_ */
