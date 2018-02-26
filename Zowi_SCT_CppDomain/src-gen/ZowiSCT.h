
#ifndef ZOWISCT_H_
#define ZOWISCT_H_

#include "../src/sc_types.h"
#include "../src/StatemachineInterface.h"
#include "../src/TimedStatemachineInterface.h"
#include "../Zowi/ZowiPinOut.h"
#include "../Zowi/Zowi.h"
#include "../Zowi/Zowi_mouths.h"
#include "../Zowi/Zowi_sounds.h"

/*! \file Header of the state machine 'ZowiSCT'.
*/


/*! Define indices of states in the StateConfVector */
#define SCVI_MAIN_REGION_INIT 0
#define SCVI_MAIN_REGION_AWAKE 0
#define SCVI_MAIN_REGION_AWAKE_WALKANDAVOIDOBSTACLES_WELCOME 0
#define SCVI_MAIN_REGION_AWAKE_WALKANDAVOIDOBSTACLES_WALKSTRAIGHT 0
#define SCVI_MAIN_REGION_AWAKE_WALKANDAVOIDOBSTACLES_TURNLEFT 0
#define SCVI_MAIN_REGION_SLEEPING 0

class ZowiSCT : public TimedStatemachineInterface, public StatemachineInterface
{
	public:
		
		ZowiSCT();
		
		~ZowiSCT();
		
		/*! Enumeration of all states */ 
		typedef enum
		{
			ZowiSCT_last_state,
			main_region_Init,
			main_region_Awake,
			main_region_Awake_walkAndAvoidObstacles_Welcome,
			main_region_Awake_walkAndAvoidObstacles_WalkStraight,
			main_region_Awake_walkAndAvoidObstacles_TurnLeft,
			main_region_Sleeping
		} ZowiSCTStates;
		
		//! Inner class for default interface scope.
		class DefaultSCI
		{
			
			public:
				/*! Gets the value of the variable 'zowi' that is defined in the default interface scope. */
				Zowi get_zowi() const;
				
				/*! Sets the value of the variable 'zowi' that is defined in the default interface scope. */
				void set_zowi(Zowi value);
				
				/*! Gets the value of the variable 'distance' that is defined in the default interface scope. */
				float get_distance() const;
				
				/*! Sets the value of the variable 'distance' that is defined in the default interface scope. */
				void set_distance(float value);
				
				/*! Gets the value of the variable 'noise' that is defined in the default interface scope. */
				uint16_t get_noise() const;
				
				/*! Sets the value of the variable 'noise' that is defined in the default interface scope. */
				void set_noise(uint16_t value);
				
				/*! Gets the value of the variable 'steps' that is defined in the default interface scope. */
				const uint16_t get_steps() const;
				
				/*! Gets the value of the variable 'T' that is defined in the default interface scope. */
				const uint16_t get_t() const;
				
				
			private:
				friend class ZowiSCT;
				Zowi zowi;
				float distance;
				uint16_t noise;
				static const uint16_t steps;
				static const uint16_t T;
		};
		
		/*! Returns an instance of the interface class 'DefaultSCI'. */
		DefaultSCI* getDefaultSCI();
		
		/*! Gets the value of the variable 'zowi' that is defined in the default interface scope. */
		Zowi get_zowi() const;
		
		/*! Sets the value of the variable 'zowi' that is defined in the default interface scope. */
		void set_zowi(Zowi value);
		
		/*! Gets the value of the variable 'distance' that is defined in the default interface scope. */
		float get_distance() const;
		
		/*! Sets the value of the variable 'distance' that is defined in the default interface scope. */
		void set_distance(float value);
		
		/*! Gets the value of the variable 'noise' that is defined in the default interface scope. */
		uint16_t get_noise() const;
		
		/*! Sets the value of the variable 'noise' that is defined in the default interface scope. */
		void set_noise(uint16_t value);
		
		/*! Gets the value of the variable 'steps' that is defined in the default interface scope. */
		const uint16_t get_steps() const;
		
		/*! Gets the value of the variable 'T' that is defined in the default interface scope. */
		const uint16_t get_t() const;
		
		
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
		sc_boolean isStateActive(ZowiSCTStates state) const;
		
		//! number of time events used by the state machine.
		static const sc_integer timeEventsCount = 3;
		
		//! number of time events that can be active at once.
		static const sc_integer parallelTimeEventsCount = 2;
		
	private:
	
		ZowiSCT(const ZowiSCT &rhs);
		
		ZowiSCT& operator=(const ZowiSCT&);
	
	
		//! the maximum number of orthogonal states defines the dimension of the state configuration vector.
		static const sc_ushort maxOrthogonalStates = 1;
		
		TimerInterface* timer;
		sc_boolean timeEvents[timeEventsCount];
		
		ZowiSCTStates stateConfVector[maxOrthogonalStates];
		
		sc_ushort stateConfVectorPosition;
		
		DefaultSCI iface;
		
		// prototypes of all internal functions
		
		sc_boolean check_main_region_Init_tr0_tr0();
		sc_boolean check_main_region_Awake_tr0_tr0();
		sc_boolean check_main_region_Awake_walkAndAvoidObstacles_Welcome_tr0_tr0();
		sc_boolean check_main_region_Awake_walkAndAvoidObstacles_WalkStraight_tr0_tr0();
		sc_boolean check_main_region_Awake_walkAndAvoidObstacles_WalkStraight_tr1_tr1();
		sc_boolean check_main_region_Awake_walkAndAvoidObstacles_TurnLeft_tr0_tr0();
		sc_boolean check_main_region_Awake_walkAndAvoidObstacles_TurnLeft_tr1_tr1();
		sc_boolean check_main_region_Sleeping_tr0_tr0();
		void effect_main_region_Init_tr0();
		void effect_main_region_Awake_tr0();
		void effect_main_region_Awake_walkAndAvoidObstacles_Welcome_tr0();
		void effect_main_region_Awake_walkAndAvoidObstacles_WalkStraight_tr0();
		void effect_main_region_Awake_walkAndAvoidObstacles_WalkStraight_tr1();
		void effect_main_region_Awake_walkAndAvoidObstacles_TurnLeft_tr0();
		void effect_main_region_Awake_walkAndAvoidObstacles_TurnLeft_tr1();
		void effect_main_region_Sleeping_tr0();
		void enact_main_region_Init();
		void enact_main_region_Awake();
		void enact_main_region_Awake_walkAndAvoidObstacles_Welcome();
		void enact_main_region_Awake_walkAndAvoidObstacles_WalkStraight();
		void enact_main_region_Awake_walkAndAvoidObstacles_TurnLeft();
		void enact_main_region_Sleeping();
		void exact_main_region_Awake();
		void exact_main_region_Awake_walkAndAvoidObstacles_Welcome();
		void exact_main_region_Awake_walkAndAvoidObstacles_WalkStraight();
		void enseq_main_region_Init_default();
		void enseq_main_region_Awake_default();
		void enseq_main_region_Awake_walkAndAvoidObstacles_Welcome_default();
		void enseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight_default();
		void enseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft_default();
		void enseq_main_region_Sleeping_default();
		void enseq_main_region_default();
		void enseq_main_region_Awake_walkAndAvoidObstacles_default();
		void exseq_main_region_Init();
		void exseq_main_region_Awake();
		void exseq_main_region_Awake_walkAndAvoidObstacles_Welcome();
		void exseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight();
		void exseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft();
		void exseq_main_region_Sleeping();
		void exseq_main_region();
		void exseq_main_region_Awake_walkAndAvoidObstacles();
		void react_main_region_Init();
		void react_main_region_Awake_walkAndAvoidObstacles_Welcome();
		void react_main_region_Awake_walkAndAvoidObstacles_WalkStraight();
		void react_main_region_Awake_walkAndAvoidObstacles_TurnLeft();
		void react_main_region_Sleeping();
		void react_main_region__entry_Default();
		void react_main_region_Awake_walkAndAvoidObstacles__entry_Default();
		void clearInEvents();
		void clearOutEvents();
		
		
};



#endif /* ZOWISCT_H_ */
