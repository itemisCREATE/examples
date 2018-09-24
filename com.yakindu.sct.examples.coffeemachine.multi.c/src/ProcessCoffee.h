
#ifndef PROCESSCOFFEE_H_
#define PROCESSCOFFEE_H_

#include "sc/sc_types.h"
#include "coffee_machine.h"

#ifdef __cplusplus
extern "C" { 
#endif 

/*! \file Header of the state machine 'ProcessCoffee'.
*/

/*! Define dimension of the state configuration vector for orthogonal states. */
#define PROCESSCOFFEE_MAX_ORTHOGONAL_STATES 1

/*! Define maximum number of time events that can be active at once */
#define PROCESSCOFFEE_MAX_PARALLEL_TIME_EVENTS 1

/*! Define indices of states in the StateConfVector */
#define SCVI_PROCESSCOFFEE_MAIN_REGION_MAKE_COFFEE 0
#define SCVI_PROCESSCOFFEE_MAIN_REGION_MAKE_COFFEE_R_MILLING_BEANS 0
#define SCVI_PROCESSCOFFEE_MAIN_REGION_MAKE_COFFEE_R_BREW_COFFEE 0
#define SCVI_PROCESSCOFFEE_MAIN_REGION__FINAL_ 0

/*! Enumeration of all states */ 
typedef enum
{
	ProcessCoffee_last_state,
	ProcessCoffee_main_region_Make_Coffee,
	ProcessCoffee_main_region_Make_Coffee_r_Milling_Beans,
	ProcessCoffee_main_region_Make_Coffee_r_Brew_Coffee,
	ProcessCoffee_main_region__final_
} ProcessCoffeeStates;



/*! Type definition of the data structure for the ProcessCoffeeIface interface scope. */
typedef struct
{
	cm_recipe_t recipe;
} ProcessCoffeeIface;





/*! Type definition of the data structure for the ProcessCoffeeTimeEvents interface scope. */
typedef struct
{
	sc_boolean processCoffee_main_region_Make_Coffee_r_Milling_Beans_tev0_raised;
	sc_boolean processCoffee_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised;
} ProcessCoffeeTimeEvents;




/*! 
 * Type definition of the data structure for the ProcessCoffee state machine.
 * This data structure has to be allocated by the client code. 
 */
typedef struct
{
	ProcessCoffeeStates stateConfVector[PROCESSCOFFEE_MAX_ORTHOGONAL_STATES];
	sc_ushort stateConfVectorPosition; 
	
	ProcessCoffeeIface iface;
	ProcessCoffeeTimeEvents timeEvents;
} ProcessCoffee;



/*! Initializes the ProcessCoffee state machine data structures. Must be called before first usage.*/
extern void processCoffee_init(ProcessCoffee* handle);

/*! Activates the state machine */
extern void processCoffee_enter(ProcessCoffee* handle);

/*! Deactivates the state machine */
extern void processCoffee_exit(ProcessCoffee* handle);

/*! Performs a 'run to completion' step. */
extern void processCoffee_runCycle(ProcessCoffee* handle);

/*! Raises a time event. */
extern void processCoffee_raiseTimeEvent(ProcessCoffee* handle, sc_eventid evid);

/*! Gets the value of the variable 'recipe' that is defined in the default interface scope. */ 
extern cm_recipe_t processCoffeeIface_get_recipe(const ProcessCoffee* handle);
/*! Sets the value of the variable 'recipe' that is defined in the default interface scope. */ 
extern void processCoffeeIface_set_recipe(ProcessCoffee* handle, cm_recipe_t value);

/*!
 * Checks whether the state machine is active (until 2.4.1 this method was used for states).
 * A state machine is active if it was entered. It is inactive if it has not been entered at all or if it has been exited.
 */
extern sc_boolean processCoffee_isActive(const ProcessCoffee* handle);

/*!
 * Checks if all active states are final. 
 * If there are no active states then the state machine is considered being inactive. In this case this method returns false.
 */
extern sc_boolean processCoffee_isFinal(const ProcessCoffee* handle);

/*! Checks if the specified state is active (until 2.4.1 the used method for states was called isActive()). */
extern sc_boolean processCoffee_isStateActive(const ProcessCoffee* handle, ProcessCoffeeStates state);


#ifdef __cplusplus
}
#endif 

#endif /* PROCESSCOFFEE_H_ */
