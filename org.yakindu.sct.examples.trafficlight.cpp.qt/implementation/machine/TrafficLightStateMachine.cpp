
#include "TrafficLightStateMachine.h"

/*! \file Implementation of the state machine 'TrafficLightStateMachine'
*/



TrafficLightStateMachine::TrafficLightStateMachine(QObject *parent):
	QObject(parent),
	timer(sc_null),
	stateConfVectorPosition(0),
	iface(this),
	ifaceInternalSCI(this)
{
}

TrafficLightStateMachine::~TrafficLightStateMachine()
{
}


void TrafficLightStateMachine::init()
{
	for (sc_ushort i = 0; i < maxOrthogonalStates; ++i)
		stateConfVector[i] = TrafficLightStateMachine_last_state;
	
	stateConfVectorPosition = 0;

	clearInEvents();
	clearOutEvents();
	
}

void TrafficLightStateMachine::enter()
{
	/* Default enter sequence for statechart TrafficLightStateMachine */
	/* Entry action for statechart 'TrafficLightStateMachine'. */
	iface.redOff_raised = true;
	emit redOff();
	iface.yellowOff_raised = true;
	emit yellowOff();
	iface.greenOff_raised = true;
	emit greenOff();
	enseq_trafficlight_default();
}

void TrafficLightStateMachine::exit()
{
	/* Default exit sequence for statechart TrafficLightStateMachine */
	exseq_trafficlight();
}

sc_boolean TrafficLightStateMachine::isActive() const
{
	return stateConfVector[0] != TrafficLightStateMachine_last_state;
}

/* 
 * Always returns 'false' since this state machine can never become final.
 */
sc_boolean TrafficLightStateMachine::isFinal() const
{
   return false;}

void TrafficLightStateMachine::runCycle()
{
	
	clearOutEvents();
	for (stateConfVectorPosition = 0;
		stateConfVectorPosition < maxOrthogonalStates;
		stateConfVectorPosition++)
		{
			
		switch (stateConfVector[stateConfVectorPosition])
		{
		case trafficlight_operating_r_prepare_switch_to_go :
		{
			trafficlight_operating_r_prepare_switch_to_go_react(true);
			break;
		}
		case trafficlight_operating_r_prepare_switch_to_stop :
		{
			trafficlight_operating_r_prepare_switch_to_stop_react(true);
			break;
		}
		case trafficlight_operating_r_stop :
		{
			trafficlight_operating_r_stop_react(true);
			break;
		}
		case trafficlight_operating_r_go :
		{
			trafficlight_operating_r_go_react(true);
			break;
		}
		case trafficlight_standby_blink_on :
		{
			trafficlight_standby_blink_on_react(true);
			break;
		}
		case trafficlight_standby_blink_off :
		{
			trafficlight_standby_blink_off_react(true);
			break;
		}
		default:
			break;
		}
	}
	clearInEvents();
}

void TrafficLightStateMachine::clearInEvents()
{
	iface.standby_raised = false;
	iface.operate_raised = false;
	timeEvents[0] = false; 
	timeEvents[1] = false; 
	timeEvents[2] = false; 
	timeEvents[3] = false; 
	timeEvents[4] = false; 
	timeEvents[5] = false; 
}

void TrafficLightStateMachine::clearOutEvents()
{
	iface.redOn_raised = false;
	iface.redOff_raised = false;
	iface.yellowOn_raised = false;
	iface.yellowOff_raised = false;
	iface.greenOn_raised = false;
	iface.greenOff_raised = false;
}


void TrafficLightStateMachine::setTimer(TimerInterface* timerInterface)
{
	this->timer = timerInterface;
}

TimerInterface* TrafficLightStateMachine::getTimer()
{
	return timer;
}

sc_integer TrafficLightStateMachine::getNumberOfParallelTimeEvents() {
	return parallelTimeEventsCount;
}

void TrafficLightStateMachine::raiseTimeEvent(sc_eventid evid)
{
	if ((evid >= (sc_eventid)timeEvents) && (evid < (sc_eventid)(&timeEvents[timeEventsCount])))
	{
		*(sc_boolean*)evid = true;
		runCycle();
	}
}

sc_boolean TrafficLightStateMachine::isStateActive(TrafficLightStateMachineStates state) const
{
	switch (state)
	{
		case trafficlight_operating : 
			return (sc_boolean) (stateConfVector[SCVI_TRAFFICLIGHT_OPERATING] >= trafficlight_operating
				&& stateConfVector[SCVI_TRAFFICLIGHT_OPERATING] <= trafficlight_operating_r_go);
		case trafficlight_operating_r_prepare : 
			return (sc_boolean) (stateConfVector[SCVI_TRAFFICLIGHT_OPERATING_R_PREPARE] >= trafficlight_operating_r_prepare
				&& stateConfVector[SCVI_TRAFFICLIGHT_OPERATING_R_PREPARE] <= trafficlight_operating_r_prepare_switch_to_stop);
		case trafficlight_operating_r_prepare_switch_to_go : 
			return (sc_boolean) (stateConfVector[SCVI_TRAFFICLIGHT_OPERATING_R_PREPARE_SWITCH_TO_GO] == trafficlight_operating_r_prepare_switch_to_go
			);
		case trafficlight_operating_r_prepare_switch_to_stop : 
			return (sc_boolean) (stateConfVector[SCVI_TRAFFICLIGHT_OPERATING_R_PREPARE_SWITCH_TO_STOP] == trafficlight_operating_r_prepare_switch_to_stop
			);
		case trafficlight_operating_r_stop : 
			return (sc_boolean) (stateConfVector[SCVI_TRAFFICLIGHT_OPERATING_R_STOP] == trafficlight_operating_r_stop
			);
		case trafficlight_operating_r_go : 
			return (sc_boolean) (stateConfVector[SCVI_TRAFFICLIGHT_OPERATING_R_GO] == trafficlight_operating_r_go
			);
		case trafficlight_standby : 
			return (sc_boolean) (stateConfVector[SCVI_TRAFFICLIGHT_STANDBY] >= trafficlight_standby
				&& stateConfVector[SCVI_TRAFFICLIGHT_STANDBY] <= trafficlight_standby_blink_off);
		case trafficlight_standby_blink_on : 
			return (sc_boolean) (stateConfVector[SCVI_TRAFFICLIGHT_STANDBY_BLINK_ON] == trafficlight_standby_blink_on
			);
		case trafficlight_standby_blink_off : 
			return (sc_boolean) (stateConfVector[SCVI_TRAFFICLIGHT_STANDBY_BLINK_OFF] == trafficlight_standby_blink_off
			);
		default: return false;
	}
}

TrafficLightStateMachine::DefaultSCI* TrafficLightStateMachine::getDefaultSCI()
{
	return &iface;
}
/* Functions for event standby in interface DefaultSCI */
void TrafficLightStateMachine::DefaultSCI::raise_standby()
{
	standby_raised = true;
	
	parent->runCycle();
}
void TrafficLightStateMachine::raise_standby()
{
	iface.raise_standby();
}
/* Functions for event operate in interface DefaultSCI */
void TrafficLightStateMachine::DefaultSCI::raise_operate()
{
	operate_raised = true;
	
	parent->runCycle();
}
void TrafficLightStateMachine::raise_operate()
{
	iface.raise_operate();
}
/* Functions for event redOn in interface DefaultSCI */
sc_boolean TrafficLightStateMachine::DefaultSCI::isRaised_redOn() const
{
	return redOn_raised;
}
sc_boolean TrafficLightStateMachine::isRaised_redOn() const
{
	return iface.isRaised_redOn();
}
/* Functions for event redOff in interface DefaultSCI */
sc_boolean TrafficLightStateMachine::DefaultSCI::isRaised_redOff() const
{
	return redOff_raised;
}
sc_boolean TrafficLightStateMachine::isRaised_redOff() const
{
	return iface.isRaised_redOff();
}
/* Functions for event yellowOn in interface DefaultSCI */
sc_boolean TrafficLightStateMachine::DefaultSCI::isRaised_yellowOn() const
{
	return yellowOn_raised;
}
sc_boolean TrafficLightStateMachine::isRaised_yellowOn() const
{
	return iface.isRaised_yellowOn();
}
/* Functions for event yellowOff in interface DefaultSCI */
sc_boolean TrafficLightStateMachine::DefaultSCI::isRaised_yellowOff() const
{
	return yellowOff_raised;
}
sc_boolean TrafficLightStateMachine::isRaised_yellowOff() const
{
	return iface.isRaised_yellowOff();
}
/* Functions for event greenOn in interface DefaultSCI */
sc_boolean TrafficLightStateMachine::DefaultSCI::isRaised_greenOn() const
{
	return greenOn_raised;
}
sc_boolean TrafficLightStateMachine::isRaised_greenOn() const
{
	return iface.isRaised_greenOn();
}
/* Functions for event greenOff in interface DefaultSCI */
sc_boolean TrafficLightStateMachine::DefaultSCI::isRaised_greenOff() const
{
	return greenOff_raised;
}
sc_boolean TrafficLightStateMachine::isRaised_greenOff() const
{
	return iface.isRaised_greenOff();
}

// implementations of all internal functions

/* Entry action for state 'prepare'. */
void TrafficLightStateMachine::enact_trafficlight_operating_r_prepare()
{
	/* Entry action for state 'prepare'. */
	iface.yellowOn_raised = true;
	emit yellowOn();
}

/* Entry action for state 'to go'. */
void TrafficLightStateMachine::enact_trafficlight_operating_r_prepare_switch_to_go()
{
	/* Entry action for state 'to go'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[0]), (1 * 1000), false);
	iface.redOn_raised = true;
	emit redOn();
}

/* Entry action for state 'to stop'. */
void TrafficLightStateMachine::enact_trafficlight_operating_r_prepare_switch_to_stop()
{
	/* Entry action for state 'to stop'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[1]), (1 * 1000), false);
}

/* Entry action for state 'stop'. */
void TrafficLightStateMachine::enact_trafficlight_operating_r_stop()
{
	/* Entry action for state 'stop'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[2]), (3 * 1000), false);
	iface.redOn_raised = true;
	emit redOn();
}

/* Entry action for state 'go'. */
void TrafficLightStateMachine::enact_trafficlight_operating_r_go()
{
	/* Entry action for state 'go'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[3]), (3 * 1000), false);
	iface.greenOn_raised = true;
	emit greenOn();
}

/* Entry action for state 'on'. */
void TrafficLightStateMachine::enact_trafficlight_standby_blink_on()
{
	/* Entry action for state 'on'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[4]), (1 * 1000), false);
	iface.yellowOn_raised = true;
	emit yellowOn();
}

/* Entry action for state 'off'. */
void TrafficLightStateMachine::enact_trafficlight_standby_blink_off()
{
	/* Entry action for state 'off'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[5]), (1 * 1000), false);
}

/* Exit action for state 'prepare'. */
void TrafficLightStateMachine::exact_trafficlight_operating_r_prepare()
{
	/* Exit action for state 'prepare'. */
	iface.yellowOff_raised = true;
	emit yellowOff();
}

/* Exit action for state 'to go'. */
void TrafficLightStateMachine::exact_trafficlight_operating_r_prepare_switch_to_go()
{
	/* Exit action for state 'to go'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[0]));
	iface.redOff_raised = true;
	emit redOff();
}

/* Exit action for state 'to stop'. */
void TrafficLightStateMachine::exact_trafficlight_operating_r_prepare_switch_to_stop()
{
	/* Exit action for state 'to stop'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[1]));
}

/* Exit action for state 'stop'. */
void TrafficLightStateMachine::exact_trafficlight_operating_r_stop()
{
	/* Exit action for state 'stop'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[2]));
	iface.redOff_raised = true;
	emit redOff();
}

/* Exit action for state 'go'. */
void TrafficLightStateMachine::exact_trafficlight_operating_r_go()
{
	/* Exit action for state 'go'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[3]));
	iface.greenOff_raised = true;
	emit greenOff();
}

/* Exit action for state 'on'. */
void TrafficLightStateMachine::exact_trafficlight_standby_blink_on()
{
	/* Exit action for state 'on'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[4]));
	iface.yellowOff_raised = true;
	emit yellowOff();
}

/* Exit action for state 'off'. */
void TrafficLightStateMachine::exact_trafficlight_standby_blink_off()
{
	/* Exit action for state 'off'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[5]));
}

/* 'default' enter sequence for state operating */
void TrafficLightStateMachine::enseq_trafficlight_operating_default()
{
	/* 'default' enter sequence for state operating */
	enseq_trafficlight_operating_r_default();
}

/* 'default' enter sequence for state to go */
void TrafficLightStateMachine::enseq_trafficlight_operating_r_prepare_switch_to_go_default()
{
	/* 'default' enter sequence for state to go */
	enact_trafficlight_operating_r_prepare_switch_to_go();
	stateConfVector[0] = trafficlight_operating_r_prepare_switch_to_go;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state to stop */
void TrafficLightStateMachine::enseq_trafficlight_operating_r_prepare_switch_to_stop_default()
{
	/* 'default' enter sequence for state to stop */
	enact_trafficlight_operating_r_prepare_switch_to_stop();
	stateConfVector[0] = trafficlight_operating_r_prepare_switch_to_stop;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state stop */
void TrafficLightStateMachine::enseq_trafficlight_operating_r_stop_default()
{
	/* 'default' enter sequence for state stop */
	enact_trafficlight_operating_r_stop();
	stateConfVector[0] = trafficlight_operating_r_stop;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state go */
void TrafficLightStateMachine::enseq_trafficlight_operating_r_go_default()
{
	/* 'default' enter sequence for state go */
	enact_trafficlight_operating_r_go();
	stateConfVector[0] = trafficlight_operating_r_go;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state standby */
void TrafficLightStateMachine::enseq_trafficlight_standby_default()
{
	/* 'default' enter sequence for state standby */
	enseq_trafficlight_standby_blink_default();
}

/* 'default' enter sequence for state on */
void TrafficLightStateMachine::enseq_trafficlight_standby_blink_on_default()
{
	/* 'default' enter sequence for state on */
	enact_trafficlight_standby_blink_on();
	stateConfVector[0] = trafficlight_standby_blink_on;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state off */
void TrafficLightStateMachine::enseq_trafficlight_standby_blink_off_default()
{
	/* 'default' enter sequence for state off */
	enact_trafficlight_standby_blink_off();
	stateConfVector[0] = trafficlight_standby_blink_off;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for region trafficlight */
void TrafficLightStateMachine::enseq_trafficlight_default()
{
	/* 'default' enter sequence for region trafficlight */
	react_trafficlight__entry_Default();
}

/* 'default' enter sequence for region r */
void TrafficLightStateMachine::enseq_trafficlight_operating_r_default()
{
	/* 'default' enter sequence for region r */
	react_trafficlight_operating_r__entry_Default();
}

/* 'default' enter sequence for region blink */
void TrafficLightStateMachine::enseq_trafficlight_standby_blink_default()
{
	/* 'default' enter sequence for region blink */
	react_trafficlight_standby_blink__entry_Default();
}

/* Default exit sequence for state operating */
void TrafficLightStateMachine::exseq_trafficlight_operating()
{
	/* Default exit sequence for state operating */
	exseq_trafficlight_operating_r();
}

/* Default exit sequence for state prepare */
void TrafficLightStateMachine::exseq_trafficlight_operating_r_prepare()
{
	/* Default exit sequence for state prepare */
	exseq_trafficlight_operating_r_prepare_switch();
	exact_trafficlight_operating_r_prepare();
}

/* Default exit sequence for state to go */
void TrafficLightStateMachine::exseq_trafficlight_operating_r_prepare_switch_to_go()
{
	/* Default exit sequence for state to go */
	stateConfVector[0] = TrafficLightStateMachine_last_state;
	stateConfVectorPosition = 0;
	exact_trafficlight_operating_r_prepare_switch_to_go();
}

/* Default exit sequence for state to stop */
void TrafficLightStateMachine::exseq_trafficlight_operating_r_prepare_switch_to_stop()
{
	/* Default exit sequence for state to stop */
	stateConfVector[0] = TrafficLightStateMachine_last_state;
	stateConfVectorPosition = 0;
	exact_trafficlight_operating_r_prepare_switch_to_stop();
}

/* Default exit sequence for state stop */
void TrafficLightStateMachine::exseq_trafficlight_operating_r_stop()
{
	/* Default exit sequence for state stop */
	stateConfVector[0] = TrafficLightStateMachine_last_state;
	stateConfVectorPosition = 0;
	exact_trafficlight_operating_r_stop();
}

/* Default exit sequence for state go */
void TrafficLightStateMachine::exseq_trafficlight_operating_r_go()
{
	/* Default exit sequence for state go */
	stateConfVector[0] = TrafficLightStateMachine_last_state;
	stateConfVectorPosition = 0;
	exact_trafficlight_operating_r_go();
}

/* Default exit sequence for state standby */
void TrafficLightStateMachine::exseq_trafficlight_standby()
{
	/* Default exit sequence for state standby */
	exseq_trafficlight_standby_blink();
}

/* Default exit sequence for state on */
void TrafficLightStateMachine::exseq_trafficlight_standby_blink_on()
{
	/* Default exit sequence for state on */
	stateConfVector[0] = TrafficLightStateMachine_last_state;
	stateConfVectorPosition = 0;
	exact_trafficlight_standby_blink_on();
}

/* Default exit sequence for state off */
void TrafficLightStateMachine::exseq_trafficlight_standby_blink_off()
{
	/* Default exit sequence for state off */
	stateConfVector[0] = TrafficLightStateMachine_last_state;
	stateConfVectorPosition = 0;
	exact_trafficlight_standby_blink_off();
}

/* Default exit sequence for region trafficlight */
void TrafficLightStateMachine::exseq_trafficlight()
{
	/* Default exit sequence for region trafficlight */
	/* Handle exit of all possible states (of TrafficLightStateMachine.trafficlight) at position 0... */
	switch(stateConfVector[ 0 ])
	{
		case trafficlight_operating_r_prepare_switch_to_go :
		{
			exseq_trafficlight_operating_r_prepare_switch_to_go();
			exact_trafficlight_operating_r_prepare();
			break;
		}
		case trafficlight_operating_r_prepare_switch_to_stop :
		{
			exseq_trafficlight_operating_r_prepare_switch_to_stop();
			exact_trafficlight_operating_r_prepare();
			break;
		}
		case trafficlight_operating_r_stop :
		{
			exseq_trafficlight_operating_r_stop();
			break;
		}
		case trafficlight_operating_r_go :
		{
			exseq_trafficlight_operating_r_go();
			break;
		}
		case trafficlight_standby_blink_on :
		{
			exseq_trafficlight_standby_blink_on();
			break;
		}
		case trafficlight_standby_blink_off :
		{
			exseq_trafficlight_standby_blink_off();
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region r */
void TrafficLightStateMachine::exseq_trafficlight_operating_r()
{
	/* Default exit sequence for region r */
	/* Handle exit of all possible states (of TrafficLightStateMachine.trafficlight.operating.r) at position 0... */
	switch(stateConfVector[ 0 ])
	{
		case trafficlight_operating_r_prepare_switch_to_go :
		{
			exseq_trafficlight_operating_r_prepare_switch_to_go();
			exact_trafficlight_operating_r_prepare();
			break;
		}
		case trafficlight_operating_r_prepare_switch_to_stop :
		{
			exseq_trafficlight_operating_r_prepare_switch_to_stop();
			exact_trafficlight_operating_r_prepare();
			break;
		}
		case trafficlight_operating_r_stop :
		{
			exseq_trafficlight_operating_r_stop();
			break;
		}
		case trafficlight_operating_r_go :
		{
			exseq_trafficlight_operating_r_go();
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region switch */
void TrafficLightStateMachine::exseq_trafficlight_operating_r_prepare_switch()
{
	/* Default exit sequence for region switch */
	/* Handle exit of all possible states (of TrafficLightStateMachine.trafficlight.operating.r.prepare.switch) at position 0... */
	switch(stateConfVector[ 0 ])
	{
		case trafficlight_operating_r_prepare_switch_to_go :
		{
			exseq_trafficlight_operating_r_prepare_switch_to_go();
			break;
		}
		case trafficlight_operating_r_prepare_switch_to_stop :
		{
			exseq_trafficlight_operating_r_prepare_switch_to_stop();
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region blink */
void TrafficLightStateMachine::exseq_trafficlight_standby_blink()
{
	/* Default exit sequence for region blink */
	/* Handle exit of all possible states (of TrafficLightStateMachine.trafficlight.standby.blink) at position 0... */
	switch(stateConfVector[ 0 ])
	{
		case trafficlight_standby_blink_on :
		{
			exseq_trafficlight_standby_blink_on();
			break;
		}
		case trafficlight_standby_blink_off :
		{
			exseq_trafficlight_standby_blink_off();
			break;
		}
		default: break;
	}
}

/* Default react sequence for initial entry  */
void TrafficLightStateMachine::react_trafficlight__entry_Default()
{
	/* Default react sequence for initial entry  */
	enseq_trafficlight_operating_default();
}

/* Default react sequence for initial entry  */
void TrafficLightStateMachine::react_trafficlight_operating_r__entry_Default()
{
	/* Default react sequence for initial entry  */
	enseq_trafficlight_operating_r_stop_default();
}

/* Default react sequence for initial entry  */
void TrafficLightStateMachine::react_trafficlight_standby_blink__entry_Default()
{
	/* Default react sequence for initial entry  */
	enseq_trafficlight_standby_blink_on_default();
}

sc_boolean TrafficLightStateMachine::react() {
	/* State machine reactions. */
	return false;
}

sc_boolean TrafficLightStateMachine::trafficlight_operating_react(const sc_boolean try_transition) {
	/* The reactions of state operating. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (iface.standby_raised)
		{ 
			exseq_trafficlight_operating();
			enseq_trafficlight_standby_default();
			react();
		}  else
		{
			did_transition = false;
		}
	} 
	if (((did_transition) == (false)))
	{ 
		did_transition = react();
	} 
	return did_transition;
}

sc_boolean TrafficLightStateMachine::trafficlight_operating_r_prepare_react(const sc_boolean try_transition) {
	/* The reactions of state prepare. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		did_transition = false;
	} 
	if (((did_transition) == (false)))
	{ 
		did_transition = trafficlight_operating_react(try_transition);
	} 
	return did_transition;
}

sc_boolean TrafficLightStateMachine::trafficlight_operating_r_prepare_switch_to_go_react(const sc_boolean try_transition) {
	/* The reactions of state to go. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (timeEvents[0])
		{ 
			exseq_trafficlight_operating_r_prepare();
			enseq_trafficlight_operating_r_go_default();
			trafficlight_operating_react(false);
		}  else
		{
			did_transition = false;
		}
	} 
	if (((did_transition) == (false)))
	{ 
		did_transition = trafficlight_operating_r_prepare_react(try_transition);
	} 
	return did_transition;
}

sc_boolean TrafficLightStateMachine::trafficlight_operating_r_prepare_switch_to_stop_react(const sc_boolean try_transition) {
	/* The reactions of state to stop. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (timeEvents[1])
		{ 
			exseq_trafficlight_operating_r_prepare();
			enseq_trafficlight_operating_r_stop_default();
			trafficlight_operating_react(false);
		}  else
		{
			did_transition = false;
		}
	} 
	if (((did_transition) == (false)))
	{ 
		did_transition = trafficlight_operating_r_prepare_react(try_transition);
	} 
	return did_transition;
}

sc_boolean TrafficLightStateMachine::trafficlight_operating_r_stop_react(const sc_boolean try_transition) {
	/* The reactions of state stop. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (timeEvents[2])
		{ 
			exseq_trafficlight_operating_r_stop();
			enact_trafficlight_operating_r_prepare();
			enseq_trafficlight_operating_r_prepare_switch_to_go_default();
			trafficlight_operating_react(false);
		}  else
		{
			did_transition = false;
		}
	} 
	if (((did_transition) == (false)))
	{ 
		did_transition = trafficlight_operating_react(try_transition);
	} 
	return did_transition;
}

sc_boolean TrafficLightStateMachine::trafficlight_operating_r_go_react(const sc_boolean try_transition) {
	/* The reactions of state go. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (timeEvents[3])
		{ 
			exseq_trafficlight_operating_r_go();
			enact_trafficlight_operating_r_prepare();
			enseq_trafficlight_operating_r_prepare_switch_to_stop_default();
			trafficlight_operating_react(false);
		}  else
		{
			did_transition = false;
		}
	} 
	if (((did_transition) == (false)))
	{ 
		did_transition = trafficlight_operating_react(try_transition);
	} 
	return did_transition;
}

sc_boolean TrafficLightStateMachine::trafficlight_standby_react(const sc_boolean try_transition) {
	/* The reactions of state standby. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (iface.operate_raised)
		{ 
			exseq_trafficlight_standby();
			enseq_trafficlight_operating_default();
			react();
		}  else
		{
			did_transition = false;
		}
	} 
	if (((did_transition) == (false)))
	{ 
		did_transition = react();
	} 
	return did_transition;
}

sc_boolean TrafficLightStateMachine::trafficlight_standby_blink_on_react(const sc_boolean try_transition) {
	/* The reactions of state on. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (timeEvents[4])
		{ 
			exseq_trafficlight_standby_blink_on();
			enseq_trafficlight_standby_blink_off_default();
			trafficlight_standby_react(false);
		}  else
		{
			did_transition = false;
		}
	} 
	if (((did_transition) == (false)))
	{ 
		did_transition = trafficlight_standby_react(try_transition);
	} 
	return did_transition;
}

sc_boolean TrafficLightStateMachine::trafficlight_standby_blink_off_react(const sc_boolean try_transition) {
	/* The reactions of state off. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (timeEvents[5])
		{ 
			exseq_trafficlight_standby_blink_off();
			enseq_trafficlight_standby_blink_on_default();
			trafficlight_standby_react(false);
		}  else
		{
			did_transition = false;
		}
	} 
	if (((did_transition) == (false)))
	{ 
		did_transition = trafficlight_standby_react(try_transition);
	} 
	return did_transition;
}




void TrafficLightStateMachine::standby(){
	iface.raise_standby();
}

void TrafficLightStateMachine::operate(){
	iface.raise_operate();
}


