
#include <stdlib.h>
#include <string.h>
#include "sc/sc_types.h"
#include "CoffeeMachine.h"
#include "CoffeeMachineRequired.h"
/*! \file Implementation of the state machine 'CoffeeMachine'
*/

/* prototypes of all internal functions */
static sc_boolean coffeeMachine_check__lr0(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check__lr1(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check__lr2(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check__lr3(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check_main_Off_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check_main_On_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check_main_On_r_Welcome_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check_main_On_r_Heating_Up_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check_main_On_r_Wait_For_Choice_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check_main_On_r_Wait_For_Choice_tr1_tr1(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check_main_On_r_Save_Energy_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check_main_On_r_Process_Recipe_r__choice_0_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check_main_On_r_Process_Recipe_r__choice_0_tr1_tr1(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check_main_On_r_Process_Recipe_r__choice_1_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check_main_On_r_Process_Recipe_r__choice_1_tr1_tr1(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check_main_On_r_Process_Recipe_r__choice_2_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean coffeeMachine_check_main_On_r_Process_Recipe_r__choice_2_tr1_tr1(const CoffeeMachine* handle);
static void coffeeMachine_effect__lr0(CoffeeMachine* handle);
static void coffeeMachine_effect__lr1(CoffeeMachine* handle);
static void coffeeMachine_effect__lr2(CoffeeMachine* handle);
static void coffeeMachine_effect__lr3(CoffeeMachine* handle);
static void coffeeMachine_effect_main_Off_tr0(CoffeeMachine* handle);
static void coffeeMachine_effect_main_On_tr0(CoffeeMachine* handle);
static void coffeeMachine_effect_main_On_r_Welcome_tr0(CoffeeMachine* handle);
static void coffeeMachine_effect_main_On_r_Heating_Up_tr0(CoffeeMachine* handle);
static void coffeeMachine_effect_main_On_r_Wait_For_Choice_tr0(CoffeeMachine* handle);
static void coffeeMachine_effect_main_On_r_Wait_For_Choice_tr1(CoffeeMachine* handle);
static void coffeeMachine_effect_main_On_r_Save_Energy_tr0(CoffeeMachine* handle);
static void coffeeMachine_effect_main_On_r_Process_Recipe_tr0(CoffeeMachine* handle);
static void coffeeMachine_effect_main_On_r_Process_Recipe_r_Make_Milk_tr0(CoffeeMachine* handle);
static void coffeeMachine_effect_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tr0(CoffeeMachine* handle);
static void coffeeMachine_effect_main_On_r_Process_Recipe_r_Make_Coffee_tr0(CoffeeMachine* handle);
static void coffeeMachine_effect_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tr0(CoffeeMachine* handle);
static void coffeeMachine_effect_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tr0(CoffeeMachine* handle);
static void coffeeMachine_effect_main_On_r_Process_Recipe_r__choice_0_tr0(CoffeeMachine* handle);
static void coffeeMachine_effect_main_On_r_Process_Recipe_r__choice_0_tr1(CoffeeMachine* handle);
static void coffeeMachine_effect_main_On_r_Process_Recipe_r__choice_1_tr0(CoffeeMachine* handle);
static void coffeeMachine_effect_main_On_r_Process_Recipe_r__choice_1_tr1(CoffeeMachine* handle);
static void coffeeMachine_effect_main_On_r_Process_Recipe_r__choice_2_tr0(CoffeeMachine* handle);
static void coffeeMachine_effect_main_On_r_Process_Recipe_r__choice_2_tr1(CoffeeMachine* handle);
static void coffeeMachine_enact(CoffeeMachine* handle);
static void coffeeMachine_enact_main_Off(CoffeeMachine* handle);
static void coffeeMachine_enact_main_On_r_Welcome(CoffeeMachine* handle);
static void coffeeMachine_enact_main_On_r_Heating_Up(CoffeeMachine* handle);
static void coffeeMachine_enact_main_On_r_Wait_For_Choice(CoffeeMachine* handle);
static void coffeeMachine_enact_main_On_r_Save_Energy(CoffeeMachine* handle);
static void coffeeMachine_enact_main_On_r_Process_Recipe(CoffeeMachine* handle);
static void coffeeMachine_enact_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(CoffeeMachine* handle);
static void coffeeMachine_enact_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(CoffeeMachine* handle);
static void coffeeMachine_enact_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(CoffeeMachine* handle);
static void coffeeMachine_exact(CoffeeMachine* handle);
static void coffeeMachine_exact_main_On_r_Heating_Up(CoffeeMachine* handle);
static void coffeeMachine_exact_main_On_r_Wait_For_Choice(CoffeeMachine* handle);
static void coffeeMachine_exact_main_On_r_Process_Recipe(CoffeeMachine* handle);
static void coffeeMachine_exact_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(CoffeeMachine* handle);
static void coffeeMachine_exact_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(CoffeeMachine* handle);
static void coffeeMachine_exact_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(CoffeeMachine* handle);
static void coffeeMachine_enseq_main_Off_default(CoffeeMachine* handle);
static void coffeeMachine_enseq_main_On_default(CoffeeMachine* handle);
static void coffeeMachine_enseq_main_On_r_Welcome_default(CoffeeMachine* handle);
static void coffeeMachine_enseq_main_On_r_Heating_Up_default(CoffeeMachine* handle);
static void coffeeMachine_enseq_main_On_r_Wait_For_Choice_default(CoffeeMachine* handle);
static void coffeeMachine_enseq_main_On_r_Save_Energy_default(CoffeeMachine* handle);
static void coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Milk_default(CoffeeMachine* handle);
static void coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_default(CoffeeMachine* handle);
static void coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Coffee_default(CoffeeMachine* handle);
static void coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_default(CoffeeMachine* handle);
static void coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_default(CoffeeMachine* handle);
static void coffeeMachine_enseq_main_default(CoffeeMachine* handle);
static void coffeeMachine_enseq_main_On_r_default(CoffeeMachine* handle);
static void coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Milk_r_default(CoffeeMachine* handle);
static void coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_default(CoffeeMachine* handle);
static void coffeeMachine_exseq_main_Off(CoffeeMachine* handle);
static void coffeeMachine_exseq_main_On(CoffeeMachine* handle);
static void coffeeMachine_exseq_main_On_r_Welcome(CoffeeMachine* handle);
static void coffeeMachine_exseq_main_On_r_Heating_Up(CoffeeMachine* handle);
static void coffeeMachine_exseq_main_On_r_Wait_For_Choice(CoffeeMachine* handle);
static void coffeeMachine_exseq_main_On_r_Save_Energy(CoffeeMachine* handle);
static void coffeeMachine_exseq_main_On_r_Process_Recipe(CoffeeMachine* handle);
static void coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Milk(CoffeeMachine* handle);
static void coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(CoffeeMachine* handle);
static void coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee(CoffeeMachine* handle);
static void coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(CoffeeMachine* handle);
static void coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(CoffeeMachine* handle);
static void coffeeMachine_exseq_main(CoffeeMachine* handle);
static void coffeeMachine_exseq_main_On_r(CoffeeMachine* handle);
static void coffeeMachine_exseq_main_On_r_Process_Recipe_r(CoffeeMachine* handle);
static void coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Milk_r(CoffeeMachine* handle);
static void coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee_r(CoffeeMachine* handle);
static void coffeeMachine_react_main_Off(CoffeeMachine* handle);
static void coffeeMachine_react_main_On_r_Welcome(CoffeeMachine* handle);
static void coffeeMachine_react_main_On_r_Heating_Up(CoffeeMachine* handle);
static void coffeeMachine_react_main_On_r_Wait_For_Choice(CoffeeMachine* handle);
static void coffeeMachine_react_main_On_r_Save_Energy(CoffeeMachine* handle);
static void coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(CoffeeMachine* handle);
static void coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(CoffeeMachine* handle);
static void coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(CoffeeMachine* handle);
static void coffeeMachine_react_main_On_r_Process_Recipe_r__choice_0(CoffeeMachine* handle);
static void coffeeMachine_react_main_On_r_Process_Recipe_r__choice_1(CoffeeMachine* handle);
static void coffeeMachine_react_main_On_r_Process_Recipe_r__choice_2(CoffeeMachine* handle);
static void coffeeMachine_react_main__entry_Default(CoffeeMachine* handle);
static void coffeeMachine_react_main_On_r__entry_Default(CoffeeMachine* handle);
static void coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Milk_r__entry_Default(CoffeeMachine* handle);
static void coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Coffee_r__entry_Default(CoffeeMachine* handle);
static void coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Milk_r_done(CoffeeMachine* handle);
static void coffeeMachine_react_main_On_r_Process_Recipe_r_done(CoffeeMachine* handle);
static void coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Coffee_r_done(CoffeeMachine* handle);
static void coffeeMachine_clearInEvents(CoffeeMachine* handle);
static void coffeeMachine_clearOutEvents(CoffeeMachine* handle);


void coffeeMachine_init(CoffeeMachine* handle)
{
	sc_integer i;

	for (i = 0; i < COFFEEMACHINE_MAX_ORTHOGONAL_STATES; ++i)
	{
		handle->stateConfVector[i] = CoffeeMachine_last_state;
	}
	
	
	handle->stateConfVectorPosition = 0;

	coffeeMachine_clearInEvents(handle);
	coffeeMachine_clearOutEvents(handle);

	/* Default init sequence for statechart CoffeeMachine */
	handle->internal.lastChoice = NONE;
	handle->internal.processing = bool_false;

}

void coffeeMachine_enter(CoffeeMachine* handle)
{
	/* Default enter sequence for statechart CoffeeMachine */
	coffeeMachine_enact(handle);
	coffeeMachine_enseq_main_default(handle);
}

void coffeeMachine_exit(CoffeeMachine* handle)
{
	/* Default exit sequence for statechart CoffeeMachine */
	coffeeMachine_exseq_main(handle);
	coffeeMachine_exact(handle);
}

sc_boolean coffeeMachine_isActive(const CoffeeMachine* handle)
{
	sc_boolean result;
	if (handle->stateConfVector[0] != CoffeeMachine_last_state)
	{
		result =  bool_true;
	}
	else
	{
		result = bool_false;
	}
	return result;
}

/* 
 * Always returns 'false' since this state machine can never become final.
 */
sc_boolean coffeeMachine_isFinal(const CoffeeMachine* handle)
{
   return bool_false;
}

static void coffeeMachine_clearInEvents(CoffeeMachine* handle)
{
	handle->iface.userEvent_raised = bool_false;
	handle->timeEvents.coffeeMachine_main_On_r_Wait_For_Choice_tev0_raised = bool_false;
	handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tev0_raised = bool_false;
	handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tev0_raised = bool_false;
	handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tev0_raised = bool_false;
	handle->timeEvents.coffeeMachine_tev0_raised = bool_false;
	handle->timeEvents.coffeeMachine_tev1_raised = bool_false;
}

static void coffeeMachine_clearOutEvents(CoffeeMachine* handle)
{
}

void coffeeMachine_runCycle(CoffeeMachine* handle)
{
	
	coffeeMachine_clearOutEvents(handle);
	
	for (handle->stateConfVectorPosition = 0;
		handle->stateConfVectorPosition < COFFEEMACHINE_MAX_ORTHOGONAL_STATES;
		handle->stateConfVectorPosition++)
		{
			
		switch (handle->stateConfVector[handle->stateConfVectorPosition])
		{
		case CoffeeMachine_main_Off :
		{
			coffeeMachine_react_main_Off(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Welcome :
		{
			coffeeMachine_react_main_On_r_Welcome(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Heating_Up :
		{
			coffeeMachine_react_main_On_r_Heating_Up(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Wait_For_Choice :
		{
			coffeeMachine_react_main_On_r_Wait_For_Choice(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Save_Energy :
		{
			coffeeMachine_react_main_On_r_Save_Energy(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam :
		{
			coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans :
		{
			coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee :
		{
			coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(handle);
			break;
		}
		default:
			break;
		}
	}
	
	coffeeMachine_clearInEvents(handle);
}

void coffeeMachine_raiseTimeEvent(const CoffeeMachine* handle, sc_eventid evid)
{
	if ( ((sc_intptr_t)evid) >= ((sc_intptr_t)&(handle->timeEvents))
		&&  ((sc_intptr_t)evid) < ((sc_intptr_t)&(handle->timeEvents)) + sizeof(CoffeeMachineTimeEvents))
		{
		*(sc_boolean*)evid = bool_true;
	}		
}

sc_boolean coffeeMachine_isStateActive(const CoffeeMachine* handle, CoffeeMachineStates state)
{
	sc_boolean result = bool_false;
	switch (state)
	{
		case CoffeeMachine_main_Off :
			result = (sc_boolean) (handle->stateConfVector[0] == CoffeeMachine_main_Off
			);
			break;
		case CoffeeMachine_main_On :
			result = (sc_boolean) (handle->stateConfVector[0] >= CoffeeMachine_main_On
				&& handle->stateConfVector[0] <= CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee);
			break;
		case CoffeeMachine_main_On_r_Welcome :
			result = (sc_boolean) (handle->stateConfVector[0] == CoffeeMachine_main_On_r_Welcome
			);
			break;
		case CoffeeMachine_main_On_r_Heating_Up :
			result = (sc_boolean) (handle->stateConfVector[0] == CoffeeMachine_main_On_r_Heating_Up
			);
			break;
		case CoffeeMachine_main_On_r_Wait_For_Choice :
			result = (sc_boolean) (handle->stateConfVector[0] == CoffeeMachine_main_On_r_Wait_For_Choice
			);
			break;
		case CoffeeMachine_main_On_r_Save_Energy :
			result = (sc_boolean) (handle->stateConfVector[0] == CoffeeMachine_main_On_r_Save_Energy
			);
			break;
		case CoffeeMachine_main_On_r_Process_Recipe :
			result = (sc_boolean) (handle->stateConfVector[0] >= CoffeeMachine_main_On_r_Process_Recipe
				&& handle->stateConfVector[0] <= CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee);
			break;
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk :
			result = (sc_boolean) (handle->stateConfVector[0] >= CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk
				&& handle->stateConfVector[0] <= CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam);
			break;
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam :
			result = (sc_boolean) (handle->stateConfVector[0] == CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam
			);
			break;
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee :
			result = (sc_boolean) (handle->stateConfVector[0] >= CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee
				&& handle->stateConfVector[0] <= CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee);
			break;
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans :
			result = (sc_boolean) (handle->stateConfVector[0] == CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans
			);
			break;
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee :
			result = (sc_boolean) (handle->stateConfVector[0] == CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee
			);
			break;
		default:
			result = bool_false;
			break;
	}
	return result;
}

void coffeeMachineIface_raise_userEvent(CoffeeMachine* handle, UserEvents value)
{
	handle->iface.userEvent_value = value;
	handle->iface.userEvent_raised = bool_true;
}



/* implementations of all internal functions */

static sc_boolean coffeeMachine_check__lr0(const CoffeeMachine* handle)
{
	return bool_true;
}

static sc_boolean coffeeMachine_check__lr1(const CoffeeMachine* handle)
{
	return handle->iface.userEvent_raised;
}

static sc_boolean coffeeMachine_check__lr2(const CoffeeMachine* handle)
{
	return handle->timeEvents.coffeeMachine_tev0_raised;
}

static sc_boolean coffeeMachine_check__lr3(const CoffeeMachine* handle)
{
	return ((handle->timeEvents.coffeeMachine_tev1_raised) && (handle->internal.processing)) ? bool_true : bool_false;
}

static sc_boolean coffeeMachine_check_main_Off_tr0_tr0(const CoffeeMachine* handle)
{
	return (handle->internal.userInput == ON_OFF) ? bool_true : bool_false;
}

static sc_boolean coffeeMachine_check_main_On_tr0_tr0(const CoffeeMachine* handle)
{
	return (handle->internal.userInput == ON_OFF) ? bool_true : bool_false;
}

static sc_boolean coffeeMachine_check_main_On_r_Welcome_tr0_tr0(const CoffeeMachine* handle)
{
	return bool_true;
}

static sc_boolean coffeeMachine_check_main_On_r_Heating_Up_tr0_tr0(const CoffeeMachine* handle)
{
	return (heater.temp >= 95) ? bool_true : bool_false;
}

static sc_boolean coffeeMachine_check_main_On_r_Wait_For_Choice_tr0_tr0(const CoffeeMachine* handle)
{
	return handle->timeEvents.coffeeMachine_main_On_r_Wait_For_Choice_tev0_raised;
}

static sc_boolean coffeeMachine_check_main_On_r_Wait_For_Choice_tr1_tr1(const CoffeeMachine* handle)
{
	return (COFFEE <= handle->internal.userInput && handle->internal.userInput <= MILK) ? bool_true : bool_false;
}

static sc_boolean coffeeMachine_check_main_On_r_Save_Energy_tr0_tr0(const CoffeeMachine* handle)
{
	return (handle->internal.userInput != NONE) ? bool_true : bool_false;
}

static sc_boolean coffeeMachine_check_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tr0_tr0(const CoffeeMachine* handle)
{
	return handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tev0_raised;
}

static sc_boolean coffeeMachine_check_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tr0_tr0(const CoffeeMachine* handle)
{
	return handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tev0_raised;
}

static sc_boolean coffeeMachine_check_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tr0_tr0(const CoffeeMachine* handle)
{
	return handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tev0_raised;
}

static sc_boolean coffeeMachine_check_main_On_r_Process_Recipe_r__choice_0_tr0_tr0(const CoffeeMachine* handle)
{
	return (handle->internal.recipe.milk_volume > 0 && handle->internal.recipe.milk_first) ? bool_true : bool_false;
}

static sc_boolean coffeeMachine_check_main_On_r_Process_Recipe_r__choice_0_tr1_tr1(const CoffeeMachine* handle)
{
	return bool_true;
}

static sc_boolean coffeeMachine_check_main_On_r_Process_Recipe_r__choice_1_tr0_tr0(const CoffeeMachine* handle)
{
	return ((! handle->internal.recipe.milk_first) && handle->internal.recipe.milk_volume > 0) ? bool_true : bool_false;
}

static sc_boolean coffeeMachine_check_main_On_r_Process_Recipe_r__choice_1_tr1_tr1(const CoffeeMachine* handle)
{
	return bool_true;
}

static sc_boolean coffeeMachine_check_main_On_r_Process_Recipe_r__choice_2_tr0_tr0(const CoffeeMachine* handle)
{
	return (handle->internal.recipe.milk_first && handle->internal.recipe.coffee_mass > 0) ? bool_true : bool_false;
}

static sc_boolean coffeeMachine_check_main_On_r_Process_Recipe_r__choice_2_tr1_tr1(const CoffeeMachine* handle)
{
	return bool_true;
}

static void coffeeMachine_effect__lr0(CoffeeMachine* handle)
{
	handle->internal.userInput = NONE;
}

static void coffeeMachine_effect__lr1(CoffeeMachine* handle)
{
	handle->internal.userInput = handle->iface.userEvent_value;
}

static void coffeeMachine_effect__lr2(CoffeeMachine* handle)
{
	updateHeating(2);
}

static void coffeeMachine_effect__lr3(CoffeeMachine* handle)
{
	show(".");
}

static void coffeeMachine_effect_main_Off_tr0(CoffeeMachine* handle)
{
	coffeeMachine_exseq_main_Off(handle);
	coffeeMachine_enseq_main_On_default(handle);
}

static void coffeeMachine_effect_main_On_tr0(CoffeeMachine* handle)
{
	coffeeMachine_exseq_main_On(handle);
	coffeeMachine_enseq_main_Off_default(handle);
}

static void coffeeMachine_effect_main_On_r_Welcome_tr0(CoffeeMachine* handle)
{
	coffeeMachine_exseq_main_On_r_Welcome(handle);
	coffeeMachine_enseq_main_On_r_Heating_Up_default(handle);
}

static void coffeeMachine_effect_main_On_r_Heating_Up_tr0(CoffeeMachine* handle)
{
	coffeeMachine_exseq_main_On_r_Heating_Up(handle);
	coffeeMachine_enseq_main_On_r_Wait_For_Choice_default(handle);
}

static void coffeeMachine_effect_main_On_r_Wait_For_Choice_tr0(CoffeeMachine* handle)
{
	coffeeMachine_exseq_main_On_r_Wait_For_Choice(handle);
	coffeeMachine_enseq_main_On_r_Save_Energy_default(handle);
}

static void coffeeMachine_effect_main_On_r_Wait_For_Choice_tr1(CoffeeMachine* handle)
{
	coffeeMachine_exseq_main_On_r_Wait_For_Choice(handle);
	handle->internal.recipe = recipes[handle->internal.userInput];
	coffeeMachine_enact_main_On_r_Process_Recipe(handle);
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Process_Recipe);
	coffeeMachine_react_main_On_r_Process_Recipe_r__choice_0(handle);
}

static void coffeeMachine_effect_main_On_r_Save_Energy_tr0(CoffeeMachine* handle)
{
	coffeeMachine_exseq_main_On_r_Save_Energy(handle);
	coffeeMachine_enseq_main_On_r_Heating_Up_default(handle);
}

static void coffeeMachine_effect_main_On_r_Process_Recipe_tr0(CoffeeMachine* handle)
{
	coffeeMachine_exseq_main_On_r_Process_Recipe(handle);
	showDone(handle->internal.lastChoice);
	coffeeMachine_enseq_main_On_r_Wait_For_Choice_default(handle);
}

static void coffeeMachine_effect_main_On_r_Process_Recipe_r_Make_Milk_tr0(CoffeeMachine* handle)
{
	coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Milk(handle);
	coffeeMachine_react_main_On_r_Process_Recipe_r__choice_2(handle);
}

static void coffeeMachine_effect_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tr0(CoffeeMachine* handle)
{
	coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(handle);
	coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Milk_r_done(handle);
}

static void coffeeMachine_effect_main_On_r_Process_Recipe_r_Make_Coffee_tr0(CoffeeMachine* handle)
{
	coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee(handle);
	coffeeMachine_react_main_On_r_Process_Recipe_r__choice_1(handle);
}

static void coffeeMachine_effect_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tr0(CoffeeMachine* handle)
{
	coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(handle);
	coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_default(handle);
}

static void coffeeMachine_effect_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tr0(CoffeeMachine* handle)
{
	coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(handle);
	coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Coffee_r_done(handle);
}

static void coffeeMachine_effect_main_On_r_Process_Recipe_r__choice_0_tr0(CoffeeMachine* handle)
{
	coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Milk_default(handle);
}

static void coffeeMachine_effect_main_On_r_Process_Recipe_r__choice_0_tr1(CoffeeMachine* handle)
{
	coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Coffee_default(handle);
}

static void coffeeMachine_effect_main_On_r_Process_Recipe_r__choice_1_tr0(CoffeeMachine* handle)
{
	coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Milk_default(handle);
}

static void coffeeMachine_effect_main_On_r_Process_Recipe_r__choice_1_tr1(CoffeeMachine* handle)
{
	coffeeMachine_react_main_On_r_Process_Recipe_r_done(handle);
}

static void coffeeMachine_effect_main_On_r_Process_Recipe_r__choice_2_tr0(CoffeeMachine* handle)
{
	coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Coffee_default(handle);
}

static void coffeeMachine_effect_main_On_r_Process_Recipe_r__choice_2_tr1(CoffeeMachine* handle)
{
	coffeeMachine_react_main_On_r_Process_Recipe_r_done(handle);
}

/* Entry action for statechart 'CoffeeMachine'. */
static void coffeeMachine_enact(CoffeeMachine* handle)
{
	/* Entry action for statechart 'CoffeeMachine'. */
	coffeeMachine_setTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_tev0_raised) , 200, bool_true);
	coffeeMachine_setTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_tev1_raised) , 500, bool_true);
}

/* Entry action for state 'Off'. */
static void coffeeMachine_enact_main_Off(CoffeeMachine* handle)
{
	/* Entry action for state 'Off'. */
	stopHeating();
}

/* Entry action for state 'Welcome'. */
static void coffeeMachine_enact_main_On_r_Welcome(CoffeeMachine* handle)
{
	/* Entry action for state 'Welcome'. */
	show("** Welcome to YAKINDU Coffee Maker **\n");
}

/* Entry action for state 'Heating Up'. */
static void coffeeMachine_enact_main_On_r_Heating_Up(CoffeeMachine* handle)
{
	/* Entry action for state 'Heating Up'. */
	startHeating();
	show("* heating");
	handle->internal.processing = bool_true;
}

/* Entry action for state 'Wait For Choice'. */
static void coffeeMachine_enact_main_On_r_Wait_For_Choice(CoffeeMachine* handle)
{
	/* Entry action for state 'Wait For Choice'. */
	coffeeMachine_setTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_main_On_r_Wait_For_Choice_tev0_raised) , 30 * 1000, bool_false);
	show("\n* choose:\n");
	show("(1) coffee\n");
	show("(2) espresso\n");
	show("(3) cappucino\n");
	show("(4) latte macchiato\n");
	show("(5) milk\n");
}

/* Entry action for state 'Save Energy'. */
static void coffeeMachine_enact_main_On_r_Save_Energy(CoffeeMachine* handle)
{
	/* Entry action for state 'Save Energy'. */
	stopHeating();
	show("\n* save energy - continue with any command ...\n");
}

/* Entry action for state 'Process Recipe'. */
static void coffeeMachine_enact_main_On_r_Process_Recipe(CoffeeMachine* handle)
{
	/* Entry action for state 'Process Recipe'. */
	showPrepare(handle->internal.userInput);
	handle->internal.lastChoice = handle->internal.userInput;
	handle->internal.processing = bool_true;
}

/* Entry action for state 'Make Steam'. */
static void coffeeMachine_enact_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(CoffeeMachine* handle)
{
	/* Entry action for state 'Make Steam'. */
	coffeeMachine_setTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tev0_raised) , handle->internal.recipe.milk_volume * 60, bool_false);
}

/* Entry action for state 'Milling Beans'. */
static void coffeeMachine_enact_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(CoffeeMachine* handle)
{
	/* Entry action for state 'Milling Beans'. */
	coffeeMachine_setTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tev0_raised) , handle->internal.recipe.coffee_mass * 1000, bool_false);
	startMilling();
}

/* Entry action for state 'Brew Coffee'. */
static void coffeeMachine_enact_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(CoffeeMachine* handle)
{
	/* Entry action for state 'Brew Coffee'. */
	coffeeMachine_setTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tev0_raised) , handle->internal.recipe.water_volume * 60, bool_false);
	startPumping();
}

/* Exit action for state 'CoffeeMachine'. */
static void coffeeMachine_exact(CoffeeMachine* handle)
{
	/* Exit action for state 'CoffeeMachine'. */
	coffeeMachine_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_tev0_raised) );		
	coffeeMachine_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_tev1_raised) );		
}

/* Exit action for state 'Heating Up'. */
static void coffeeMachine_exact_main_On_r_Heating_Up(CoffeeMachine* handle)
{
	/* Exit action for state 'Heating Up'. */
	handle->internal.processing = bool_false;
}

/* Exit action for state 'Wait For Choice'. */
static void coffeeMachine_exact_main_On_r_Wait_For_Choice(CoffeeMachine* handle)
{
	/* Exit action for state 'Wait For Choice'. */
	coffeeMachine_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_main_On_r_Wait_For_Choice_tev0_raised) );		
}

/* Exit action for state 'Process Recipe'. */
static void coffeeMachine_exact_main_On_r_Process_Recipe(CoffeeMachine* handle)
{
	/* Exit action for state 'Process Recipe'. */
	handle->internal.processing = bool_false;
}

/* Exit action for state 'Make Steam'. */
static void coffeeMachine_exact_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(CoffeeMachine* handle)
{
	/* Exit action for state 'Make Steam'. */
	coffeeMachine_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tev0_raised) );		
}

/* Exit action for state 'Milling Beans'. */
static void coffeeMachine_exact_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(CoffeeMachine* handle)
{
	/* Exit action for state 'Milling Beans'. */
	coffeeMachine_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tev0_raised) );		
	stopMilling();
}

/* Exit action for state 'Brew Coffee'. */
static void coffeeMachine_exact_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(CoffeeMachine* handle)
{
	/* Exit action for state 'Brew Coffee'. */
	coffeeMachine_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tev0_raised) );		
	stopPumping();
}

/* 'default' enter sequence for state Off */
static void coffeeMachine_enseq_main_Off_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Off */
	coffeeMachine_enact_main_Off(handle);
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_Off);
	handle->stateConfVector[0] = CoffeeMachine_main_Off;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state On */
static void coffeeMachine_enseq_main_On_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state On */
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On);
	coffeeMachine_enseq_main_On_r_default(handle);
}

/* 'default' enter sequence for state Welcome */
static void coffeeMachine_enseq_main_On_r_Welcome_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Welcome */
	coffeeMachine_enact_main_On_r_Welcome(handle);
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Welcome);
	handle->stateConfVector[0] = CoffeeMachine_main_On_r_Welcome;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Heating Up */
static void coffeeMachine_enseq_main_On_r_Heating_Up_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Heating Up */
	coffeeMachine_enact_main_On_r_Heating_Up(handle);
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Heating_Up);
	handle->stateConfVector[0] = CoffeeMachine_main_On_r_Heating_Up;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Wait For Choice */
static void coffeeMachine_enseq_main_On_r_Wait_For_Choice_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Wait For Choice */
	coffeeMachine_enact_main_On_r_Wait_For_Choice(handle);
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Wait_For_Choice);
	handle->stateConfVector[0] = CoffeeMachine_main_On_r_Wait_For_Choice;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Save Energy */
static void coffeeMachine_enseq_main_On_r_Save_Energy_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Save Energy */
	coffeeMachine_enact_main_On_r_Save_Energy(handle);
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Save_Energy);
	handle->stateConfVector[0] = CoffeeMachine_main_On_r_Save_Energy;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Make Milk */
static void coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Milk_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Make Milk */
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk);
	coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Milk_r_default(handle);
}

/* 'default' enter sequence for state Make Steam */
static void coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Make Steam */
	coffeeMachine_enact_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(handle);
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam);
	handle->stateConfVector[0] = CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Make Coffee */
static void coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Coffee_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Make Coffee */
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee);
	coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_default(handle);
}

/* 'default' enter sequence for state Milling Beans */
static void coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Milling Beans */
	coffeeMachine_enact_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(handle);
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans);
	handle->stateConfVector[0] = CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Brew Coffee */
static void coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Brew Coffee */
	coffeeMachine_enact_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(handle);
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee);
	handle->stateConfVector[0] = CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for region main */
static void coffeeMachine_enseq_main_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for region main */
	coffeeMachine_react_main__entry_Default(handle);
}

/* 'default' enter sequence for region r */
static void coffeeMachine_enseq_main_On_r_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for region r */
	coffeeMachine_react_main_On_r__entry_Default(handle);
}

/* 'default' enter sequence for region r */
static void coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Milk_r_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for region r */
	coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Milk_r__entry_Default(handle);
}

/* 'default' enter sequence for region r */
static void coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for region r */
	coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Coffee_r__entry_Default(handle);
}

/* Default exit sequence for state Off */
static void coffeeMachine_exseq_main_Off(CoffeeMachine* handle)
{
	/* Default exit sequence for state Off */
	handle->stateConfVector[0] = CoffeeMachine_last_state;
	handle->stateConfVectorPosition = 0;
	coffeeMachine_stateExited(handle, CoffeeMachine_main_Off);
}

/* Default exit sequence for state On */
static void coffeeMachine_exseq_main_On(CoffeeMachine* handle)
{
	/* Default exit sequence for state On */
	coffeeMachine_exseq_main_On_r(handle);
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On);
}

/* Default exit sequence for state Welcome */
static void coffeeMachine_exseq_main_On_r_Welcome(CoffeeMachine* handle)
{
	/* Default exit sequence for state Welcome */
	handle->stateConfVector[0] = CoffeeMachine_last_state;
	handle->stateConfVectorPosition = 0;
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Welcome);
}

/* Default exit sequence for state Heating Up */
static void coffeeMachine_exseq_main_On_r_Heating_Up(CoffeeMachine* handle)
{
	/* Default exit sequence for state Heating Up */
	handle->stateConfVector[0] = CoffeeMachine_last_state;
	handle->stateConfVectorPosition = 0;
	coffeeMachine_exact_main_On_r_Heating_Up(handle);
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Heating_Up);
}

/* Default exit sequence for state Wait For Choice */
static void coffeeMachine_exseq_main_On_r_Wait_For_Choice(CoffeeMachine* handle)
{
	/* Default exit sequence for state Wait For Choice */
	handle->stateConfVector[0] = CoffeeMachine_last_state;
	handle->stateConfVectorPosition = 0;
	coffeeMachine_exact_main_On_r_Wait_For_Choice(handle);
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Wait_For_Choice);
}

/* Default exit sequence for state Save Energy */
static void coffeeMachine_exseq_main_On_r_Save_Energy(CoffeeMachine* handle)
{
	/* Default exit sequence for state Save Energy */
	handle->stateConfVector[0] = CoffeeMachine_last_state;
	handle->stateConfVectorPosition = 0;
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Save_Energy);
}

/* Default exit sequence for state Process Recipe */
static void coffeeMachine_exseq_main_On_r_Process_Recipe(CoffeeMachine* handle)
{
	/* Default exit sequence for state Process Recipe */
	coffeeMachine_exseq_main_On_r_Process_Recipe_r(handle);
	coffeeMachine_exact_main_On_r_Process_Recipe(handle);
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe);
}

/* Default exit sequence for state Make Milk */
static void coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Milk(CoffeeMachine* handle)
{
	/* Default exit sequence for state Make Milk */
	coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Milk_r(handle);
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk);
}

/* Default exit sequence for state Make Steam */
static void coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(CoffeeMachine* handle)
{
	/* Default exit sequence for state Make Steam */
	handle->stateConfVector[0] = CoffeeMachine_last_state;
	handle->stateConfVectorPosition = 0;
	coffeeMachine_exact_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(handle);
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam);
}

/* Default exit sequence for state Make Coffee */
static void coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee(CoffeeMachine* handle)
{
	/* Default exit sequence for state Make Coffee */
	coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee_r(handle);
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee);
}

/* Default exit sequence for state Milling Beans */
static void coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(CoffeeMachine* handle)
{
	/* Default exit sequence for state Milling Beans */
	handle->stateConfVector[0] = CoffeeMachine_last_state;
	handle->stateConfVectorPosition = 0;
	coffeeMachine_exact_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(handle);
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans);
}

/* Default exit sequence for state Brew Coffee */
static void coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(CoffeeMachine* handle)
{
	/* Default exit sequence for state Brew Coffee */
	handle->stateConfVector[0] = CoffeeMachine_last_state;
	handle->stateConfVectorPosition = 0;
	coffeeMachine_exact_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(handle);
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee);
}

/* Default exit sequence for region main */
static void coffeeMachine_exseq_main(CoffeeMachine* handle)
{
	/* Default exit sequence for region main */
	/* Handle exit of all possible states (of CoffeeMachine.main) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case CoffeeMachine_main_Off :
		{
			coffeeMachine_exseq_main_Off(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Welcome :
		{
			coffeeMachine_exseq_main_On_r_Welcome(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On);
			break;
		}
		case CoffeeMachine_main_On_r_Heating_Up :
		{
			coffeeMachine_exseq_main_On_r_Heating_Up(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On);
			break;
		}
		case CoffeeMachine_main_On_r_Wait_For_Choice :
		{
			coffeeMachine_exseq_main_On_r_Wait_For_Choice(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On);
			break;
		}
		case CoffeeMachine_main_On_r_Save_Energy :
		{
			coffeeMachine_exseq_main_On_r_Save_Energy(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam :
		{
			coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk);
			coffeeMachine_exact_main_On_r_Process_Recipe(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans :
		{
			coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee);
			coffeeMachine_exact_main_On_r_Process_Recipe(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee :
		{
			coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee);
			coffeeMachine_exact_main_On_r_Process_Recipe(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On);
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
static void coffeeMachine_exseq_main_On_r(CoffeeMachine* handle)
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of CoffeeMachine.main.On.r) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case CoffeeMachine_main_On_r_Welcome :
		{
			coffeeMachine_exseq_main_On_r_Welcome(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Heating_Up :
		{
			coffeeMachine_exseq_main_On_r_Heating_Up(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Wait_For_Choice :
		{
			coffeeMachine_exseq_main_On_r_Wait_For_Choice(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Save_Energy :
		{
			coffeeMachine_exseq_main_On_r_Save_Energy(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam :
		{
			coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk);
			coffeeMachine_exact_main_On_r_Process_Recipe(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans :
		{
			coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee);
			coffeeMachine_exact_main_On_r_Process_Recipe(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee :
		{
			coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee);
			coffeeMachine_exact_main_On_r_Process_Recipe(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe);
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
static void coffeeMachine_exseq_main_On_r_Process_Recipe_r(CoffeeMachine* handle)
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of CoffeeMachine.main.On.r.Process_Recipe.r) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam :
		{
			coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans :
		{
			coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee :
		{
			coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee);
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
static void coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Milk_r(CoffeeMachine* handle)
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of CoffeeMachine.main.On.r.Process_Recipe.r.Make_Milk.r) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam :
		{
			coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(handle);
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
static void coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee_r(CoffeeMachine* handle)
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of CoffeeMachine.main.On.r.Process_Recipe.r.Make_Coffee.r) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans :
		{
			coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee :
		{
			coffeeMachine_exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(handle);
			break;
		}
		default: break;
	}
}

/* The reactions of state Off. */
static void coffeeMachine_react_main_Off(CoffeeMachine* handle)
{
	/* The reactions of state Off. */
	coffeeMachine_effect__lr0(handle);
	if (coffeeMachine_check__lr1(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr1(handle);
	} 
	if (coffeeMachine_check__lr2(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr2(handle);
	} 
	if (coffeeMachine_check__lr3(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr3(handle);
	} 
	if (coffeeMachine_check_main_Off_tr0_tr0(handle) == bool_true)
	{ 
		coffeeMachine_effect_main_Off_tr0(handle);
	} 
}

/* The reactions of state Welcome. */
static void coffeeMachine_react_main_On_r_Welcome(CoffeeMachine* handle)
{
	/* The reactions of state Welcome. */
	coffeeMachine_effect__lr0(handle);
	if (coffeeMachine_check__lr1(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr1(handle);
	} 
	if (coffeeMachine_check__lr2(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr2(handle);
	} 
	if (coffeeMachine_check__lr3(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr3(handle);
	} 
	if (coffeeMachine_check_main_On_tr0_tr0(handle) == bool_true)
	{ 
		coffeeMachine_effect_main_On_tr0(handle);
	}  else
	{
		coffeeMachine_effect_main_On_r_Welcome_tr0(handle);
	}
}

/* The reactions of state Heating Up. */
static void coffeeMachine_react_main_On_r_Heating_Up(CoffeeMachine* handle)
{
	/* The reactions of state Heating Up. */
	coffeeMachine_effect__lr0(handle);
	if (coffeeMachine_check__lr1(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr1(handle);
	} 
	if (coffeeMachine_check__lr2(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr2(handle);
	} 
	if (coffeeMachine_check__lr3(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr3(handle);
	} 
	if (coffeeMachine_check_main_On_tr0_tr0(handle) == bool_true)
	{ 
		coffeeMachine_effect_main_On_tr0(handle);
	}  else
	{
		if (coffeeMachine_check_main_On_r_Heating_Up_tr0_tr0(handle) == bool_true)
		{ 
			coffeeMachine_effect_main_On_r_Heating_Up_tr0(handle);
		} 
	}
}

/* The reactions of state Wait For Choice. */
static void coffeeMachine_react_main_On_r_Wait_For_Choice(CoffeeMachine* handle)
{
	/* The reactions of state Wait For Choice. */
	coffeeMachine_effect__lr0(handle);
	if (coffeeMachine_check__lr1(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr1(handle);
	} 
	if (coffeeMachine_check__lr2(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr2(handle);
	} 
	if (coffeeMachine_check__lr3(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr3(handle);
	} 
	if (coffeeMachine_check_main_On_tr0_tr0(handle) == bool_true)
	{ 
		coffeeMachine_effect_main_On_tr0(handle);
	}  else
	{
		if (coffeeMachine_check_main_On_r_Wait_For_Choice_tr0_tr0(handle) == bool_true)
		{ 
			coffeeMachine_effect_main_On_r_Wait_For_Choice_tr0(handle);
		}  else
		{
			if (coffeeMachine_check_main_On_r_Wait_For_Choice_tr1_tr1(handle) == bool_true)
			{ 
				coffeeMachine_effect_main_On_r_Wait_For_Choice_tr1(handle);
			} 
		}
	}
}

/* The reactions of state Save Energy. */
static void coffeeMachine_react_main_On_r_Save_Energy(CoffeeMachine* handle)
{
	/* The reactions of state Save Energy. */
	coffeeMachine_effect__lr0(handle);
	if (coffeeMachine_check__lr1(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr1(handle);
	} 
	if (coffeeMachine_check__lr2(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr2(handle);
	} 
	if (coffeeMachine_check__lr3(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr3(handle);
	} 
	if (coffeeMachine_check_main_On_tr0_tr0(handle) == bool_true)
	{ 
		coffeeMachine_effect_main_On_tr0(handle);
	}  else
	{
		if (coffeeMachine_check_main_On_r_Save_Energy_tr0_tr0(handle) == bool_true)
		{ 
			coffeeMachine_effect_main_On_r_Save_Energy_tr0(handle);
		} 
	}
}

/* The reactions of state Make Steam. */
static void coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(CoffeeMachine* handle)
{
	/* The reactions of state Make Steam. */
	coffeeMachine_effect__lr0(handle);
	if (coffeeMachine_check__lr1(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr1(handle);
	} 
	if (coffeeMachine_check__lr2(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr2(handle);
	} 
	if (coffeeMachine_check__lr3(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr3(handle);
	} 
	if (coffeeMachine_check_main_On_tr0_tr0(handle) == bool_true)
	{ 
		coffeeMachine_effect_main_On_tr0(handle);
	}  else
	{
		if (coffeeMachine_check_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tr0_tr0(handle) == bool_true)
		{ 
			coffeeMachine_effect_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tr0(handle);
		} 
	}
}

/* The reactions of state Milling Beans. */
static void coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(CoffeeMachine* handle)
{
	/* The reactions of state Milling Beans. */
	coffeeMachine_effect__lr0(handle);
	if (coffeeMachine_check__lr1(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr1(handle);
	} 
	if (coffeeMachine_check__lr2(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr2(handle);
	} 
	if (coffeeMachine_check__lr3(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr3(handle);
	} 
	if (coffeeMachine_check_main_On_tr0_tr0(handle) == bool_true)
	{ 
		coffeeMachine_effect_main_On_tr0(handle);
	}  else
	{
		if (coffeeMachine_check_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tr0_tr0(handle) == bool_true)
		{ 
			coffeeMachine_effect_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tr0(handle);
		} 
	}
}

/* The reactions of state Brew Coffee. */
static void coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(CoffeeMachine* handle)
{
	/* The reactions of state Brew Coffee. */
	coffeeMachine_effect__lr0(handle);
	if (coffeeMachine_check__lr1(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr1(handle);
	} 
	if (coffeeMachine_check__lr2(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr2(handle);
	} 
	if (coffeeMachine_check__lr3(handle) == bool_true)
	{ 
		coffeeMachine_effect__lr3(handle);
	} 
	if (coffeeMachine_check_main_On_tr0_tr0(handle) == bool_true)
	{ 
		coffeeMachine_effect_main_On_tr0(handle);
	}  else
	{
		if (coffeeMachine_check_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tr0_tr0(handle) == bool_true)
		{ 
			coffeeMachine_effect_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tr0(handle);
		} 
	}
}

/* The reactions of state null. */
static void coffeeMachine_react_main_On_r_Process_Recipe_r__choice_0(CoffeeMachine* handle)
{
	/* The reactions of state null. */
	if (coffeeMachine_check_main_On_r_Process_Recipe_r__choice_0_tr0_tr0(handle) == bool_true)
	{ 
		coffeeMachine_effect_main_On_r_Process_Recipe_r__choice_0_tr0(handle);
	}  else
	{
		coffeeMachine_effect_main_On_r_Process_Recipe_r__choice_0_tr1(handle);
	}
}

/* The reactions of state null. */
static void coffeeMachine_react_main_On_r_Process_Recipe_r__choice_1(CoffeeMachine* handle)
{
	/* The reactions of state null. */
	if (coffeeMachine_check_main_On_r_Process_Recipe_r__choice_1_tr0_tr0(handle) == bool_true)
	{ 
		coffeeMachine_effect_main_On_r_Process_Recipe_r__choice_1_tr0(handle);
	}  else
	{
		coffeeMachine_effect_main_On_r_Process_Recipe_r__choice_1_tr1(handle);
	}
}

/* The reactions of state null. */
static void coffeeMachine_react_main_On_r_Process_Recipe_r__choice_2(CoffeeMachine* handle)
{
	/* The reactions of state null. */
	if (coffeeMachine_check_main_On_r_Process_Recipe_r__choice_2_tr0_tr0(handle) == bool_true)
	{ 
		coffeeMachine_effect_main_On_r_Process_Recipe_r__choice_2_tr0(handle);
	}  else
	{
		coffeeMachine_effect_main_On_r_Process_Recipe_r__choice_2_tr1(handle);
	}
}

/* Default react sequence for initial entry  */
static void coffeeMachine_react_main__entry_Default(CoffeeMachine* handle)
{
	/* Default react sequence for initial entry  */
	coffeeMachine_enseq_main_Off_default(handle);
}

/* Default react sequence for initial entry  */
static void coffeeMachine_react_main_On_r__entry_Default(CoffeeMachine* handle)
{
	/* Default react sequence for initial entry  */
	coffeeMachine_enseq_main_On_r_Welcome_default(handle);
}

/* Default react sequence for initial entry  */
static void coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Milk_r__entry_Default(CoffeeMachine* handle)
{
	/* Default react sequence for initial entry  */
	coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_default(handle);
}

/* Default react sequence for initial entry  */
static void coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Coffee_r__entry_Default(CoffeeMachine* handle)
{
	/* Default react sequence for initial entry  */
	coffeeMachine_enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_default(handle);
}

/* The reactions of exit done. */
static void coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Milk_r_done(CoffeeMachine* handle)
{
	/* The reactions of exit done. */
	coffeeMachine_effect_main_On_r_Process_Recipe_r_Make_Milk_tr0(handle);
}

/* The reactions of exit done. */
static void coffeeMachine_react_main_On_r_Process_Recipe_r_done(CoffeeMachine* handle)
{
	/* The reactions of exit done. */
	coffeeMachine_effect_main_On_r_Process_Recipe_tr0(handle);
}

/* The reactions of exit done. */
static void coffeeMachine_react_main_On_r_Process_Recipe_r_Make_Coffee_r_done(CoffeeMachine* handle)
{
	/* The reactions of exit done. */
	coffeeMachine_effect_main_On_r_Process_Recipe_r_Make_Coffee_tr0(handle);
}


