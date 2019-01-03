
#ifndef TRAFFICLIGHTSTATEMACHINE_H_
#define TRAFFICLIGHTSTATEMACHINE_H_


#include <QObject>
#include "sc_types.h"
#include "StatemachineInterface.h"
#include "TimedStatemachineInterface.h"

/*! \file Header of the state machine 'TrafficLightStateMachine'.
*/




/*! Define indices of states in the StateConfVector */
#define SCVI_TRAFFICLIGHT_OPERATING 0
#define SCVI_TRAFFICLIGHT_OPERATING_R_PREPARE 0
#define SCVI_TRAFFICLIGHT_OPERATING_R_PREPARE_SWITCH_TO_GO 0
#define SCVI_TRAFFICLIGHT_OPERATING_R_PREPARE_SWITCH_TO_STOP 0
#define SCVI_TRAFFICLIGHT_OPERATING_R_STOP 0
#define SCVI_TRAFFICLIGHT_OPERATING_R_GO 0
#define SCVI_TRAFFICLIGHT_STANDBY 0
#define SCVI_TRAFFICLIGHT_STANDBY_BLINK_ON 0
#define SCVI_TRAFFICLIGHT_STANDBY_BLINK_OFF 0

class TrafficLightStateMachine : public QObject, public TimedStatemachineInterface, public StatemachineInterface
{
	Q_OBJECT

	public:
		TrafficLightStateMachine(QObject* parent);
		~TrafficLightStateMachine();
		
		/*! Enumeration of all states */ 
		typedef enum
		{
			TrafficLightStateMachine_last_state,
			trafficlight_operating,
			trafficlight_operating_r_prepare,
			trafficlight_operating_r_prepare_switch_to_go,
			trafficlight_operating_r_prepare_switch_to_stop,
			trafficlight_operating_r_stop,
			trafficlight_operating_r_go,
			trafficlight_standby,
			trafficlight_standby_blink_on,
			trafficlight_standby_blink_off
		} TrafficLightStateMachineStates;
		
		static const sc_integer numStates = 9;
		
		//! Inner class for default interface scope.
		class DefaultSCI
		{
			public:
				DefaultSCI(TrafficLightStateMachine * parent):
					redOn_raised(false),
					redOff_raised(false),
					yellowOn_raised(false),
					yellowOff_raised(false),
					greenOn_raised(false),
					greenOff_raised(false),
					standby_raised(false),
					operate_raised(false),
					parent(parent)
				{}
				
				/*! Checks if the out event 'redOn' that is defined in the default interface scope has been raised. */
				sc_boolean isRaised_redOn() const;
				
				/*! Checks if the out event 'redOff' that is defined in the default interface scope has been raised. */
				sc_boolean isRaised_redOff() const;
				
				/*! Checks if the out event 'yellowOn' that is defined in the default interface scope has been raised. */
				sc_boolean isRaised_yellowOn() const;
				
				/*! Checks if the out event 'yellowOff' that is defined in the default interface scope has been raised. */
				sc_boolean isRaised_yellowOff() const;
				
				/*! Checks if the out event 'greenOn' that is defined in the default interface scope has been raised. */
				sc_boolean isRaised_greenOn() const;
				
				/*! Checks if the out event 'greenOff' that is defined in the default interface scope has been raised. */
				sc_boolean isRaised_greenOff() const;
				
				/*! Raises the in event 'standby' that is defined in the default interface scope. */
				void raise_standby();
				
				/*! Raises the in event 'operate' that is defined in the default interface scope. */
				void raise_operate();
				
				
			private:
				friend class TrafficLightStateMachine;
				sc_boolean redOn_raised;
				sc_boolean redOff_raised;
				sc_boolean yellowOn_raised;
				sc_boolean yellowOff_raised;
				sc_boolean greenOn_raised;
				sc_boolean greenOff_raised;
				sc_boolean standby_raised;
				sc_boolean operate_raised;
				TrafficLightStateMachine * parent;
		};
		
		/*! Returns an instance of the interface class 'DefaultSCI'. */
		DefaultSCI* getDefaultSCI();
		
		/*! Checks if the out event 'redOn' that is defined in the default interface scope has been raised. */
		sc_boolean isRaised_redOn() const;
		
		/*! Checks if the out event 'redOff' that is defined in the default interface scope has been raised. */
		sc_boolean isRaised_redOff() const;
		
		/*! Checks if the out event 'yellowOn' that is defined in the default interface scope has been raised. */
		sc_boolean isRaised_yellowOn() const;
		
		/*! Checks if the out event 'yellowOff' that is defined in the default interface scope has been raised. */
		sc_boolean isRaised_yellowOff() const;
		
		/*! Checks if the out event 'greenOn' that is defined in the default interface scope has been raised. */
		sc_boolean isRaised_greenOn() const;
		
		/*! Checks if the out event 'greenOff' that is defined in the default interface scope has been raised. */
		sc_boolean isRaised_greenOff() const;
		
		/*! Raises the in event 'standby' that is defined in the default interface scope. */
		void raise_standby();
		
		/*! Raises the in event 'operate' that is defined in the default interface scope. */
		void raise_operate();
		
		
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
		
		virtual sc_integer getNumberOfParallelTimeEvents();
		
		/*! Checks if the specified state is active (until 2.4.1 the used method for states was calles isActive()). */
		sc_boolean isStateActive(TrafficLightStateMachineStates state) const;
		
		//! number of time events used by the state machine.
		static const sc_integer timeEventsCount = 6;
		
		//! number of time events that can be active at once.
		static const sc_integer parallelTimeEventsCount = 1;
		
		public slots:
			void standby();
			void operate();
			
		signals:
			void redOn();
			void redOff();
			void yellowOn();
			void yellowOff();
			void greenOn();
			void greenOff();
		
		

	protected:

	private:
		TrafficLightStateMachine(const TrafficLightStateMachine &rhs);
		TrafficLightStateMachine& operator=(const TrafficLightStateMachine&);
		
		//! Inner class for internal interface scope.
		class InternalSCI
		{
			public:
				InternalSCI(TrafficLightStateMachine * parent):
					parent(parent)
				{}
				
				
			private:
				friend class TrafficLightStateMachine;
				TrafficLightStateMachine * parent;
		};
		
		//! the maximum number of orthogonal states defines the dimension of the state configuration vector.
		static const sc_ushort maxOrthogonalStates = 1;
		
		TimerInterface* timer;
		sc_boolean timeEvents[timeEventsCount];
		
		
		TrafficLightStateMachineStates stateConfVector[maxOrthogonalStates];
		
		sc_ushort stateConfVectorPosition;
		
		DefaultSCI iface;
		InternalSCI ifaceInternalSCI;
		
		// prototypes of all internal functions
		
		void enact_trafficlight_operating_r_prepare();
		void enact_trafficlight_operating_r_prepare_switch_to_go();
		void enact_trafficlight_operating_r_prepare_switch_to_stop();
		void enact_trafficlight_operating_r_stop();
		void enact_trafficlight_operating_r_go();
		void enact_trafficlight_standby_blink_on();
		void enact_trafficlight_standby_blink_off();
		void exact_trafficlight_operating_r_prepare();
		void exact_trafficlight_operating_r_prepare_switch_to_go();
		void exact_trafficlight_operating_r_prepare_switch_to_stop();
		void exact_trafficlight_operating_r_stop();
		void exact_trafficlight_operating_r_go();
		void exact_trafficlight_standby_blink_on();
		void exact_trafficlight_standby_blink_off();
		void enseq_trafficlight_operating_default();
		void enseq_trafficlight_operating_r_prepare_switch_to_go_default();
		void enseq_trafficlight_operating_r_prepare_switch_to_stop_default();
		void enseq_trafficlight_operating_r_stop_default();
		void enseq_trafficlight_operating_r_go_default();
		void enseq_trafficlight_standby_default();
		void enseq_trafficlight_standby_blink_on_default();
		void enseq_trafficlight_standby_blink_off_default();
		void enseq_trafficlight_default();
		void enseq_trafficlight_operating_r_default();
		void enseq_trafficlight_standby_blink_default();
		void exseq_trafficlight_operating();
		void exseq_trafficlight_operating_r_prepare();
		void exseq_trafficlight_operating_r_prepare_switch_to_go();
		void exseq_trafficlight_operating_r_prepare_switch_to_stop();
		void exseq_trafficlight_operating_r_stop();
		void exseq_trafficlight_operating_r_go();
		void exseq_trafficlight_standby();
		void exseq_trafficlight_standby_blink_on();
		void exseq_trafficlight_standby_blink_off();
		void exseq_trafficlight();
		void exseq_trafficlight_operating_r();
		void exseq_trafficlight_operating_r_prepare_switch();
		void exseq_trafficlight_standby_blink();
		void react_trafficlight__entry_Default();
		void react_trafficlight_operating_r__entry_Default();
		void react_trafficlight_standby_blink__entry_Default();
		sc_boolean react();
		sc_boolean trafficlight_operating_react(const sc_boolean try_transition);
		sc_boolean trafficlight_operating_r_prepare_react(const sc_boolean try_transition);
		sc_boolean trafficlight_operating_r_prepare_switch_to_go_react(const sc_boolean try_transition);
		sc_boolean trafficlight_operating_r_prepare_switch_to_stop_react(const sc_boolean try_transition);
		sc_boolean trafficlight_operating_r_stop_react(const sc_boolean try_transition);
		sc_boolean trafficlight_operating_r_go_react(const sc_boolean try_transition);
		sc_boolean trafficlight_standby_react(const sc_boolean try_transition);
		sc_boolean trafficlight_standby_blink_on_react(const sc_boolean try_transition);
		sc_boolean trafficlight_standby_blink_off_react(const sc_boolean try_transition);
		void clearInEvents();
		void clearOutEvents();
		
};




#endif /* TRAFFICLIGHTSTATEMACHINE_H_ */
