
#include <stdlib.h>
#include <string.h>
#include "sc\sc_types.h"
#include "CoffeeMachine.h"
#include "CoffeeMachineRequired.h"
/*! \file Implementation of the state machine 'CoffeeMachine'
*/

/* prototypes of all internal functions */
static sc_boolean check__lr0(const CoffeeMachine* handle);
static sc_boolean check__lr1(const CoffeeMachine* handle);
static sc_boolean check__lr2(const CoffeeMachine* handle);
static sc_boolean check__lr3(const CoffeeMachine* handle);
static sc_boolean check_main_Off_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean check_main_On_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean check_main_On_r_Welcome_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean check_main_On_r_Heating_Up_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean check_main_On_r_Wait_For_Choice_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean check_main_On_r_Wait_For_Choice_tr1_tr1(const CoffeeMachine* handle);
static sc_boolean check_main_On_r_Save_Energy_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean check_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean check_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean check_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean check_main_On_r_Process_Recipe_r__choice_0_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean check_main_On_r_Process_Recipe_r__choice_0_tr1_tr1(const CoffeeMachine* handle);
static sc_boolean check_main_On_r_Process_Recipe_r__choice_1_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean check_main_On_r_Process_Recipe_r__choice_1_tr1_tr1(const CoffeeMachine* handle);
static sc_boolean check_main_On_r_Process_Recipe_r__choice_2_tr0_tr0(const CoffeeMachine* handle);
static sc_boolean check_main_On_r_Process_Recipe_r__choice_2_tr1_tr1(const CoffeeMachine* handle);
static void effect__lr0(CoffeeMachine* handle);
static void effect__lr1(CoffeeMachine* handle);
static void effect__lr2(CoffeeMachine* handle);
static void effect__lr3(CoffeeMachine* handle);
static void effect_main_Off_tr0(CoffeeMachine* handle);
static void effect_main_On_tr0(CoffeeMachine* handle);
static void effect_main_On_r_Welcome_tr0(CoffeeMachine* handle);
static void effect_main_On_r_Heating_Up_tr0(CoffeeMachine* handle);
static void effect_main_On_r_Wait_For_Choice_tr0(CoffeeMachine* handle);
static void effect_main_On_r_Wait_For_Choice_tr1(CoffeeMachine* handle);
static void effect_main_On_r_Save_Energy_tr0(CoffeeMachine* handle);
static void effect_main_On_r_Process_Recipe_tr0(CoffeeMachine* handle);
static void effect_main_On_r_Process_Recipe_r_Make_Milk_tr0(CoffeeMachine* handle);
static void effect_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tr0(CoffeeMachine* handle);
static void effect_main_On_r_Process_Recipe_r_Make_Coffee_tr0(CoffeeMachine* handle);
static void effect_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tr0(CoffeeMachine* handle);
static void effect_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tr0(CoffeeMachine* handle);
static void effect_main_On_r_Process_Recipe_r__choice_0_tr0(CoffeeMachine* handle);
static void effect_main_On_r_Process_Recipe_r__choice_0_tr1(CoffeeMachine* handle);
static void effect_main_On_r_Process_Recipe_r__choice_1_tr0(CoffeeMachine* handle);
static void effect_main_On_r_Process_Recipe_r__choice_1_tr1(CoffeeMachine* handle);
static void effect_main_On_r_Process_Recipe_r__choice_2_tr0(CoffeeMachine* handle);
static void effect_main_On_r_Process_Recipe_r__choice_2_tr1(CoffeeMachine* handle);
static void enact(CoffeeMachine* handle);
static void enact_main_Off(CoffeeMachine* handle);
static void enact_main_On_r_Welcome(CoffeeMachine* handle);
static void enact_main_On_r_Heating_Up(CoffeeMachine* handle);
static void enact_main_On_r_Wait_For_Choice(CoffeeMachine* handle);
static void enact_main_On_r_Save_Energy(CoffeeMachine* handle);
static void enact_main_On_r_Process_Recipe(CoffeeMachine* handle);
static void enact_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(CoffeeMachine* handle);
static void enact_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(CoffeeMachine* handle);
static void enact_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(CoffeeMachine* handle);
static void exact(CoffeeMachine* handle);
static void exact_main_On_r_Heating_Up(CoffeeMachine* handle);
static void exact_main_On_r_Wait_For_Choice(CoffeeMachine* handle);
static void exact_main_On_r_Process_Recipe(CoffeeMachine* handle);
static void exact_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(CoffeeMachine* handle);
static void exact_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(CoffeeMachine* handle);
static void exact_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(CoffeeMachine* handle);
static void enseq_main_Off_default(CoffeeMachine* handle);
static void enseq_main_On_default(CoffeeMachine* handle);
static void enseq_main_On_r_Welcome_default(CoffeeMachine* handle);
static void enseq_main_On_r_Heating_Up_default(CoffeeMachine* handle);
static void enseq_main_On_r_Wait_For_Choice_default(CoffeeMachine* handle);
static void enseq_main_On_r_Save_Energy_default(CoffeeMachine* handle);
static void enseq_main_On_r_Process_Recipe_r_Make_Milk_default(CoffeeMachine* handle);
static void enseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_default(CoffeeMachine* handle);
static void enseq_main_On_r_Process_Recipe_r_Make_Coffee_default(CoffeeMachine* handle);
static void enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_default(CoffeeMachine* handle);
static void enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_default(CoffeeMachine* handle);
static void enseq_main_default(CoffeeMachine* handle);
static void enseq_main_On_r_default(CoffeeMachine* handle);
static void enseq_main_On_r_Process_Recipe_r_Make_Milk_r_default(CoffeeMachine* handle);
static void enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_default(CoffeeMachine* handle);
static void exseq_main_Off(CoffeeMachine* handle);
static void exseq_main_On(CoffeeMachine* handle);
static void exseq_main_On_r_Welcome(CoffeeMachine* handle);
static void exseq_main_On_r_Heating_Up(CoffeeMachine* handle);
static void exseq_main_On_r_Wait_For_Choice(CoffeeMachine* handle);
static void exseq_main_On_r_Save_Energy(CoffeeMachine* handle);
static void exseq_main_On_r_Process_Recipe(CoffeeMachine* handle);
static void exseq_main_On_r_Process_Recipe_r_Make_Milk(CoffeeMachine* handle);
static void exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(CoffeeMachine* handle);
static void exseq_main_On_r_Process_Recipe_r_Make_Coffee(CoffeeMachine* handle);
static void exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(CoffeeMachine* handle);
static void exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(CoffeeMachine* handle);
static void exseq_main(CoffeeMachine* handle);
static void exseq_main_On_r(CoffeeMachine* handle);
static void exseq_main_On_r_Process_Recipe_r(CoffeeMachine* handle);
static void exseq_main_On_r_Process_Recipe_r_Make_Milk_r(CoffeeMachine* handle);
static void exseq_main_On_r_Process_Recipe_r_Make_Coffee_r(CoffeeMachine* handle);
static void react_main_Off(CoffeeMachine* handle);
static void react_main_On_r_Welcome(CoffeeMachine* handle);
static void react_main_On_r_Heating_Up(CoffeeMachine* handle);
static void react_main_On_r_Wait_For_Choice(CoffeeMachine* handle);
static void react_main_On_r_Save_Energy(CoffeeMachine* handle);
static void react_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(CoffeeMachine* handle);
static void react_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(CoffeeMachine* handle);
static void react_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(CoffeeMachine* handle);
static void react_main_On_r_Process_Recipe_r__choice_0(CoffeeMachine* handle);
static void react_main_On_r_Process_Recipe_r__choice_1(CoffeeMachine* handle);
static void react_main_On_r_Process_Recipe_r__choice_2(CoffeeMachine* handle);
static void react_main__entry_Default(CoffeeMachine* handle);
static void react_main_On_r__entry_Default(CoffeeMachine* handle);
static void react_main_On_r_Process_Recipe_r_Make_Milk_r__entry_Default(CoffeeMachine* handle);
static void react_main_On_r_Process_Recipe_r_Make_Coffee_r__entry_Default(CoffeeMachine* handle);
static void react_main_On_r_Process_Recipe_r_Make_Milk_r_done(CoffeeMachine* handle);
static void react_main_On_r_Process_Recipe_r_done(CoffeeMachine* handle);
static void react_main_On_r_Process_Recipe_r_Make_Coffee_r_done(CoffeeMachine* handle);
static void clearInEvents(CoffeeMachine* handle);
static void clearOutEvents(CoffeeMachine* handle);


void coffeeMachine_init(CoffeeMachine* handle)
{
		sc_integer i;
	
		for (i = 0; i < COFFEEMACHINE_MAX_ORTHOGONAL_STATES; ++i)
		{
			handle->stateConfVector[i] = CoffeeMachine_last_state;
		}
		
		
		handle->stateConfVectorPosition = 0;
	
		clearInEvents(handle);
		clearOutEvents(handle);
	
		/* Default init sequence for statechart CoffeeMachine */
		handle->internal.lastChoice = NONE;
		handle->internal.processing = bool_false;
}

void coffeeMachine_enter(CoffeeMachine* handle)
{
	/* Default enter sequence for statechart CoffeeMachine */
	enact(handle);
	enseq_main_default(handle);
}

void coffeeMachine_exit(CoffeeMachine* handle)
{
	/* Default exit sequence for statechart CoffeeMachine */
	exseq_main(handle);
	exact(handle);
}

sc_boolean coffeeMachine_isActive(const CoffeeMachine* handle)
{
	sc_boolean result = bool_false;
	int i;
	
	for(i = 0; i < COFFEEMACHINE_MAX_ORTHOGONAL_STATES; i++)
	{
		result = result || handle->stateConfVector[i] != CoffeeMachine_last_state;
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

static void clearInEvents(CoffeeMachine* handle)
{
	handle->iface.userEvent_raised = bool_false;
	handle->timeEvents.coffeeMachine_main_On_r_Wait_For_Choice_tev0_raised = bool_false;
	handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tev0_raised = bool_false;
	handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tev0_raised = bool_false;
	handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tev0_raised = bool_false;
	handle->timeEvents.coffeeMachine_tev0_raised = bool_false;
	handle->timeEvents.coffeeMachine_tev1_raised = bool_false;
}

static void clearOutEvents(CoffeeMachine* handle)
{
}

void coffeeMachine_runCycle(CoffeeMachine* handle)
{
	
	clearOutEvents(handle);
	for (handle->stateConfVectorPosition = 0;
		handle->stateConfVectorPosition < COFFEEMACHINE_MAX_ORTHOGONAL_STATES;
		handle->stateConfVectorPosition++)
		{
			
		switch (handle->stateConfVector[handle->stateConfVectorPosition])
		{
		case CoffeeMachine_main_Off:
		{
			react_main_Off(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Welcome:
		{
			react_main_On_r_Welcome(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Heating_Up:
		{
			react_main_On_r_Heating_Up(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Wait_For_Choice:
		{
			react_main_On_r_Wait_For_Choice(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Save_Energy:
		{
			react_main_On_r_Save_Energy(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam:
		{
			react_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans:
		{
			react_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee:
		{
			react_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(handle);
			break;
		}
		default:
			break;
		}
	}
	
	clearInEvents(handle);
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
			result = (sc_boolean) (handle->stateConfVector[SCVI_COFFEEMACHINE_MAIN_OFF] == CoffeeMachine_main_Off
			);
			break;
		case CoffeeMachine_main_On :
			result = (sc_boolean) (handle->stateConfVector[SCVI_COFFEEMACHINE_MAIN_ON] >= CoffeeMachine_main_On
				&& handle->stateConfVector[SCVI_COFFEEMACHINE_MAIN_ON] <= CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee);
			break;
		case CoffeeMachine_main_On_r_Welcome :
			result = (sc_boolean) (handle->stateConfVector[SCVI_COFFEEMACHINE_MAIN_ON_R_WELCOME] == CoffeeMachine_main_On_r_Welcome
			);
			break;
		case CoffeeMachine_main_On_r_Heating_Up :
			result = (sc_boolean) (handle->stateConfVector[SCVI_COFFEEMACHINE_MAIN_ON_R_HEATING_UP] == CoffeeMachine_main_On_r_Heating_Up
			);
			break;
		case CoffeeMachine_main_On_r_Wait_For_Choice :
			result = (sc_boolean) (handle->stateConfVector[SCVI_COFFEEMACHINE_MAIN_ON_R_WAIT_FOR_CHOICE] == CoffeeMachine_main_On_r_Wait_For_Choice
			);
			break;
		case CoffeeMachine_main_On_r_Save_Energy :
			result = (sc_boolean) (handle->stateConfVector[SCVI_COFFEEMACHINE_MAIN_ON_R_SAVE_ENERGY] == CoffeeMachine_main_On_r_Save_Energy
			);
			break;
		case CoffeeMachine_main_On_r_Process_Recipe :
			result = (sc_boolean) (handle->stateConfVector[SCVI_COFFEEMACHINE_MAIN_ON_R_PROCESS_RECIPE] >= CoffeeMachine_main_On_r_Process_Recipe
				&& handle->stateConfVector[SCVI_COFFEEMACHINE_MAIN_ON_R_PROCESS_RECIPE] <= CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee);
			break;
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk :
			result = (sc_boolean) (handle->stateConfVector[SCVI_COFFEEMACHINE_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_MILK] >= CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk
				&& handle->stateConfVector[SCVI_COFFEEMACHINE_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_MILK] <= CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam);
			break;
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam :
			result = (sc_boolean) (handle->stateConfVector[SCVI_COFFEEMACHINE_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_MILK_R_MAKE_STEAM] == CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam
			);
			break;
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee :
			result = (sc_boolean) (handle->stateConfVector[SCVI_COFFEEMACHINE_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_COFFEE] >= CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee
				&& handle->stateConfVector[SCVI_COFFEEMACHINE_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_COFFEE] <= CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee);
			break;
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans :
			result = (sc_boolean) (handle->stateConfVector[SCVI_COFFEEMACHINE_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_COFFEE_R_MILLING_BEANS] == CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans
			);
			break;
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee :
			result = (sc_boolean) (handle->stateConfVector[SCVI_COFFEEMACHINE_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_COFFEE_R_BREW_COFFEE] == CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee
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

static sc_boolean check__lr0(const CoffeeMachine* handle)
{
	return bool_true;
}

static sc_boolean check__lr1(const CoffeeMachine* handle)
{
	return handle->iface.userEvent_raised;
}

static sc_boolean check__lr2(const CoffeeMachine* handle)
{
	return handle->timeEvents.coffeeMachine_tev0_raised;
}

static sc_boolean check__lr3(const CoffeeMachine* handle)
{
	return ((handle->timeEvents.coffeeMachine_tev1_raised) && (handle->internal.processing)) ? bool_true : bool_false;
}

static sc_boolean check_main_Off_tr0_tr0(const CoffeeMachine* handle)
{
	return (handle->internal.userInput == ON_OFF) ? bool_true : bool_false;
}

static sc_boolean check_main_On_tr0_tr0(const CoffeeMachine* handle)
{
	return (handle->internal.userInput == ON_OFF) ? bool_true : bool_false;
}

static sc_boolean check_main_On_r_Welcome_tr0_tr0(const CoffeeMachine* handle)
{
	return bool_true;
}

static sc_boolean check_main_On_r_Heating_Up_tr0_tr0(const CoffeeMachine* handle)
{
	return (heater.temp >= 95) ? bool_true : bool_false;
}

static sc_boolean check_main_On_r_Wait_For_Choice_tr0_tr0(const CoffeeMachine* handle)
{
	return handle->timeEvents.coffeeMachine_main_On_r_Wait_For_Choice_tev0_raised;
}

static sc_boolean check_main_On_r_Wait_For_Choice_tr1_tr1(const CoffeeMachine* handle)
{
	return (COFFEE <= handle->internal.userInput && handle->internal.userInput <= MILK) ? bool_true : bool_false;
}

static sc_boolean check_main_On_r_Save_Energy_tr0_tr0(const CoffeeMachine* handle)
{
	return (handle->internal.userInput != NONE) ? bool_true : bool_false;
}

static sc_boolean check_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tr0_tr0(const CoffeeMachine* handle)
{
	return handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tev0_raised;
}

static sc_boolean check_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tr0_tr0(const CoffeeMachine* handle)
{
	return handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tev0_raised;
}

static sc_boolean check_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tr0_tr0(const CoffeeMachine* handle)
{
	return handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tev0_raised;
}

static sc_boolean check_main_On_r_Process_Recipe_r__choice_0_tr0_tr0(const CoffeeMachine* handle)
{
	return (handle->internal.recipe.milk_volume > 0 && handle->internal.recipe.milk_first) ? bool_true : bool_false;
}

static sc_boolean check_main_On_r_Process_Recipe_r__choice_0_tr1_tr1(const CoffeeMachine* handle)
{
	return bool_true;
}

static sc_boolean check_main_On_r_Process_Recipe_r__choice_1_tr0_tr0(const CoffeeMachine* handle)
{
	return ((!handle->internal.recipe.milk_first) && handle->internal.recipe.milk_volume > 0) ? bool_true : bool_false;
}

static sc_boolean check_main_On_r_Process_Recipe_r__choice_1_tr1_tr1(const CoffeeMachine* handle)
{
	return bool_true;
}

static sc_boolean check_main_On_r_Process_Recipe_r__choice_2_tr0_tr0(const CoffeeMachine* handle)
{
	return (handle->internal.recipe.milk_first && handle->internal.recipe.coffee_mass > 0) ? bool_true : bool_false;
}

static sc_boolean check_main_On_r_Process_Recipe_r__choice_2_tr1_tr1(const CoffeeMachine* handle)
{
	return bool_true;
}

static void effect__lr0(CoffeeMachine* handle)
{
	handle->internal.userInput = NONE;
}

static void effect__lr1(CoffeeMachine* handle)
{
	handle->internal.userInput = handle->iface.userEvent_value;
}

static void effect__lr2(CoffeeMachine* handle)
{
	updateHeating(2);
}

static void effect__lr3(CoffeeMachine* handle)
{
	show(".");
}

static void effect_main_Off_tr0(CoffeeMachine* handle)
{
	exseq_main_Off(handle);
	enseq_main_On_default(handle);
}

static void effect_main_On_tr0(CoffeeMachine* handle)
{
	exseq_main_On(handle);
	enseq_main_Off_default(handle);
}

static void effect_main_On_r_Welcome_tr0(CoffeeMachine* handle)
{
	exseq_main_On_r_Welcome(handle);
	enseq_main_On_r_Heating_Up_default(handle);
}

static void effect_main_On_r_Heating_Up_tr0(CoffeeMachine* handle)
{
	exseq_main_On_r_Heating_Up(handle);
	enseq_main_On_r_Wait_For_Choice_default(handle);
}

static void effect_main_On_r_Wait_For_Choice_tr0(CoffeeMachine* handle)
{
	exseq_main_On_r_Wait_For_Choice(handle);
	enseq_main_On_r_Save_Energy_default(handle);
}

static void effect_main_On_r_Wait_For_Choice_tr1(CoffeeMachine* handle)
{
	exseq_main_On_r_Wait_For_Choice(handle);
	handle->internal.recipe = get_recipe(handle->internal.userInput);
	enact_main_On_r_Process_Recipe(handle);
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Process_Recipe);
	react_main_On_r_Process_Recipe_r__choice_0(handle);
}

static void effect_main_On_r_Save_Energy_tr0(CoffeeMachine* handle)
{
	exseq_main_On_r_Save_Energy(handle);
	enseq_main_On_r_Heating_Up_default(handle);
}

static void effect_main_On_r_Process_Recipe_tr0(CoffeeMachine* handle)
{
	exseq_main_On_r_Process_Recipe(handle);
	showDone(handle->internal.lastChoice);
	enseq_main_On_r_Wait_For_Choice_default(handle);
}

static void effect_main_On_r_Process_Recipe_r_Make_Milk_tr0(CoffeeMachine* handle)
{
	exseq_main_On_r_Process_Recipe_r_Make_Milk(handle);
	react_main_On_r_Process_Recipe_r__choice_2(handle);
}

static void effect_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tr0(CoffeeMachine* handle)
{
	exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(handle);
	react_main_On_r_Process_Recipe_r_Make_Milk_r_done(handle);
}

static void effect_main_On_r_Process_Recipe_r_Make_Coffee_tr0(CoffeeMachine* handle)
{
	exseq_main_On_r_Process_Recipe_r_Make_Coffee(handle);
	react_main_On_r_Process_Recipe_r__choice_1(handle);
}

static void effect_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tr0(CoffeeMachine* handle)
{
	exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(handle);
	enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_default(handle);
}

static void effect_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tr0(CoffeeMachine* handle)
{
	exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(handle);
	react_main_On_r_Process_Recipe_r_Make_Coffee_r_done(handle);
}

static void effect_main_On_r_Process_Recipe_r__choice_0_tr0(CoffeeMachine* handle)
{
	enseq_main_On_r_Process_Recipe_r_Make_Milk_default(handle);
}

static void effect_main_On_r_Process_Recipe_r__choice_0_tr1(CoffeeMachine* handle)
{
	enseq_main_On_r_Process_Recipe_r_Make_Coffee_default(handle);
}

static void effect_main_On_r_Process_Recipe_r__choice_1_tr0(CoffeeMachine* handle)
{
	enseq_main_On_r_Process_Recipe_r_Make_Milk_default(handle);
}

static void effect_main_On_r_Process_Recipe_r__choice_1_tr1(CoffeeMachine* handle)
{
	react_main_On_r_Process_Recipe_r_done(handle);
}

static void effect_main_On_r_Process_Recipe_r__choice_2_tr0(CoffeeMachine* handle)
{
	enseq_main_On_r_Process_Recipe_r_Make_Coffee_default(handle);
}

static void effect_main_On_r_Process_Recipe_r__choice_2_tr1(CoffeeMachine* handle)
{
	react_main_On_r_Process_Recipe_r_done(handle);
}

/* Entry action for statechart 'CoffeeMachine'. */
static void enact(CoffeeMachine* handle)
{
	/* Entry action for statechart 'CoffeeMachine'. */
	coffeeMachine_setTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_tev0_raised) , 200, bool_true);
	coffeeMachine_setTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_tev1_raised) , 500, bool_true);
}

/* Entry action for state 'Off'. */
static void enact_main_Off(CoffeeMachine* handle)
{
	/* Entry action for state 'Off'. */
	stopHeating();
}

/* Entry action for state 'Welcome'. */
static void enact_main_On_r_Welcome(CoffeeMachine* handle)
{
	/* Entry action for state 'Welcome'. */
	show("** Welcome to YAKINDU Coffee Maker **\n");
}

/* Entry action for state 'Heating Up'. */
static void enact_main_On_r_Heating_Up(CoffeeMachine* handle)
{
	/* Entry action for state 'Heating Up'. */
	startHeating();
	show("* heating");
	handle->internal.processing = bool_true;
}

/* Entry action for state 'Wait For Choice'. */
static void enact_main_On_r_Wait_For_Choice(CoffeeMachine* handle)
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
static void enact_main_On_r_Save_Energy(CoffeeMachine* handle)
{
	/* Entry action for state 'Save Energy'. */
	stopHeating();
	show("\n* save energy - continue with any command ...\n");
}

/* Entry action for state 'Process Recipe'. */
static void enact_main_On_r_Process_Recipe(CoffeeMachine* handle)
{
	/* Entry action for state 'Process Recipe'. */
	showPrepare(handle->internal.userInput);
	handle->internal.lastChoice = handle->internal.userInput;
	handle->internal.processing = bool_true;
}

/* Entry action for state 'Make Steam'. */
static void enact_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(CoffeeMachine* handle)
{
	/* Entry action for state 'Make Steam'. */
	coffeeMachine_setTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tev0_raised) , handle->internal.recipe.milk_volume * 60, bool_false);
}

/* Entry action for state 'Milling Beans'. */
static void enact_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(CoffeeMachine* handle)
{
	/* Entry action for state 'Milling Beans'. */
	coffeeMachine_setTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tev0_raised) , handle->internal.recipe.coffee_mass * 1000, bool_false);
	startMilling();
}

/* Entry action for state 'Brew Coffee'. */
static void enact_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(CoffeeMachine* handle)
{
	/* Entry action for state 'Brew Coffee'. */
	coffeeMachine_setTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tev0_raised) , handle->internal.recipe.water_volume * 60, bool_false);
	startPumping();
}

/* Exit action for state 'CoffeeMachine'. */
static void exact(CoffeeMachine* handle)
{
	/* Exit action for state 'CoffeeMachine'. */
	coffeeMachine_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_tev0_raised) );		
	coffeeMachine_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_tev1_raised) );		
}

/* Exit action for state 'Heating Up'. */
static void exact_main_On_r_Heating_Up(CoffeeMachine* handle)
{
	/* Exit action for state 'Heating Up'. */
	handle->internal.processing = bool_false;
}

/* Exit action for state 'Wait For Choice'. */
static void exact_main_On_r_Wait_For_Choice(CoffeeMachine* handle)
{
	/* Exit action for state 'Wait For Choice'. */
	coffeeMachine_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_main_On_r_Wait_For_Choice_tev0_raised) );		
}

/* Exit action for state 'Process Recipe'. */
static void exact_main_On_r_Process_Recipe(CoffeeMachine* handle)
{
	/* Exit action for state 'Process Recipe'. */
	handle->internal.processing = bool_false;
}

/* Exit action for state 'Make Steam'. */
static void exact_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(CoffeeMachine* handle)
{
	/* Exit action for state 'Make Steam'. */
	coffeeMachine_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tev0_raised) );		
}

/* Exit action for state 'Milling Beans'. */
static void exact_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(CoffeeMachine* handle)
{
	/* Exit action for state 'Milling Beans'. */
	coffeeMachine_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tev0_raised) );		
	stopMilling();
}

/* Exit action for state 'Brew Coffee'. */
static void exact_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(CoffeeMachine* handle)
{
	/* Exit action for state 'Brew Coffee'. */
	coffeeMachine_unsetTimer(handle, (sc_eventid) &(handle->timeEvents.coffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tev0_raised) );		
	stopPumping();
}

/* 'default' enter sequence for state Off */
static void enseq_main_Off_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Off */
	enact_main_Off(handle);
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_Off);
	handle->stateConfVector[0] = CoffeeMachine_main_Off;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state On */
static void enseq_main_On_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state On */
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On);
	enseq_main_On_r_default(handle);
}

/* 'default' enter sequence for state Welcome */
static void enseq_main_On_r_Welcome_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Welcome */
	enact_main_On_r_Welcome(handle);
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Welcome);
	handle->stateConfVector[0] = CoffeeMachine_main_On_r_Welcome;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Heating Up */
static void enseq_main_On_r_Heating_Up_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Heating Up */
	enact_main_On_r_Heating_Up(handle);
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Heating_Up);
	handle->stateConfVector[0] = CoffeeMachine_main_On_r_Heating_Up;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Wait For Choice */
static void enseq_main_On_r_Wait_For_Choice_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Wait For Choice */
	enact_main_On_r_Wait_For_Choice(handle);
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Wait_For_Choice);
	handle->stateConfVector[0] = CoffeeMachine_main_On_r_Wait_For_Choice;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Save Energy */
static void enseq_main_On_r_Save_Energy_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Save Energy */
	enact_main_On_r_Save_Energy(handle);
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Save_Energy);
	handle->stateConfVector[0] = CoffeeMachine_main_On_r_Save_Energy;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Make Milk */
static void enseq_main_On_r_Process_Recipe_r_Make_Milk_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Make Milk */
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk);
	enseq_main_On_r_Process_Recipe_r_Make_Milk_r_default(handle);
}

/* 'default' enter sequence for state Make Steam */
static void enseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Make Steam */
	enact_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(handle);
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam);
	handle->stateConfVector[0] = CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Make Coffee */
static void enseq_main_On_r_Process_Recipe_r_Make_Coffee_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Make Coffee */
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee);
	enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_default(handle);
}

/* 'default' enter sequence for state Milling Beans */
static void enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Milling Beans */
	enact_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(handle);
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans);
	handle->stateConfVector[0] = CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Brew Coffee */
static void enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for state Brew Coffee */
	enact_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(handle);
	coffeeMachine_stateEntered(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee);
	handle->stateConfVector[0] = CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee;
	handle->stateConfVectorPosition = 0;
}

/* 'default' enter sequence for region main */
static void enseq_main_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for region main */
	react_main__entry_Default(handle);
}

/* 'default' enter sequence for region r */
static void enseq_main_On_r_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for region r */
	react_main_On_r__entry_Default(handle);
}

/* 'default' enter sequence for region r */
static void enseq_main_On_r_Process_Recipe_r_Make_Milk_r_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for region r */
	react_main_On_r_Process_Recipe_r_Make_Milk_r__entry_Default(handle);
}

/* 'default' enter sequence for region r */
static void enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_default(CoffeeMachine* handle)
{
	/* 'default' enter sequence for region r */
	react_main_On_r_Process_Recipe_r_Make_Coffee_r__entry_Default(handle);
}

/* Default exit sequence for state Off */
static void exseq_main_Off(CoffeeMachine* handle)
{
	/* Default exit sequence for state Off */
	handle->stateConfVector[0] = CoffeeMachine_last_state;
	handle->stateConfVectorPosition = 0;
	coffeeMachine_stateExited(handle, CoffeeMachine_main_Off);
}

/* Default exit sequence for state On */
static void exseq_main_On(CoffeeMachine* handle)
{
	/* Default exit sequence for state On */
	exseq_main_On_r(handle);
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On);
}

/* Default exit sequence for state Welcome */
static void exseq_main_On_r_Welcome(CoffeeMachine* handle)
{
	/* Default exit sequence for state Welcome */
	handle->stateConfVector[0] = CoffeeMachine_last_state;
	handle->stateConfVectorPosition = 0;
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Welcome);
}

/* Default exit sequence for state Heating Up */
static void exseq_main_On_r_Heating_Up(CoffeeMachine* handle)
{
	/* Default exit sequence for state Heating Up */
	handle->stateConfVector[0] = CoffeeMachine_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_On_r_Heating_Up(handle);
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Heating_Up);
}

/* Default exit sequence for state Wait For Choice */
static void exseq_main_On_r_Wait_For_Choice(CoffeeMachine* handle)
{
	/* Default exit sequence for state Wait For Choice */
	handle->stateConfVector[0] = CoffeeMachine_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_On_r_Wait_For_Choice(handle);
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Wait_For_Choice);
}

/* Default exit sequence for state Save Energy */
static void exseq_main_On_r_Save_Energy(CoffeeMachine* handle)
{
	/* Default exit sequence for state Save Energy */
	handle->stateConfVector[0] = CoffeeMachine_last_state;
	handle->stateConfVectorPosition = 0;
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Save_Energy);
}

/* Default exit sequence for state Process Recipe */
static void exseq_main_On_r_Process_Recipe(CoffeeMachine* handle)
{
	/* Default exit sequence for state Process Recipe */
	exseq_main_On_r_Process_Recipe_r(handle);
	exact_main_On_r_Process_Recipe(handle);
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe);
}

/* Default exit sequence for state Make Milk */
static void exseq_main_On_r_Process_Recipe_r_Make_Milk(CoffeeMachine* handle)
{
	/* Default exit sequence for state Make Milk */
	exseq_main_On_r_Process_Recipe_r_Make_Milk_r(handle);
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk);
}

/* Default exit sequence for state Make Steam */
static void exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(CoffeeMachine* handle)
{
	/* Default exit sequence for state Make Steam */
	handle->stateConfVector[0] = CoffeeMachine_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(handle);
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam);
}

/* Default exit sequence for state Make Coffee */
static void exseq_main_On_r_Process_Recipe_r_Make_Coffee(CoffeeMachine* handle)
{
	/* Default exit sequence for state Make Coffee */
	exseq_main_On_r_Process_Recipe_r_Make_Coffee_r(handle);
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee);
}

/* Default exit sequence for state Milling Beans */
static void exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(CoffeeMachine* handle)
{
	/* Default exit sequence for state Milling Beans */
	handle->stateConfVector[0] = CoffeeMachine_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(handle);
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans);
}

/* Default exit sequence for state Brew Coffee */
static void exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(CoffeeMachine* handle)
{
	/* Default exit sequence for state Brew Coffee */
	handle->stateConfVector[0] = CoffeeMachine_last_state;
	handle->stateConfVectorPosition = 0;
	exact_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(handle);
	coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee);
}

/* Default exit sequence for region main */
static void exseq_main(CoffeeMachine* handle)
{
	/* Default exit sequence for region main */
	/* Handle exit of all possible states (of CoffeeMachine.main) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case CoffeeMachine_main_Off :
		{
			exseq_main_Off(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Welcome :
		{
			exseq_main_On_r_Welcome(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On);
			break;
		}
		case CoffeeMachine_main_On_r_Heating_Up :
		{
			exseq_main_On_r_Heating_Up(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On);
			break;
		}
		case CoffeeMachine_main_On_r_Wait_For_Choice :
		{
			exseq_main_On_r_Wait_For_Choice(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On);
			break;
		}
		case CoffeeMachine_main_On_r_Save_Energy :
		{
			exseq_main_On_r_Save_Energy(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk);
			exact_main_On_r_Process_Recipe(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee);
			exact_main_On_r_Process_Recipe(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee);
			exact_main_On_r_Process_Recipe(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On);
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
static void exseq_main_On_r(CoffeeMachine* handle)
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of CoffeeMachine.main.On.r) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case CoffeeMachine_main_On_r_Welcome :
		{
			exseq_main_On_r_Welcome(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Heating_Up :
		{
			exseq_main_On_r_Heating_Up(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Wait_For_Choice :
		{
			exseq_main_On_r_Wait_For_Choice(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Save_Energy :
		{
			exseq_main_On_r_Save_Energy(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk);
			exact_main_On_r_Process_Recipe(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee);
			exact_main_On_r_Process_Recipe(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee);
			exact_main_On_r_Process_Recipe(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe);
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
static void exseq_main_On_r_Process_Recipe_r(CoffeeMachine* handle)
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of CoffeeMachine.main.On.r.Process_Recipe.r) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(handle);
			coffeeMachine_stateExited(handle, CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee);
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
static void exseq_main_On_r_Process_Recipe_r_Make_Milk_r(CoffeeMachine* handle)
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of CoffeeMachine.main.On.r.Process_Recipe.r.Make_Milk.r) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(handle);
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
static void exseq_main_On_r_Process_Recipe_r_Make_Coffee_r(CoffeeMachine* handle)
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of CoffeeMachine.main.On.r.Process_Recipe.r.Make_Coffee.r) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(handle);
			break;
		}
		case CoffeeMachine_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(handle);
			break;
		}
		default: break;
	}
}

/* The reactions of state Off. */
static void react_main_Off(CoffeeMachine* handle)
{
	/* The reactions of state Off. */
	effect__lr0(handle);
	if (check__lr1(handle) == bool_true)
	{ 
		effect__lr1(handle);
	} 
	if (check__lr2(handle) == bool_true)
	{ 
		effect__lr2(handle);
	} 
	if (check__lr3(handle) == bool_true)
	{ 
		effect__lr3(handle);
	} 
	if (check_main_Off_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_Off_tr0(handle);
	} 
}

/* The reactions of state Welcome. */
static void react_main_On_r_Welcome(CoffeeMachine* handle)
{
	/* The reactions of state Welcome. */
	effect__lr0(handle);
	if (check__lr1(handle) == bool_true)
	{ 
		effect__lr1(handle);
	} 
	if (check__lr2(handle) == bool_true)
	{ 
		effect__lr2(handle);
	} 
	if (check__lr3(handle) == bool_true)
	{ 
		effect__lr3(handle);
	} 
	if (check_main_On_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_On_tr0(handle);
	}  else
	{
		effect_main_On_r_Welcome_tr0(handle);
	}
}

/* The reactions of state Heating Up. */
static void react_main_On_r_Heating_Up(CoffeeMachine* handle)
{
	/* The reactions of state Heating Up. */
	effect__lr0(handle);
	if (check__lr1(handle) == bool_true)
	{ 
		effect__lr1(handle);
	} 
	if (check__lr2(handle) == bool_true)
	{ 
		effect__lr2(handle);
	} 
	if (check__lr3(handle) == bool_true)
	{ 
		effect__lr3(handle);
	} 
	if (check_main_On_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_On_tr0(handle);
	}  else
	{
		if (check_main_On_r_Heating_Up_tr0_tr0(handle) == bool_true)
		{ 
			effect_main_On_r_Heating_Up_tr0(handle);
		} 
	}
}

/* The reactions of state Wait For Choice. */
static void react_main_On_r_Wait_For_Choice(CoffeeMachine* handle)
{
	/* The reactions of state Wait For Choice. */
	effect__lr0(handle);
	if (check__lr1(handle) == bool_true)
	{ 
		effect__lr1(handle);
	} 
	if (check__lr2(handle) == bool_true)
	{ 
		effect__lr2(handle);
	} 
	if (check__lr3(handle) == bool_true)
	{ 
		effect__lr3(handle);
	} 
	if (check_main_On_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_On_tr0(handle);
	}  else
	{
		if (check_main_On_r_Wait_For_Choice_tr0_tr0(handle) == bool_true)
		{ 
			effect_main_On_r_Wait_For_Choice_tr0(handle);
		}  else
		{
			if (check_main_On_r_Wait_For_Choice_tr1_tr1(handle) == bool_true)
			{ 
				effect_main_On_r_Wait_For_Choice_tr1(handle);
			} 
		}
	}
}

/* The reactions of state Save Energy. */
static void react_main_On_r_Save_Energy(CoffeeMachine* handle)
{
	/* The reactions of state Save Energy. */
	effect__lr0(handle);
	if (check__lr1(handle) == bool_true)
	{ 
		effect__lr1(handle);
	} 
	if (check__lr2(handle) == bool_true)
	{ 
		effect__lr2(handle);
	} 
	if (check__lr3(handle) == bool_true)
	{ 
		effect__lr3(handle);
	} 
	if (check_main_On_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_On_tr0(handle);
	}  else
	{
		if (check_main_On_r_Save_Energy_tr0_tr0(handle) == bool_true)
		{ 
			effect_main_On_r_Save_Energy_tr0(handle);
		} 
	}
}

/* The reactions of state Make Steam. */
static void react_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam(CoffeeMachine* handle)
{
	/* The reactions of state Make Steam. */
	effect__lr0(handle);
	if (check__lr1(handle) == bool_true)
	{ 
		effect__lr1(handle);
	} 
	if (check__lr2(handle) == bool_true)
	{ 
		effect__lr2(handle);
	} 
	if (check__lr3(handle) == bool_true)
	{ 
		effect__lr3(handle);
	} 
	if (check_main_On_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_On_tr0(handle);
	}  else
	{
		if (check_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tr0_tr0(handle) == bool_true)
		{ 
			effect_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tr0(handle);
		} 
	}
}

/* The reactions of state Milling Beans. */
static void react_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans(CoffeeMachine* handle)
{
	/* The reactions of state Milling Beans. */
	effect__lr0(handle);
	if (check__lr1(handle) == bool_true)
	{ 
		effect__lr1(handle);
	} 
	if (check__lr2(handle) == bool_true)
	{ 
		effect__lr2(handle);
	} 
	if (check__lr3(handle) == bool_true)
	{ 
		effect__lr3(handle);
	} 
	if (check_main_On_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_On_tr0(handle);
	}  else
	{
		if (check_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tr0_tr0(handle) == bool_true)
		{ 
			effect_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tr0(handle);
		} 
	}
}

/* The reactions of state Brew Coffee. */
static void react_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee(CoffeeMachine* handle)
{
	/* The reactions of state Brew Coffee. */
	effect__lr0(handle);
	if (check__lr1(handle) == bool_true)
	{ 
		effect__lr1(handle);
	} 
	if (check__lr2(handle) == bool_true)
	{ 
		effect__lr2(handle);
	} 
	if (check__lr3(handle) == bool_true)
	{ 
		effect__lr3(handle);
	} 
	if (check_main_On_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_On_tr0(handle);
	}  else
	{
		if (check_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tr0_tr0(handle) == bool_true)
		{ 
			effect_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tr0(handle);
		} 
	}
}

/* The reactions of state null. */
static void react_main_On_r_Process_Recipe_r__choice_0(CoffeeMachine* handle)
{
	/* The reactions of state null. */
	if (check_main_On_r_Process_Recipe_r__choice_0_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_On_r_Process_Recipe_r__choice_0_tr0(handle);
	}  else
	{
		effect_main_On_r_Process_Recipe_r__choice_0_tr1(handle);
	}
}

/* The reactions of state null. */
static void react_main_On_r_Process_Recipe_r__choice_1(CoffeeMachine* handle)
{
	/* The reactions of state null. */
	if (check_main_On_r_Process_Recipe_r__choice_1_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_On_r_Process_Recipe_r__choice_1_tr0(handle);
	}  else
	{
		effect_main_On_r_Process_Recipe_r__choice_1_tr1(handle);
	}
}

/* The reactions of state null. */
static void react_main_On_r_Process_Recipe_r__choice_2(CoffeeMachine* handle)
{
	/* The reactions of state null. */
	if (check_main_On_r_Process_Recipe_r__choice_2_tr0_tr0(handle) == bool_true)
	{ 
		effect_main_On_r_Process_Recipe_r__choice_2_tr0(handle);
	}  else
	{
		effect_main_On_r_Process_Recipe_r__choice_2_tr1(handle);
	}
}

/* Default react sequence for initial entry  */
static void react_main__entry_Default(CoffeeMachine* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_Off_default(handle);
}

/* Default react sequence for initial entry  */
static void react_main_On_r__entry_Default(CoffeeMachine* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_On_r_Welcome_default(handle);
}

/* Default react sequence for initial entry  */
static void react_main_On_r_Process_Recipe_r_Make_Milk_r__entry_Default(CoffeeMachine* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_default(handle);
}

/* Default react sequence for initial entry  */
static void react_main_On_r_Process_Recipe_r_Make_Coffee_r__entry_Default(CoffeeMachine* handle)
{
	/* Default react sequence for initial entry  */
	enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_default(handle);
}

/* The reactions of exit done. */
static void react_main_On_r_Process_Recipe_r_Make_Milk_r_done(CoffeeMachine* handle)
{
	/* The reactions of exit done. */
	effect_main_On_r_Process_Recipe_r_Make_Milk_tr0(handle);
}

/* The reactions of exit done. */
static void react_main_On_r_Process_Recipe_r_done(CoffeeMachine* handle)
{
	/* The reactions of exit done. */
	effect_main_On_r_Process_Recipe_tr0(handle);
}

/* The reactions of exit done. */
static void react_main_On_r_Process_Recipe_r_Make_Coffee_r_done(CoffeeMachine* handle)
{
	/* The reactions of exit done. */
	effect_main_On_r_Process_Recipe_r_Make_Coffee_tr0(handle);
}


