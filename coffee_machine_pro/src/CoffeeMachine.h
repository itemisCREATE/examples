
#ifndef COFFEEMACHINE_H_
#define COFFEEMACHINE_H_

#include "sc/sc_types.h"
#include "cm_hmi.h"
#include "coffee_machine.h"
		
#ifdef __cplusplus
extern "C" { 
#endif 

/*! \file Header of the state machine 'CoffeeMachine'.
*/

/*! Enumeration of all states */ 
typedef enum
{
	CoffeeMachine_main_Off,
	CoffeeMachine_main_On,
	CoffeeMachine_main_On_r_Welcome,
	CoffeeMachine_main_On_r_Heating_Up,
	CoffeeMachine_main_On_r_Wait_For_Choice,
	CoffeeMachine_main_On_r_Save_Energy,
	CoffeeMachine_main_On_r_Process_Recipe,
	CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk,
	CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam,
	CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee,
	CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans,
	CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee,
	CoffeeMachine_last_state
} CoffeeMachineStates;

/*! Type definition of the data structure for the CoffeeMachineIface interface scope. */
typedef struct
{
	sc_boolean userEvent_raised;
	UserEvents userEvent_value;
} CoffeeMachineIface;

/*! Type definition of the data structure for the CoffeeMachineInternal interface scope. */
typedef struct
{
	cm_recipe_t recipe;
	UserEvents lastChoice;
	bool processing;
	UserEvents userInput;
} CoffeeMachineInternal;

/*! Type definition of the data structure for the CoffeeMachineTimeEvents interface scope. */
typedef struct
{
	sc_boolean coffeeMachine_main_On_r_Wait_For_Choice_tev0_raised;
	sc_boolean coffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tev0_raised;
	sc_boolean coffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tev0_raised;
	sc_boolean coffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tev0_raised;
	sc_boolean coffeeMachine_tev0_raised;
	sc_boolean coffeeMachine_tev1_raised;
} CoffeeMachineTimeEvents;


/*! Define dimension of the state configuration vector for orthogonal states. */
#define COFFEEMACHINE_MAX_ORTHOGONAL_STATES 1

/*! 
 * Type definition of the data structure for the CoffeeMachine state machine.
 * This data structure has to be allocated by the client code. 
 */
typedef struct
{
	CoffeeMachineStates stateConfVector[COFFEEMACHINE_MAX_ORTHOGONAL_STATES];
	sc_ushort stateConfVectorPosition; 
	
	CoffeeMachineIface iface;
	CoffeeMachineInternal internal;
	CoffeeMachineTimeEvents timeEvents;
} CoffeeMachine;

/*! Initializes the CoffeeMachine state machine data structures. Must be called before first usage.*/
extern void coffeeMachine_init(CoffeeMachine* handle);

/*! Activates the state machine */
extern void coffeeMachine_enter(CoffeeMachine* handle);

/*! Deactivates the state machine */
extern void coffeeMachine_exit(CoffeeMachine* handle);

/*! Performs a 'run to completion' step. */
extern void coffeeMachine_runCycle(CoffeeMachine* handle);

/*! Raises a time event. */
extern void coffeeMachine_raiseTimeEvent(const CoffeeMachine* handle, sc_eventid evid);

/*! Raises the in event 'userEvent' that is defined in the default interface scope. */ 
extern void coffeeMachineIface_raise_userEvent(CoffeeMachine* handle, UserEvents value);


/*!
 * Checks whether the state machine is active (until 2.4.1 this method was used for states).
 * A state machine is active if it was entered. It is inactive if it has not been entered at all or if it has been exited.
 */
extern sc_boolean coffeeMachine_isActive(const CoffeeMachine* handle);

/*!
 * Checks if all active states are final. 
 * If there are no active states then the state machine is considered being inactive. In this case this method returns false.
 */
extern sc_boolean coffeeMachine_isFinal(const CoffeeMachine* handle);

/*! Checks if the specified state is active (until 2.4.1 the used method for states was called isActive()). */
extern sc_boolean coffeeMachine_isStateActive(const CoffeeMachine* handle, CoffeeMachineStates state);

#ifdef __cplusplus
}
#endif 

#endif /* COFFEEMACHINE_H_ */
