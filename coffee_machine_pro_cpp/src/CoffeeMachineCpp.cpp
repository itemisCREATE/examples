
#include "CoffeeMachineCpp.h"
#include <string.h>

/*! \file Implementation of the state machine 'CoffeeMachineCpp'
*/


CoffeeMachineCpp::CoffeeMachineCpp():
	timer(null),
	stateConfVectorPosition(0),
	iface(),
	ifaceInternalSCI()
{
}

CoffeeMachineCpp::~CoffeeMachineCpp()
{
}


void CoffeeMachineCpp::init()
{
	for (sc_ushort i = 0; i < maxOrthogonalStates; ++i)
		stateConfVector[i] = CoffeeMachineCpp_last_state;
	
	stateConfVectorPosition = 0;

	clearInEvents();
	clearOutEvents();
	
	/* Default init sequence for statechart CoffeeMachineCpp */
	ifaceInternalSCI.processing = false;
}

void CoffeeMachineCpp::enter()
{
	/* Default enter sequence for statechart CoffeeMachineCpp */
	enact();
	enseq_main_default();
}

void CoffeeMachineCpp::exit()
{
	/* Default exit sequence for statechart CoffeeMachineCpp */
	exseq_main();
	exact();
}

sc_boolean CoffeeMachineCpp::isActive() const
{
	return stateConfVector[0] != CoffeeMachineCpp_last_state;
}

/* 
 * Always returns 'false' since this state machine can never become final.
 */
sc_boolean CoffeeMachineCpp::isFinal() const
{
   return false;}

void CoffeeMachineCpp::runCycle()
{
	
	clearOutEvents();
	for (stateConfVectorPosition = 0;
		stateConfVectorPosition < maxOrthogonalStates;
		stateConfVectorPosition++)
		{
			
		switch (stateConfVector[stateConfVectorPosition])
		{
		case main_Off :
		{
			react_main_Off();
			break;
		}
		case main_On_r_Welcome :
		{
			react_main_On_r_Welcome();
			break;
		}
		case main_On_r_Heating_Up :
		{
			react_main_On_r_Heating_Up();
			break;
		}
		case main_On_r_Wait_For_Choice :
		{
			react_main_On_r_Wait_For_Choice();
			break;
		}
		case main_On_r_Save_Energy :
		{
			react_main_On_r_Save_Energy();
			break;
		}
		case main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam :
		{
			react_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam();
			break;
		}
		case main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans :
		{
			react_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans();
			break;
		}
		case main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee :
		{
			react_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee();
			break;
		}
		default:
			break;
		}
	}
	clearInEvents();
}

void CoffeeMachineCpp::clearInEvents()
{
	iface.userEvent_raised = false;
	timeEvents[0] = false; 
	timeEvents[1] = false; 
	timeEvents[2] = false; 
	timeEvents[3] = false; 
	timeEvents[4] = false; 
	timeEvents[5] = false; 
}

void CoffeeMachineCpp::clearOutEvents()
{
}


void CoffeeMachineCpp::setTimer(TimerInterface* timerInterface)
{
	this->timer = timerInterface;
}

TimerInterface* CoffeeMachineCpp::getTimer()
{
	return timer;
}

void CoffeeMachineCpp::raiseTimeEvent(sc_eventid evid)
{
	if ((evid >= (sc_eventid)timeEvents) && (evid < (sc_eventid)(&timeEvents[timeEventsCount])))
	{
		*(sc_boolean*)evid = true;
	}				
}

sc_boolean CoffeeMachineCpp::isStateActive(CoffeeMachineCppStates state) const
{
	switch (state)
	{
		case main_Off : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_OFF] == main_Off
			);
		case main_On : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_ON] >= main_On
				&& stateConfVector[SCVI_MAIN_ON] <= main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee);
		case main_On_r_Welcome : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_ON_R_WELCOME] == main_On_r_Welcome
			);
		case main_On_r_Heating_Up : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_ON_R_HEATING_UP] == main_On_r_Heating_Up
			);
		case main_On_r_Wait_For_Choice : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_ON_R_WAIT_FOR_CHOICE] == main_On_r_Wait_For_Choice
			);
		case main_On_r_Save_Energy : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_ON_R_SAVE_ENERGY] == main_On_r_Save_Energy
			);
		case main_On_r_Process_Recipe : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_ON_R_PROCESS_RECIPE] >= main_On_r_Process_Recipe
				&& stateConfVector[SCVI_MAIN_ON_R_PROCESS_RECIPE] <= main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee);
		case main_On_r_Process_Recipe_r_Make_Milk : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_MILK] >= main_On_r_Process_Recipe_r_Make_Milk
				&& stateConfVector[SCVI_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_MILK] <= main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam);
		case main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_MILK_R_MAKE_STEAM] == main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam
			);
		case main_On_r_Process_Recipe_r_Make_Coffee : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_COFFEE] >= main_On_r_Process_Recipe_r_Make_Coffee
				&& stateConfVector[SCVI_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_COFFEE] <= main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee);
		case main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_COFFEE_R_MILLING_BEANS] == main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans
			);
		case main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_COFFEE_R_BREW_COFFEE] == main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee
			);
		default: return false;
	}
}

CoffeeMachineCpp::DefaultSCI* CoffeeMachineCpp::getDefaultSCI()
{
	return &iface;
}
/* Functions for event userEvent in interface DefaultSCI */
void CoffeeMachineCpp::DefaultSCI::raise_userEvent(UserEvents value)
{
	userEvent_value = value;
	userEvent_raised = true;
}
void CoffeeMachineCpp::raise_userEvent(UserEvents value)
{
	iface.raise_userEvent(value);
}
Coffee_Machine CoffeeMachineCpp::InternalSCI::get_cm() const
{
	return cm;
}

void CoffeeMachineCpp::InternalSCI::set_cm(Coffee_Machine value)
{
	cm = value;
}

CM_HMI CoffeeMachineCpp::InternalSCI::get_hmi() const
{
	return hmi;
}

void CoffeeMachineCpp::InternalSCI::set_hmi(CM_HMI value)
{
	hmi = value;
}

Coffee_Machine::cm_recipe_t CoffeeMachineCpp::InternalSCI::get_recipe() const
{
	return recipe;
}

void CoffeeMachineCpp::InternalSCI::set_recipe(Coffee_Machine::cm_recipe_t value)
{
	recipe = value;
}

UserEvents CoffeeMachineCpp::InternalSCI::get_lastChoice() const
{
	return lastChoice;
}

void CoffeeMachineCpp::InternalSCI::set_lastChoice(UserEvents value)
{
	lastChoice = value;
}

sc_boolean CoffeeMachineCpp::InternalSCI::get_processing() const
{
	return processing;
}

void CoffeeMachineCpp::InternalSCI::set_processing(sc_boolean value)
{
	processing = value;
}

UserEvents CoffeeMachineCpp::InternalSCI::get_userInput() const
{
	return userInput;
}

void CoffeeMachineCpp::InternalSCI::set_userInput(UserEvents value)
{
	userInput = value;
}


// implementations of all internal functions

sc_boolean CoffeeMachineCpp::check__lr0()
{
	return true;
}

sc_boolean CoffeeMachineCpp::check__lr1()
{
	return iface.userEvent_raised;
}

sc_boolean CoffeeMachineCpp::check__lr2()
{
	return timeEvents[4];
}

sc_boolean CoffeeMachineCpp::check__lr3()
{
	return (timeEvents[5]) && (ifaceInternalSCI.processing);
}

sc_boolean CoffeeMachineCpp::check_main_Off_tr0_tr0()
{
	return ifaceInternalSCI.userInput == ON_OFF;
}

sc_boolean CoffeeMachineCpp::check_main_On_tr0_tr0()
{
	return ifaceInternalSCI.userInput == ON_OFF;
}

sc_boolean CoffeeMachineCpp::check_main_On_r_Welcome_tr0_tr0()
{
	return true;
}

sc_boolean CoffeeMachineCpp::check_main_On_r_Heating_Up_tr0_tr0()
{
	return ifaceInternalSCI.cm.heater.temp >= 95;
}

sc_boolean CoffeeMachineCpp::check_main_On_r_Wait_For_Choice_tr0_tr0()
{
	return timeEvents[0];
}

sc_boolean CoffeeMachineCpp::check_main_On_r_Wait_For_Choice_tr1_tr1()
{
	return COFFEE <= ifaceInternalSCI.userInput && ifaceInternalSCI.userInput <= MILK;
}

sc_boolean CoffeeMachineCpp::check_main_On_r_Save_Energy_tr0_tr0()
{
	return ifaceInternalSCI.userInput != NONE;
}

sc_boolean CoffeeMachineCpp::check_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tr0_tr0()
{
	return timeEvents[1];
}

sc_boolean CoffeeMachineCpp::check_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tr0_tr0()
{
	return timeEvents[2];
}

sc_boolean CoffeeMachineCpp::check_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tr0_tr0()
{
	return timeEvents[3];
}

sc_boolean CoffeeMachineCpp::check_main_On_r_Process_Recipe_r__choice_0_tr0_tr0()
{
	return ifaceInternalSCI.recipe.milk_volume > 0 && ifaceInternalSCI.recipe.milk_first;
}

sc_boolean CoffeeMachineCpp::check_main_On_r_Process_Recipe_r__choice_0_tr1_tr1()
{
	return true;
}

sc_boolean CoffeeMachineCpp::check_main_On_r_Process_Recipe_r__choice_1_tr0_tr0()
{
	return (!ifaceInternalSCI.recipe.milk_first) && ifaceInternalSCI.recipe.milk_volume > 0;
}

sc_boolean CoffeeMachineCpp::check_main_On_r_Process_Recipe_r__choice_1_tr1_tr1()
{
	return true;
}

sc_boolean CoffeeMachineCpp::check_main_On_r_Process_Recipe_r__choice_2_tr0_tr0()
{
	return ifaceInternalSCI.recipe.milk_first && ifaceInternalSCI.recipe.coffee_mass > 0;
}

sc_boolean CoffeeMachineCpp::check_main_On_r_Process_Recipe_r__choice_2_tr1_tr1()
{
	return true;
}

void CoffeeMachineCpp::effect__lr0()
{
	ifaceInternalSCI.userInput = NONE;
}

void CoffeeMachineCpp::effect__lr1()
{
	ifaceInternalSCI.userInput = iface.userEvent_value;
}

void CoffeeMachineCpp::effect__lr2()
{
	ifaceInternalSCI.cm.updateHeating(2);
}

void CoffeeMachineCpp::effect__lr3()
{
	ifaceInternalSCI.hmi.show((sc_string) ".");
}

void CoffeeMachineCpp::effect_main_Off_tr0()
{
	exseq_main_Off();
	enseq_main_On_default();
}

void CoffeeMachineCpp::effect_main_On_tr0()
{
	exseq_main_On();
	enseq_main_Off_default();
}

void CoffeeMachineCpp::effect_main_On_r_Welcome_tr0()
{
	exseq_main_On_r_Welcome();
	enseq_main_On_r_Heating_Up_default();
}

void CoffeeMachineCpp::effect_main_On_r_Heating_Up_tr0()
{
	exseq_main_On_r_Heating_Up();
	enseq_main_On_r_Wait_For_Choice_default();
}

void CoffeeMachineCpp::effect_main_On_r_Wait_For_Choice_tr0()
{
	exseq_main_On_r_Wait_For_Choice();
	enseq_main_On_r_Save_Energy_default();
}

void CoffeeMachineCpp::effect_main_On_r_Wait_For_Choice_tr1()
{
	exseq_main_On_r_Wait_For_Choice();
	ifaceInternalSCI.recipe = ifaceInternalSCI.cm.get_recipe(ifaceInternalSCI.userInput);
	enact_main_On_r_Process_Recipe();
	react_main_On_r_Process_Recipe_r__choice_0();
}

void CoffeeMachineCpp::effect_main_On_r_Save_Energy_tr0()
{
	exseq_main_On_r_Save_Energy();
	enseq_main_On_r_Heating_Up_default();
}

void CoffeeMachineCpp::effect_main_On_r_Process_Recipe_tr0()
{
	exseq_main_On_r_Process_Recipe();
	ifaceInternalSCI.hmi.showDone(ifaceInternalSCI.lastChoice);
	enseq_main_On_r_Wait_For_Choice_default();
}

void CoffeeMachineCpp::effect_main_On_r_Process_Recipe_r_Make_Milk_tr0()
{
	exseq_main_On_r_Process_Recipe_r_Make_Milk();
	react_main_On_r_Process_Recipe_r__choice_2();
}

void CoffeeMachineCpp::effect_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tr0()
{
	exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam();
	react_main_On_r_Process_Recipe_r_Make_Milk_r_done();
}

void CoffeeMachineCpp::effect_main_On_r_Process_Recipe_r_Make_Coffee_tr0()
{
	exseq_main_On_r_Process_Recipe_r_Make_Coffee();
	react_main_On_r_Process_Recipe_r__choice_1();
}

void CoffeeMachineCpp::effect_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tr0()
{
	exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans();
	enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_default();
}

void CoffeeMachineCpp::effect_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tr0()
{
	exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee();
	react_main_On_r_Process_Recipe_r_Make_Coffee_r_done();
}

void CoffeeMachineCpp::effect_main_On_r_Process_Recipe_r__choice_0_tr0()
{
	enseq_main_On_r_Process_Recipe_r_Make_Milk_default();
}

void CoffeeMachineCpp::effect_main_On_r_Process_Recipe_r__choice_0_tr1()
{
	enseq_main_On_r_Process_Recipe_r_Make_Coffee_default();
}

void CoffeeMachineCpp::effect_main_On_r_Process_Recipe_r__choice_1_tr0()
{
	enseq_main_On_r_Process_Recipe_r_Make_Milk_default();
}

void CoffeeMachineCpp::effect_main_On_r_Process_Recipe_r__choice_1_tr1()
{
	react_main_On_r_Process_Recipe_r_done();
}

void CoffeeMachineCpp::effect_main_On_r_Process_Recipe_r__choice_2_tr0()
{
	enseq_main_On_r_Process_Recipe_r_Make_Coffee_default();
}

void CoffeeMachineCpp::effect_main_On_r_Process_Recipe_r__choice_2_tr1()
{
	react_main_On_r_Process_Recipe_r_done();
}

/* Entry action for statechart 'CoffeeMachineCpp'. */
void CoffeeMachineCpp::enact()
{
	/* Entry action for statechart 'CoffeeMachineCpp'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[4]), 200, true);
	timer->setTimer(this, (sc_eventid)(&timeEvents[5]), 500, true);
}

/* Entry action for state 'Off'. */
void CoffeeMachineCpp::enact_main_Off()
{
	/* Entry action for state 'Off'. */
	ifaceInternalSCI.cm.stopHeating();
}

/* Entry action for state 'Welcome'. */
void CoffeeMachineCpp::enact_main_On_r_Welcome()
{
	/* Entry action for state 'Welcome'. */
	ifaceInternalSCI.hmi.show((sc_string) "** Welcome to YAKINDU Coffee Maker **\n");
}

/* Entry action for state 'Heating Up'. */
void CoffeeMachineCpp::enact_main_On_r_Heating_Up()
{
	/* Entry action for state 'Heating Up'. */
	ifaceInternalSCI.cm.startHeating();
	ifaceInternalSCI.hmi.show((sc_string) "* heating");
	ifaceInternalSCI.processing = true;
}

/* Entry action for state 'Wait For Choice'. */
void CoffeeMachineCpp::enact_main_On_r_Wait_For_Choice()
{
	/* Entry action for state 'Wait For Choice'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[0]), 30 * 1000, false);
	ifaceInternalSCI.hmi.show((sc_string) "\n* choose:\n");
	ifaceInternalSCI.hmi.show((sc_string) "(1) coffee\n");
	ifaceInternalSCI.hmi.show((sc_string) "(2) espresso\n");
	ifaceInternalSCI.hmi.show((sc_string) "(3) cappucino\n");
	ifaceInternalSCI.hmi.show((sc_string) "(4) latte macchiato\n");
	ifaceInternalSCI.hmi.show((sc_string) "(5) milk\n");
}

/* Entry action for state 'Save Energy'. */
void CoffeeMachineCpp::enact_main_On_r_Save_Energy()
{
	/* Entry action for state 'Save Energy'. */
	ifaceInternalSCI.cm.stopHeating();
	ifaceInternalSCI.hmi.show((sc_string) "\n* save energy - continue with any command ...\n");
}

/* Entry action for state 'Process Recipe'. */
void CoffeeMachineCpp::enact_main_On_r_Process_Recipe()
{
	/* Entry action for state 'Process Recipe'. */
	ifaceInternalSCI.hmi.showPrepare(ifaceInternalSCI.userInput);
	ifaceInternalSCI.lastChoice = ifaceInternalSCI.userInput;
	ifaceInternalSCI.processing = true;
}

/* Entry action for state 'Make Steam'. */
void CoffeeMachineCpp::enact_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam()
{
	/* Entry action for state 'Make Steam'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[1]), ifaceInternalSCI.recipe.milk_volume * 60, false);
}

/* Entry action for state 'Milling Beans'. */
void CoffeeMachineCpp::enact_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans()
{
	/* Entry action for state 'Milling Beans'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[2]), ifaceInternalSCI.recipe.coffee_mass * 1000, false);
	ifaceInternalSCI.cm.startMilling();
}

/* Entry action for state 'Brew Coffee'. */
void CoffeeMachineCpp::enact_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee()
{
	/* Entry action for state 'Brew Coffee'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[3]), ifaceInternalSCI.recipe.water_volume * 60, false);
	ifaceInternalSCI.cm.startPumping();
}

/* Exit action for state 'CoffeeMachineCpp'. */
void CoffeeMachineCpp::exact()
{
	/* Exit action for state 'CoffeeMachineCpp'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[4]));
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[5]));
}

/* Exit action for state 'Heating Up'. */
void CoffeeMachineCpp::exact_main_On_r_Heating_Up()
{
	/* Exit action for state 'Heating Up'. */
	ifaceInternalSCI.processing = false;
}

/* Exit action for state 'Wait For Choice'. */
void CoffeeMachineCpp::exact_main_On_r_Wait_For_Choice()
{
	/* Exit action for state 'Wait For Choice'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[0]));
}

/* Exit action for state 'Process Recipe'. */
void CoffeeMachineCpp::exact_main_On_r_Process_Recipe()
{
	/* Exit action for state 'Process Recipe'. */
	ifaceInternalSCI.processing = false;
}

/* Exit action for state 'Make Steam'. */
void CoffeeMachineCpp::exact_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam()
{
	/* Exit action for state 'Make Steam'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[1]));
}

/* Exit action for state 'Milling Beans'. */
void CoffeeMachineCpp::exact_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans()
{
	/* Exit action for state 'Milling Beans'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[2]));
	ifaceInternalSCI.cm.stopMilling();
}

/* Exit action for state 'Brew Coffee'. */
void CoffeeMachineCpp::exact_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee()
{
	/* Exit action for state 'Brew Coffee'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[3]));
	ifaceInternalSCI.cm.stopPumping();
}

/* 'default' enter sequence for state Off */
void CoffeeMachineCpp::enseq_main_Off_default()
{
	/* 'default' enter sequence for state Off */
	enact_main_Off();
	stateConfVector[0] = main_Off;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state On */
void CoffeeMachineCpp::enseq_main_On_default()
{
	/* 'default' enter sequence for state On */
	enseq_main_On_r_default();
}

/* 'default' enter sequence for state Welcome */
void CoffeeMachineCpp::enseq_main_On_r_Welcome_default()
{
	/* 'default' enter sequence for state Welcome */
	enact_main_On_r_Welcome();
	stateConfVector[0] = main_On_r_Welcome;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Heating Up */
void CoffeeMachineCpp::enseq_main_On_r_Heating_Up_default()
{
	/* 'default' enter sequence for state Heating Up */
	enact_main_On_r_Heating_Up();
	stateConfVector[0] = main_On_r_Heating_Up;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Wait For Choice */
void CoffeeMachineCpp::enseq_main_On_r_Wait_For_Choice_default()
{
	/* 'default' enter sequence for state Wait For Choice */
	enact_main_On_r_Wait_For_Choice();
	stateConfVector[0] = main_On_r_Wait_For_Choice;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Save Energy */
void CoffeeMachineCpp::enseq_main_On_r_Save_Energy_default()
{
	/* 'default' enter sequence for state Save Energy */
	enact_main_On_r_Save_Energy();
	stateConfVector[0] = main_On_r_Save_Energy;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Make Milk */
void CoffeeMachineCpp::enseq_main_On_r_Process_Recipe_r_Make_Milk_default()
{
	/* 'default' enter sequence for state Make Milk */
	enseq_main_On_r_Process_Recipe_r_Make_Milk_r_default();
}

/* 'default' enter sequence for state Make Steam */
void CoffeeMachineCpp::enseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_default()
{
	/* 'default' enter sequence for state Make Steam */
	enact_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam();
	stateConfVector[0] = main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Make Coffee */
void CoffeeMachineCpp::enseq_main_On_r_Process_Recipe_r_Make_Coffee_default()
{
	/* 'default' enter sequence for state Make Coffee */
	enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_default();
}

/* 'default' enter sequence for state Milling Beans */
void CoffeeMachineCpp::enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_default()
{
	/* 'default' enter sequence for state Milling Beans */
	enact_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans();
	stateConfVector[0] = main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Brew Coffee */
void CoffeeMachineCpp::enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_default()
{
	/* 'default' enter sequence for state Brew Coffee */
	enact_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee();
	stateConfVector[0] = main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for region main */
void CoffeeMachineCpp::enseq_main_default()
{
	/* 'default' enter sequence for region main */
	react_main__entry_Default();
}

/* 'default' enter sequence for region r */
void CoffeeMachineCpp::enseq_main_On_r_default()
{
	/* 'default' enter sequence for region r */
	react_main_On_r__entry_Default();
}

/* 'default' enter sequence for region r */
void CoffeeMachineCpp::enseq_main_On_r_Process_Recipe_r_Make_Milk_r_default()
{
	/* 'default' enter sequence for region r */
	react_main_On_r_Process_Recipe_r_Make_Milk_r__entry_Default();
}

/* 'default' enter sequence for region r */
void CoffeeMachineCpp::enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_default()
{
	/* 'default' enter sequence for region r */
	react_main_On_r_Process_Recipe_r_Make_Coffee_r__entry_Default();
}

/* Default exit sequence for state Off */
void CoffeeMachineCpp::exseq_main_Off()
{
	/* Default exit sequence for state Off */
	stateConfVector[0] = CoffeeMachineCpp_last_state;
	stateConfVectorPosition = 0;
}

/* Default exit sequence for state On */
void CoffeeMachineCpp::exseq_main_On()
{
	/* Default exit sequence for state On */
	exseq_main_On_r();
}

/* Default exit sequence for state Welcome */
void CoffeeMachineCpp::exseq_main_On_r_Welcome()
{
	/* Default exit sequence for state Welcome */
	stateConfVector[0] = CoffeeMachineCpp_last_state;
	stateConfVectorPosition = 0;
}

/* Default exit sequence for state Heating Up */
void CoffeeMachineCpp::exseq_main_On_r_Heating_Up()
{
	/* Default exit sequence for state Heating Up */
	stateConfVector[0] = CoffeeMachineCpp_last_state;
	stateConfVectorPosition = 0;
	exact_main_On_r_Heating_Up();
}

/* Default exit sequence for state Wait For Choice */
void CoffeeMachineCpp::exseq_main_On_r_Wait_For_Choice()
{
	/* Default exit sequence for state Wait For Choice */
	stateConfVector[0] = CoffeeMachineCpp_last_state;
	stateConfVectorPosition = 0;
	exact_main_On_r_Wait_For_Choice();
}

/* Default exit sequence for state Save Energy */
void CoffeeMachineCpp::exseq_main_On_r_Save_Energy()
{
	/* Default exit sequence for state Save Energy */
	stateConfVector[0] = CoffeeMachineCpp_last_state;
	stateConfVectorPosition = 0;
}

/* Default exit sequence for state Process Recipe */
void CoffeeMachineCpp::exseq_main_On_r_Process_Recipe()
{
	/* Default exit sequence for state Process Recipe */
	exseq_main_On_r_Process_Recipe_r();
	exact_main_On_r_Process_Recipe();
}

/* Default exit sequence for state Make Milk */
void CoffeeMachineCpp::exseq_main_On_r_Process_Recipe_r_Make_Milk()
{
	/* Default exit sequence for state Make Milk */
	exseq_main_On_r_Process_Recipe_r_Make_Milk_r();
}

/* Default exit sequence for state Make Steam */
void CoffeeMachineCpp::exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam()
{
	/* Default exit sequence for state Make Steam */
	stateConfVector[0] = CoffeeMachineCpp_last_state;
	stateConfVectorPosition = 0;
	exact_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam();
}

/* Default exit sequence for state Make Coffee */
void CoffeeMachineCpp::exseq_main_On_r_Process_Recipe_r_Make_Coffee()
{
	/* Default exit sequence for state Make Coffee */
	exseq_main_On_r_Process_Recipe_r_Make_Coffee_r();
}

/* Default exit sequence for state Milling Beans */
void CoffeeMachineCpp::exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans()
{
	/* Default exit sequence for state Milling Beans */
	stateConfVector[0] = CoffeeMachineCpp_last_state;
	stateConfVectorPosition = 0;
	exact_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans();
}

/* Default exit sequence for state Brew Coffee */
void CoffeeMachineCpp::exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee()
{
	/* Default exit sequence for state Brew Coffee */
	stateConfVector[0] = CoffeeMachineCpp_last_state;
	stateConfVectorPosition = 0;
	exact_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee();
}

/* Default exit sequence for region main */
void CoffeeMachineCpp::exseq_main()
{
	/* Default exit sequence for region main */
	/* Handle exit of all possible states (of CoffeeMachineCpp.main) at position 0... */
	switch(stateConfVector[ 0 ])
	{
		case main_Off :
		{
			exseq_main_Off();
			break;
		}
		case main_On_r_Welcome :
		{
			exseq_main_On_r_Welcome();
			break;
		}
		case main_On_r_Heating_Up :
		{
			exseq_main_On_r_Heating_Up();
			break;
		}
		case main_On_r_Wait_For_Choice :
		{
			exseq_main_On_r_Wait_For_Choice();
			break;
		}
		case main_On_r_Save_Energy :
		{
			exseq_main_On_r_Save_Energy();
			break;
		}
		case main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam();
			exact_main_On_r_Process_Recipe();
			break;
		}
		case main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans();
			exact_main_On_r_Process_Recipe();
			break;
		}
		case main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee();
			exact_main_On_r_Process_Recipe();
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
void CoffeeMachineCpp::exseq_main_On_r()
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of CoffeeMachineCpp.main.On.r) at position 0... */
	switch(stateConfVector[ 0 ])
	{
		case main_On_r_Welcome :
		{
			exseq_main_On_r_Welcome();
			break;
		}
		case main_On_r_Heating_Up :
		{
			exseq_main_On_r_Heating_Up();
			break;
		}
		case main_On_r_Wait_For_Choice :
		{
			exseq_main_On_r_Wait_For_Choice();
			break;
		}
		case main_On_r_Save_Energy :
		{
			exseq_main_On_r_Save_Energy();
			break;
		}
		case main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam();
			exact_main_On_r_Process_Recipe();
			break;
		}
		case main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans();
			exact_main_On_r_Process_Recipe();
			break;
		}
		case main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee();
			exact_main_On_r_Process_Recipe();
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
void CoffeeMachineCpp::exseq_main_On_r_Process_Recipe_r()
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of CoffeeMachineCpp.main.On.r.Process_Recipe.r) at position 0... */
	switch(stateConfVector[ 0 ])
	{
		case main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam();
			break;
		}
		case main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans();
			break;
		}
		case main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee();
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
void CoffeeMachineCpp::exseq_main_On_r_Process_Recipe_r_Make_Milk_r()
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of CoffeeMachineCpp.main.On.r.Process_Recipe.r.Make_Milk.r) at position 0... */
	switch(stateConfVector[ 0 ])
	{
		case main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam();
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
void CoffeeMachineCpp::exseq_main_On_r_Process_Recipe_r_Make_Coffee_r()
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of CoffeeMachineCpp.main.On.r.Process_Recipe.r.Make_Coffee.r) at position 0... */
	switch(stateConfVector[ 0 ])
	{
		case main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans();
			break;
		}
		case main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee :
		{
			exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee();
			break;
		}
		default: break;
	}
}

/* The reactions of state Off. */
void CoffeeMachineCpp::react_main_Off()
{
	/* The reactions of state Off. */
	effect__lr0();
	if (check__lr1())
	{ 
		effect__lr1();
	} 
	if (check__lr2())
	{ 
		effect__lr2();
	} 
	if (check__lr3())
	{ 
		effect__lr3();
	} 
	if (check_main_Off_tr0_tr0())
	{ 
		effect_main_Off_tr0();
	} 
}

/* The reactions of state Welcome. */
void CoffeeMachineCpp::react_main_On_r_Welcome()
{
	/* The reactions of state Welcome. */
	effect__lr0();
	if (check__lr1())
	{ 
		effect__lr1();
	} 
	if (check__lr2())
	{ 
		effect__lr2();
	} 
	if (check__lr3())
	{ 
		effect__lr3();
	} 
	if (check_main_On_tr0_tr0())
	{ 
		effect_main_On_tr0();
	}  else
	{
		effect_main_On_r_Welcome_tr0();
	}
}

/* The reactions of state Heating Up. */
void CoffeeMachineCpp::react_main_On_r_Heating_Up()
{
	/* The reactions of state Heating Up. */
	effect__lr0();
	if (check__lr1())
	{ 
		effect__lr1();
	} 
	if (check__lr2())
	{ 
		effect__lr2();
	} 
	if (check__lr3())
	{ 
		effect__lr3();
	} 
	if (check_main_On_tr0_tr0())
	{ 
		effect_main_On_tr0();
	}  else
	{
		if (check_main_On_r_Heating_Up_tr0_tr0())
		{ 
			effect_main_On_r_Heating_Up_tr0();
		} 
	}
}

/* The reactions of state Wait For Choice. */
void CoffeeMachineCpp::react_main_On_r_Wait_For_Choice()
{
	/* The reactions of state Wait For Choice. */
	effect__lr0();
	if (check__lr1())
	{ 
		effect__lr1();
	} 
	if (check__lr2())
	{ 
		effect__lr2();
	} 
	if (check__lr3())
	{ 
		effect__lr3();
	} 
	if (check_main_On_tr0_tr0())
	{ 
		effect_main_On_tr0();
	}  else
	{
		if (check_main_On_r_Wait_For_Choice_tr0_tr0())
		{ 
			effect_main_On_r_Wait_For_Choice_tr0();
		}  else
		{
			if (check_main_On_r_Wait_For_Choice_tr1_tr1())
			{ 
				effect_main_On_r_Wait_For_Choice_tr1();
			} 
		}
	}
}

/* The reactions of state Save Energy. */
void CoffeeMachineCpp::react_main_On_r_Save_Energy()
{
	/* The reactions of state Save Energy. */
	effect__lr0();
	if (check__lr1())
	{ 
		effect__lr1();
	} 
	if (check__lr2())
	{ 
		effect__lr2();
	} 
	if (check__lr3())
	{ 
		effect__lr3();
	} 
	if (check_main_On_tr0_tr0())
	{ 
		effect_main_On_tr0();
	}  else
	{
		if (check_main_On_r_Save_Energy_tr0_tr0())
		{ 
			effect_main_On_r_Save_Energy_tr0();
		} 
	}
}

/* The reactions of state Make Steam. */
void CoffeeMachineCpp::react_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam()
{
	/* The reactions of state Make Steam. */
	effect__lr0();
	if (check__lr1())
	{ 
		effect__lr1();
	} 
	if (check__lr2())
	{ 
		effect__lr2();
	} 
	if (check__lr3())
	{ 
		effect__lr3();
	} 
	if (check_main_On_tr0_tr0())
	{ 
		effect_main_On_tr0();
	}  else
	{
		if (check_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tr0_tr0())
		{ 
			effect_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tr0();
		} 
	}
}

/* The reactions of state Milling Beans. */
void CoffeeMachineCpp::react_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans()
{
	/* The reactions of state Milling Beans. */
	effect__lr0();
	if (check__lr1())
	{ 
		effect__lr1();
	} 
	if (check__lr2())
	{ 
		effect__lr2();
	} 
	if (check__lr3())
	{ 
		effect__lr3();
	} 
	if (check_main_On_tr0_tr0())
	{ 
		effect_main_On_tr0();
	}  else
	{
		if (check_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tr0_tr0())
		{ 
			effect_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tr0();
		} 
	}
}

/* The reactions of state Brew Coffee. */
void CoffeeMachineCpp::react_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee()
{
	/* The reactions of state Brew Coffee. */
	effect__lr0();
	if (check__lr1())
	{ 
		effect__lr1();
	} 
	if (check__lr2())
	{ 
		effect__lr2();
	} 
	if (check__lr3())
	{ 
		effect__lr3();
	} 
	if (check_main_On_tr0_tr0())
	{ 
		effect_main_On_tr0();
	}  else
	{
		if (check_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tr0_tr0())
		{ 
			effect_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tr0();
		} 
	}
}

/* The reactions of state null. */
void CoffeeMachineCpp::react_main_On_r_Process_Recipe_r__choice_0()
{
	/* The reactions of state null. */
	if (check_main_On_r_Process_Recipe_r__choice_0_tr0_tr0())
	{ 
		effect_main_On_r_Process_Recipe_r__choice_0_tr0();
	}  else
	{
		effect_main_On_r_Process_Recipe_r__choice_0_tr1();
	}
}

/* The reactions of state null. */
void CoffeeMachineCpp::react_main_On_r_Process_Recipe_r__choice_1()
{
	/* The reactions of state null. */
	if (check_main_On_r_Process_Recipe_r__choice_1_tr0_tr0())
	{ 
		effect_main_On_r_Process_Recipe_r__choice_1_tr0();
	}  else
	{
		effect_main_On_r_Process_Recipe_r__choice_1_tr1();
	}
}

/* The reactions of state null. */
void CoffeeMachineCpp::react_main_On_r_Process_Recipe_r__choice_2()
{
	/* The reactions of state null. */
	if (check_main_On_r_Process_Recipe_r__choice_2_tr0_tr0())
	{ 
		effect_main_On_r_Process_Recipe_r__choice_2_tr0();
	}  else
	{
		effect_main_On_r_Process_Recipe_r__choice_2_tr1();
	}
}

/* Default react sequence for initial entry  */
void CoffeeMachineCpp::react_main__entry_Default()
{
	/* Default react sequence for initial entry  */
	enseq_main_Off_default();
}

/* Default react sequence for initial entry  */
void CoffeeMachineCpp::react_main_On_r__entry_Default()
{
	/* Default react sequence for initial entry  */
	enseq_main_On_r_Welcome_default();
}

/* Default react sequence for initial entry  */
void CoffeeMachineCpp::react_main_On_r_Process_Recipe_r_Make_Milk_r__entry_Default()
{
	/* Default react sequence for initial entry  */
	enseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_default();
}

/* Default react sequence for initial entry  */
void CoffeeMachineCpp::react_main_On_r_Process_Recipe_r_Make_Coffee_r__entry_Default()
{
	/* Default react sequence for initial entry  */
	enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_default();
}

/* The reactions of exit done. */
void CoffeeMachineCpp::react_main_On_r_Process_Recipe_r_Make_Milk_r_done()
{
	/* The reactions of exit done. */
	effect_main_On_r_Process_Recipe_r_Make_Milk_tr0();
}

/* The reactions of exit done. */
void CoffeeMachineCpp::react_main_On_r_Process_Recipe_r_done()
{
	/* The reactions of exit done. */
	effect_main_On_r_Process_Recipe_tr0();
}

/* The reactions of exit done. */
void CoffeeMachineCpp::react_main_On_r_Process_Recipe_r_Make_Coffee_r_done()
{
	/* The reactions of exit done. */
	effect_main_On_r_Process_Recipe_r_Make_Coffee_tr0();
}



