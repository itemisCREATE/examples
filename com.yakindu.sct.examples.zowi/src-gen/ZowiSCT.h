
#ifndef ZOWISCT_H_
#define ZOWISCT_H_


#include "../Zowi/Zowi.h"
#include "../Zowi/Zowi_mouths.h"
#include "../Zowi/ZowiPinOut.h"
#include "../Zowi/Zowi_sounds.h"
#include "../src/sc_types.h"
#include "../src/StatemachineInterface.h"
#include "../src/TimedStatemachineInterface.h"

/*! \file Header of the state machine 'ZowiSCT'.
*/



/*! Define indices of states in the StateConfVector */
#define SCVI_MAIN_REGION_WELCOMEZOWI 0
#define SCVI_MAIN_REGION_AWAKE 0
#define SCVI_MAIN_REGION_AWAKE_WALKANDAVOIDOBSTACLES_WALKSTRAIGHT 0
#define SCVI_MAIN_REGION_AWAKE_WALKANDAVOIDOBSTACLES_WAITFORTURN 0
#define SCVI_MAIN_REGION_AWAKE_WALKANDAVOIDOBSTACLES_TURNLEFT 0
#define SCVI_MAIN_REGION_AWAKE_WALKANDAVOIDOBSTACLES_WAITFORWALKING 0
#define SCVI_MAIN_REGION_ISSOMEONEHERE_ 0
#define SCVI_MAIN_REGION_ISSOMEONEHERE__CHANGING_MOOD_SUPRISED 0
#define SCVI_MAIN_REGION_ISSOMEONEHERE__CHANGING_MOOD_SAD 0
#define SCVI_MAIN_REGION_OBSTACLEDETECTED 0
#define SCVI_MAIN_REGION_OBSTACLEDETECTED_REMOVETHEOBSTACLE_WALKBACK 0
#define SCVI_MAIN_REGION_OBSTACLEDETECTED_REMOVETHEOBSTACLE_WALKFORWARD 0

class ZowiSCT : public TimedStatemachineInterface, public StatemachineInterface
{
	public:
		ZowiSCT();
		
		~ZowiSCT();
		
		/*! Enumeration of all states */ 
		typedef enum
		{
			ZowiSCT_last_state,
			main_region_WelcomeZowi,
			main_region_Awake,
			main_region_Awake_walkAndAvoidObstacles_WalkStraight,
			main_region_Awake_walkAndAvoidObstacles_WaitForTurn,
			main_region_Awake_walkAndAvoidObstacles_TurnLeft,
			main_region_Awake_walkAndAvoidObstacles_WaitForWalking,
			main_region_IsSomeOneHere_,
			main_region_IsSomeOneHere__Changing_mood_Suprised,
			main_region_IsSomeOneHere__Changing_mood_Sad,
			main_region_ObstacleDetected,
			main_region_ObstacleDetected_RemoveTheObstacle_WalkBack,
			main_region_ObstacleDetected_RemoveTheObstacle_WalkForward
		} ZowiSCTStates;
		
		static const sc_integer numStates = 12;
		
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
				
				/*! Gets the value of the variable 'roundCounter' that is defined in the default interface scope. */
				uint32_t get_roundCounter() const;
				
				/*! Sets the value of the variable 'roundCounter' that is defined in the default interface scope. */
				void set_roundCounter(uint32_t value);
				
				/*! Gets the value of the variable 'maxRounds' that is defined in the default interface scope. */
				const int32_t get_maxRounds() const;
				
				
			private:
				friend class ZowiSCT;
				Zowi zowi;
				float distance;
				uint16_t noise;
				uint32_t roundCounter;
				static const int32_t maxRounds;
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
		
		/*! Gets the value of the variable 'roundCounter' that is defined in the default interface scope. */
		uint32_t get_roundCounter() const;
		
		/*! Sets the value of the variable 'roundCounter' that is defined in the default interface scope. */
		void set_roundCounter(uint32_t value);
		
		/*! Gets the value of the variable 'maxRounds' that is defined in the default interface scope. */
		const int32_t get_maxRounds() const;
		
		
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
		static const sc_integer timeEventsCount = 6;
		
		//! number of time events that can be active at once.
		static const sc_integer parallelTimeEventsCount = 1;
	protected:
	private:
		ZowiSCT(const ZowiSCT &rhs);
		ZowiSCT& operator=(const ZowiSCT&);
		
		
		//! the maximum number of orthogonal states defines the dimension of the state configuration vector.
		static const sc_ushort maxOrthogonalStates = 1;
		//! dimension of the state configuration vector for history states
		static const sc_ushort maxHistoryStates = 1;
		
		TimerInterface* timer;
		sc_boolean timeEvents[timeEventsCount];
		
		ZowiSCTStates stateConfVector[maxOrthogonalStates];
		
		ZowiSCTStates historyVector[maxHistoryStates];
		sc_ushort stateConfVectorPosition;
		
		DefaultSCI iface;
		
		// prototypes of all internal functions
		
		void enact_main_region_WelcomeZowi();
		void enact_main_region_Awake_walkAndAvoidObstacles_WalkStraight();
		void enact_main_region_Awake_walkAndAvoidObstacles_WaitForTurn();
		void enact_main_region_Awake_walkAndAvoidObstacles_TurnLeft();
		void enact_main_region_Awake_walkAndAvoidObstacles_WaitForWalking();
		void enact_main_region_IsSomeOneHere__Changing_mood_Suprised();
		void enact_main_region_IsSomeOneHere__Changing_mood_Sad();
		void enact_main_region_ObstacleDetected_RemoveTheObstacle_WalkBack();
		void enact_main_region_ObstacleDetected_RemoveTheObstacle_WalkForward();
		void exact_main_region_Awake();
		void exact_main_region_Awake_walkAndAvoidObstacles_WaitForTurn();
		void exact_main_region_Awake_walkAndAvoidObstacles_WaitForWalking();
		void exact_main_region_IsSomeOneHere__Changing_mood_Suprised();
		void exact_main_region_IsSomeOneHere__Changing_mood_Sad();
		void exact_main_region_ObstacleDetected_RemoveTheObstacle_WalkBack();
		void exact_main_region_ObstacleDetected_RemoveTheObstacle_WalkForward();
		void enseq_main_region_WelcomeZowi_default();
		void enseq_main_region_Awake_default();
		void enseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight_default();
		void enseq_main_region_Awake_walkAndAvoidObstacles_WaitForTurn_default();
		void enseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft_default();
		void enseq_main_region_Awake_walkAndAvoidObstacles_WaitForWalking_default();
		void enseq_main_region_IsSomeOneHere__default();
		void enseq_main_region_IsSomeOneHere__Changing_mood_Suprised_default();
		void enseq_main_region_IsSomeOneHere__Changing_mood_Sad_default();
		void enseq_main_region_ObstacleDetected_default();
		void enseq_main_region_ObstacleDetected_RemoveTheObstacle_WalkBack_default();
		void enseq_main_region_ObstacleDetected_RemoveTheObstacle_WalkForward_default();
		void enseq_main_region_default();
		void enseq_main_region_Awake_walkAndAvoidObstacles_default();
		void shenseq_main_region_Awake_walkAndAvoidObstacles();
		void enseq_main_region_IsSomeOneHere__Changing_mood_default();
		void enseq_main_region_ObstacleDetected_RemoveTheObstacle_default();
		void exseq_main_region_WelcomeZowi();
		void exseq_main_region_Awake();
		void exseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight();
		void exseq_main_region_Awake_walkAndAvoidObstacles_WaitForTurn();
		void exseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft();
		void exseq_main_region_Awake_walkAndAvoidObstacles_WaitForWalking();
		void exseq_main_region_IsSomeOneHere_();
		void exseq_main_region_IsSomeOneHere__Changing_mood_Suprised();
		void exseq_main_region_IsSomeOneHere__Changing_mood_Sad();
		void exseq_main_region_ObstacleDetected();
		void exseq_main_region_ObstacleDetected_RemoveTheObstacle_WalkBack();
		void exseq_main_region_ObstacleDetected_RemoveTheObstacle_WalkForward();
		void exseq_main_region();
		void exseq_main_region_Awake_walkAndAvoidObstacles();
		void exseq_main_region_IsSomeOneHere__Changing_mood();
		void exseq_main_region_ObstacleDetected_RemoveTheObstacle();
		void react_main_region__entry_Default();
		void react_main_region_Awake_walkAndAvoidObstacles__entry_Default();
		void react_main_region_IsSomeOneHere__Changing_mood__entry_Default();
		void react_main_region_ObstacleDetected_RemoveTheObstacle__entry_Default();
		sc_boolean react(const sc_boolean try_transition);
		sc_boolean main_region_WelcomeZowi_react(const sc_boolean try_transition);
		sc_boolean main_region_Awake_react(const sc_boolean try_transition);
		sc_boolean main_region_Awake_walkAndAvoidObstacles_WalkStraight_react(const sc_boolean try_transition);
		sc_boolean main_region_Awake_walkAndAvoidObstacles_WaitForTurn_react(const sc_boolean try_transition);
		sc_boolean main_region_Awake_walkAndAvoidObstacles_TurnLeft_react(const sc_boolean try_transition);
		sc_boolean main_region_Awake_walkAndAvoidObstacles_WaitForWalking_react(const sc_boolean try_transition);
		sc_boolean main_region_IsSomeOneHere__react(const sc_boolean try_transition);
		sc_boolean main_region_IsSomeOneHere__Changing_mood_Suprised_react(const sc_boolean try_transition);
		sc_boolean main_region_IsSomeOneHere__Changing_mood_Sad_react(const sc_boolean try_transition);
		sc_boolean main_region_ObstacleDetected_react(const sc_boolean try_transition);
		sc_boolean main_region_ObstacleDetected_RemoveTheObstacle_WalkBack_react(const sc_boolean try_transition);
		sc_boolean main_region_ObstacleDetected_RemoveTheObstacle_WalkForward_react(const sc_boolean try_transition);
		void clearInEvents();
		void clearOutEvents();
		
};




#endif /* ZOWISCT_H_ */
