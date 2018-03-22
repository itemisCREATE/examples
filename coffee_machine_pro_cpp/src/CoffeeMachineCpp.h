
#ifndef COFFEEMACHINECPP_H_
#define COFFEEMACHINECPP_H_

#include "sc\sc_types.h"
#include "sc\StatemachineInterface.h"
#include "sc\TimedStatemachineInterface.h"
#include "CoffeeMachine.hpp"
#include "CMHMI.hpp"

/*! \file Header of the state machine 'CoffeeMachineCpp'.
*/


/*! Define indices of states in the StateConfVector */
#define SCVI_MAIN_OFF 0
#define SCVI_MAIN_ON 0
#define SCVI_MAIN_ON_R_WELCOME 0
#define SCVI_MAIN_ON_R_HEATING_UP 0
#define SCVI_MAIN_ON_R_WAIT_FOR_CHOICE 0
#define SCVI_MAIN_ON_R_SAVE_ENERGY 0
#define SCVI_MAIN_ON_R_PROCESS_RECIPE 0
#define SCVI_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_MILK 0
#define SCVI_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_MILK_R_MAKE_STEAM 0
#define SCVI_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_COFFEE 0
#define SCVI_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_COFFEE_R_MILLING_BEANS 0
#define SCVI_MAIN_ON_R_PROCESS_RECIPE_R_MAKE_COFFEE_R_BREW_COFFEE 0

class CoffeeMachineCpp : public TimedStatemachineInterface, public StatemachineInterface
{
	public:
		
		CoffeeMachineCpp();
		
		~CoffeeMachineCpp();
		
		/*! Enumeration of all states */ 
		typedef enum
		{
			CoffeeMachineCpp_last_state,
			main_Off,
			main_On,
			main_On_r_Welcome,
			main_On_r_Heating_Up,
			main_On_r_Wait_For_Choice,
			main_On_r_Save_Energy,
			main_On_r_Process_Recipe,
			main_On_r_Process_Recipe_r_Make_Milk,
			main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam,
			main_On_r_Process_Recipe_r_Make_Coffee,
			main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans,
			main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee
		} CoffeeMachineCppStates;
		
		//! Inner class for default interface scope.
		class DefaultSCI
		{
			
			public:
				/*! Raises the in event 'userEvent' that is defined in the default interface scope. */
				void raise_userEvent(UserEvents value);
				
				
			private:
				friend class CoffeeMachineCpp;
				sc_boolean userEvent_raised;
				UserEvents userEvent_value;
		};
		
		/*! Returns an instance of the interface class 'DefaultSCI'. */
		DefaultSCI* getDefaultSCI();
		
		/*! Raises the in event 'userEvent' that is defined in the default interface scope. */
		void raise_userEvent(UserEvents value);
		
		
		/*
		 * Functions inherited from StatemachineInterface
		 */
		virtual void init();
		
		virtual void enter();
		
		virtual void exit();
		
		virtual void runCycle();
		
		/*!
		* Checks if the state machine is active (until 2.4.1 this method was used for states).
		* A state machine is active if it has been entered. It is inactive if it has not been entered at all or if it has been exited.
		*/
		virtual sc_boolean isActive() const;
		
		
		/*!
		* Checks if all active states are final. 
		* If there are no active states then the state machine is considered being inactive. In this case this method returns false.
		*/
		virtual sc_boolean isFinal() const;
		
		/*
		 * Functions inherited from TimedStatemachineInterface
		 */
		virtual void setTimer(TimerInterface* timerInterface);
		
		virtual TimerInterface* getTimer();
		
		virtual void raiseTimeEvent(sc_eventid event);
		
		/*! Checks if the specified state is active (until 2.4.1 the used method for states was calles isActive()). */
		sc_boolean isStateActive(CoffeeMachineCppStates state) const;
		
		//! number of time events used by the state machine.
		static const sc_integer timeEventsCount = 6;
		
		//! number of time events that can be active at once.
		static const sc_integer parallelTimeEventsCount = 3;
		
	private:
	
		CoffeeMachineCpp(const CoffeeMachineCpp &rhs);
		
		CoffeeMachineCpp& operator=(const CoffeeMachineCpp&);
	
		//! Inner class for internal interface scope.
		class InternalSCI
		{
			
			public:
				/*! Gets the value of the variable 'cm' that is defined in the internal scope. */
				Coffee_Machine get_cm() const;
				
				/*! Sets the value of the variable 'cm' that is defined in the internal scope. */
				void set_cm(Coffee_Machine value);
				
				/*! Gets the value of the variable 'hmi' that is defined in the internal scope. */
				CM_HMI get_hmi() const;
				
				/*! Sets the value of the variable 'hmi' that is defined in the internal scope. */
				void set_hmi(CM_HMI value);
				
				/*! Gets the value of the variable 'recipe' that is defined in the internal scope. */
				Coffee_Machine::cm_recipe_t get_recipe() const;
				
				/*! Sets the value of the variable 'recipe' that is defined in the internal scope. */
				void set_recipe(Coffee_Machine::cm_recipe_t value);
				
				/*! Gets the value of the variable 'lastChoice' that is defined in the internal scope. */
				UserEvents get_lastChoice() const;
				
				/*! Sets the value of the variable 'lastChoice' that is defined in the internal scope. */
				void set_lastChoice(UserEvents value);
				
				/*! Gets the value of the variable 'processing' that is defined in the internal scope. */
				sc_boolean get_processing() const;
				
				/*! Sets the value of the variable 'processing' that is defined in the internal scope. */
				void set_processing(sc_boolean value);
				
				/*! Gets the value of the variable 'userInput' that is defined in the internal scope. */
				UserEvents get_userInput() const;
				
				/*! Sets the value of the variable 'userInput' that is defined in the internal scope. */
				void set_userInput(UserEvents value);
				
				
			private:
				friend class CoffeeMachineCpp;
				Coffee_Machine cm;
				CM_HMI hmi;
				Coffee_Machine::cm_recipe_t recipe;
				UserEvents lastChoice;
				sc_boolean processing;
				UserEvents userInput;
		};
	
		//! the maximum number of orthogonal states defines the dimension of the state configuration vector.
		static const sc_ushort maxOrthogonalStates = 1;
		
		TimerInterface* timer;
		sc_boolean timeEvents[timeEventsCount];
		
		CoffeeMachineCppStates stateConfVector[maxOrthogonalStates];
		
		sc_ushort stateConfVectorPosition;
		
		DefaultSCI iface;
		InternalSCI ifaceInternalSCI;
		
		// prototypes of all internal functions
		
		sc_boolean check__lr0();
		sc_boolean check__lr1();
		sc_boolean check__lr2();
		sc_boolean check__lr3();
		sc_boolean check_main_Off_tr0_tr0();
		sc_boolean check_main_On_tr0_tr0();
		sc_boolean check_main_On_r_Welcome_tr0_tr0();
		sc_boolean check_main_On_r_Heating_Up_tr0_tr0();
		sc_boolean check_main_On_r_Wait_For_Choice_tr0_tr0();
		sc_boolean check_main_On_r_Wait_For_Choice_tr1_tr1();
		sc_boolean check_main_On_r_Save_Energy_tr0_tr0();
		sc_boolean check_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tr0_tr0();
		sc_boolean check_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tr0_tr0();
		sc_boolean check_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tr0_tr0();
		sc_boolean check_main_On_r_Process_Recipe_r__choice_0_tr0_tr0();
		sc_boolean check_main_On_r_Process_Recipe_r__choice_0_tr1_tr1();
		sc_boolean check_main_On_r_Process_Recipe_r__choice_1_tr0_tr0();
		sc_boolean check_main_On_r_Process_Recipe_r__choice_1_tr1_tr1();
		sc_boolean check_main_On_r_Process_Recipe_r__choice_2_tr0_tr0();
		sc_boolean check_main_On_r_Process_Recipe_r__choice_2_tr1_tr1();
		void effect__lr0();
		void effect__lr1();
		void effect__lr2();
		void effect__lr3();
		void effect_main_Off_tr0();
		void effect_main_On_tr0();
		void effect_main_On_r_Welcome_tr0();
		void effect_main_On_r_Heating_Up_tr0();
		void effect_main_On_r_Wait_For_Choice_tr0();
		void effect_main_On_r_Wait_For_Choice_tr1();
		void effect_main_On_r_Save_Energy_tr0();
		void effect_main_On_r_Process_Recipe_tr0();
		void effect_main_On_r_Process_Recipe_r_Make_Milk_tr0();
		void effect_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_tr0();
		void effect_main_On_r_Process_Recipe_r_Make_Coffee_tr0();
		void effect_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_tr0();
		void effect_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_tr0();
		void effect_main_On_r_Process_Recipe_r__choice_0_tr0();
		void effect_main_On_r_Process_Recipe_r__choice_0_tr1();
		void effect_main_On_r_Process_Recipe_r__choice_1_tr0();
		void effect_main_On_r_Process_Recipe_r__choice_1_tr1();
		void effect_main_On_r_Process_Recipe_r__choice_2_tr0();
		void effect_main_On_r_Process_Recipe_r__choice_2_tr1();
		void enact();
		void enact_main_Off();
		void enact_main_On_r_Welcome();
		void enact_main_On_r_Heating_Up();
		void enact_main_On_r_Wait_For_Choice();
		void enact_main_On_r_Save_Energy();
		void enact_main_On_r_Process_Recipe();
		void enact_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam();
		void enact_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans();
		void enact_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee();
		void exact();
		void exact_main_On_r_Heating_Up();
		void exact_main_On_r_Wait_For_Choice();
		void exact_main_On_r_Process_Recipe();
		void exact_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam();
		void exact_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans();
		void exact_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee();
		void enseq_main_Off_default();
		void enseq_main_On_default();
		void enseq_main_On_r_Welcome_default();
		void enseq_main_On_r_Heating_Up_default();
		void enseq_main_On_r_Wait_For_Choice_default();
		void enseq_main_On_r_Save_Energy_default();
		void enseq_main_On_r_Process_Recipe_r_Make_Milk_default();
		void enseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam_default();
		void enseq_main_On_r_Process_Recipe_r_Make_Coffee_default();
		void enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans_default();
		void enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee_default();
		void enseq_main_default();
		void enseq_main_On_r_default();
		void enseq_main_On_r_Process_Recipe_r_Make_Milk_r_default();
		void enseq_main_On_r_Process_Recipe_r_Make_Coffee_r_default();
		void exseq_main_Off();
		void exseq_main_On();
		void exseq_main_On_r_Welcome();
		void exseq_main_On_r_Heating_Up();
		void exseq_main_On_r_Wait_For_Choice();
		void exseq_main_On_r_Save_Energy();
		void exseq_main_On_r_Process_Recipe();
		void exseq_main_On_r_Process_Recipe_r_Make_Milk();
		void exseq_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam();
		void exseq_main_On_r_Process_Recipe_r_Make_Coffee();
		void exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans();
		void exseq_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee();
		void exseq_main();
		void exseq_main_On_r();
		void exseq_main_On_r_Process_Recipe_r();
		void exseq_main_On_r_Process_Recipe_r_Make_Milk_r();
		void exseq_main_On_r_Process_Recipe_r_Make_Coffee_r();
		void react_main_Off();
		void react_main_On_r_Welcome();
		void react_main_On_r_Heating_Up();
		void react_main_On_r_Wait_For_Choice();
		void react_main_On_r_Save_Energy();
		void react_main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam();
		void react_main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans();
		void react_main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee();
		void react_main_On_r_Process_Recipe_r__choice_0();
		void react_main_On_r_Process_Recipe_r__choice_1();
		void react_main_On_r_Process_Recipe_r__choice_2();
		void react_main__entry_Default();
		void react_main_On_r__entry_Default();
		void react_main_On_r_Process_Recipe_r_Make_Milk_r__entry_Default();
		void react_main_On_r_Process_Recipe_r_Make_Coffee_r__entry_Default();
		void react_main_On_r_Process_Recipe_r_Make_Milk_r_done();
		void react_main_On_r_Process_Recipe_r_done();
		void react_main_On_r_Process_Recipe_r_Make_Coffee_r_done();
		void clearInEvents();
		void clearOutEvents();
		
		
};



#endif /* COFFEEMACHINECPP_H_ */
