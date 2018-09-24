
#ifndef PROCESSLATTEMACCHIATO_H_
#define PROCESSLATTEMACCHIATO_H_

#include "sc/sc_types.h"
#include "coffee_machine.h"

#ifdef __cplusplus
extern "C" { 
#endif 

/*! \file Header of the state machine 'ProcessLatteMacchiato'.
*/

/*! Define dimension of the state configuration vector for orthogonal states. */
#define PROCESSLATTEMACCHIATO_MAX_ORTHOGONAL_STATES 1

/*! Define maximum number of time events that can be active at once */
#define PROCESSLATTEMACCHIATO_MAX_PARALLEL_TIME_EVENTS 1

/*! Define indices of states in the StateConfVector */
#define SCVI_PROCESSLATTEMACCHIATO_MAIN_REGION_MAKE_COFFEE 0
#define SCVI_PROCESSLATTEMACCHIATO_MAIN_REGION_MAKE_COFFEE_R_MILLING_BEANS 0
#define SCVI_PROCESSLATTEMACCHIATO_MAIN_REGION_MAKE_COFFEE_R_BREW_COFFEE 0
#define SCVI_PROCESSLATTEMACCHIATO_MAIN_REGION_MAKE_MILK 0
#define SCVI_PROCESSLATTEMACCHIATO_MAIN_REGION_MAKE_MILK_R_MAKE_STEAM 0
#define SCVI_PROCESSLATTEMACCHIATO_MAIN_REGION__FINAL_ 0

/*! Enumeration of all states */ 
typedef enum
{
	ProcessLatteMacchiato_last_state,
	ProcessLatteMacchiato_main_region_Make_Coffee,
	ProcessLatteMacchiato_main_region_Make_Coffee_r_Milling_Beans,
	ProcessLatteMacchiato_main_region_Make_Coffee_r_Brew_Coffee,
	ProcessLatteMacchiato_main_region_Make_Milk,
	ProcessLatteMacchiato_main_region_Make_Milk_r_Make_Steam,
	ProcessLatteMacchiato_main_region__final_
} ProcessLatteMacchiatoStates;



/*! Type definition of the data structure for the ProcessLatteMacchiatoIface interface scope. */
typedef struct
{
	cm_recipe_t recipe;
} ProcessLatteMacchiatoIface;





/*! Type definition of the data structure for the ProcessLatteMacchiatoTimeEvents interface scope. */
typedef struct
{
	sc_boolean processLatteMacchiato_main_region_Make_Coffee_r_Milling_Beans_tev0_raised;
	sc_boolean processLatteMacchiato_main_region_Make_Coffee_r_Brew_Coffee_tev0_raised;
	sc_boolean processLatteMacchiato_main_region_Make_Milk_r_Make_Steam_tev0_raised;
} ProcessLatteMacchiatoTimeEvents;




/*! 
 * Type definition of the data structure for the ProcessLatteMacchiato state machine.
 * This data structure has to be allocated by the client code. 
 */
typedef struct
{
	ProcessLatteMacchiatoStates stateConfVector[PROCESSLATTEMACCHIATO_MAX_ORTHOGONAL_STATES];
	sc_ushort stateConfVectorPosition; 
	
	ProcessLatteMacchiatoIface iface;
	ProcessLatteMacchiatoTimeEvents timeEvents;
} ProcessLatteMacchiato;



/*! Initializes the ProcessLatteMacchiato state machine data structures. Must be called before first usage.*/
extern void processLatteMacchiato_init(ProcessLatteMacchiato* handle);

/*! Activates the state machine */
extern void processLatteMacchiato_enter(ProcessLatteMacchiato* handle);

/*! Deactivates the state machine */
extern void processLatteMacchiato_exit(ProcessLatteMacchiato* handle);

/*! Performs a 'run to completion' step. */
extern void processLatteMacchiato_runCycle(ProcessLatteMacchiato* handle);

/*! Raises a time event. */
extern void processLatteMacchiato_raiseTimeEvent(ProcessLatteMacchiato* handle, sc_eventid evid);

/*! Gets the value of the variable 'recipe' that is defined in the default interface scope. */ 
extern cm_recipe_t processLatteMacchiatoIface_get_recipe(const ProcessLatteMacchiato* handle);
/*! Sets the value of the variable 'recipe' that is defined in the default interface scope. */ 
extern void processLatteMacchiatoIface_set_recipe(ProcessLatteMacchiato* handle, cm_recipe_t value);

/*!
 * Checks whether the state machine is active (until 2.4.1 this method was used for states).
 * A state machine is active if it was entered. It is inactive if it has not been entered at all or if it has been exited.
 */
extern sc_boolean processLatteMacchiato_isActive(const ProcessLatteMacchiato* handle);

/*!
 * Checks if all active states are final. 
 * If there are no active states then the state machine is considered being inactive. In this case this method returns false.
 */
extern sc_boolean processLatteMacchiato_isFinal(const ProcessLatteMacchiato* handle);

/*! Checks if the specified state is active (until 2.4.1 the used method for states was called isActive()). */
extern sc_boolean processLatteMacchiato_isStateActive(const ProcessLatteMacchiato* handle, ProcessLatteMacchiatoStates state);


#ifdef __cplusplus
}
#endif 

#endif /* PROCESSLATTEMACCHIATO_H_ */
