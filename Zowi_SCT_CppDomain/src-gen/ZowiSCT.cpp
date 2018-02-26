
#include "ZowiSCT.h"
#include <string.h>

/*! \file Implementation of the state machine 'ZowiSCT'
*/


ZowiSCT::ZowiSCT():
	timer(null),
	stateConfVectorPosition(0),
	iface()
{
}

ZowiSCT::~ZowiSCT()
{
}

const uint16_t ZowiSCT::DefaultSCI::steps = 2;
const uint16_t ZowiSCT::DefaultSCI::T = 1000;


void ZowiSCT::init()
{
	for (sc_ushort i = 0; i < maxOrthogonalStates; ++i)
		stateConfVector[i] = ZowiSCT_last_state;
	
	stateConfVectorPosition = 0;

	clearInEvents();
	clearOutEvents();
	
	/* Default init sequence for statechart ZowiSCT */
	iface.distance = 20.0;
	iface.noise = 700;
}

void ZowiSCT::enter()
{
	/* Default enter sequence for statechart ZowiSCT */
	enseq_main_region_default();
}

void ZowiSCT::exit()
{
	/* Default exit sequence for statechart ZowiSCT */
	exseq_main_region();
}

sc_boolean ZowiSCT::isActive() const
{
	return stateConfVector[0] != ZowiSCT_last_state;
}

/* 
 * Always returns 'false' since this state machine can never become final.
 */
sc_boolean ZowiSCT::isFinal() const
{
   return false;}

void ZowiSCT::runCycle()
{
	
	clearOutEvents();
	for (stateConfVectorPosition = 0;
		stateConfVectorPosition < maxOrthogonalStates;
		stateConfVectorPosition++)
		{
			
		switch (stateConfVector[stateConfVectorPosition])
		{
		case main_region_Init :
		{
			react_main_region_Init();
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_Welcome :
		{
			react_main_region_Awake_walkAndAvoidObstacles_Welcome();
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_WalkStraight :
		{
			react_main_region_Awake_walkAndAvoidObstacles_WalkStraight();
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_TurnLeft :
		{
			react_main_region_Awake_walkAndAvoidObstacles_TurnLeft();
			break;
		}
		case main_region_Sleeping :
		{
			react_main_region_Sleeping();
			break;
		}
		default:
			break;
		}
	}
	clearInEvents();
}

void ZowiSCT::clearInEvents()
{
	timeEvents[0] = false; 
	timeEvents[1] = false; 
	timeEvents[2] = false; 
}

void ZowiSCT::clearOutEvents()
{
}


void ZowiSCT::setTimer(TimerInterface* timerInterface)
{
	this->timer = timerInterface;
}

TimerInterface* ZowiSCT::getTimer()
{
	return timer;
}

void ZowiSCT::raiseTimeEvent(sc_eventid evid)
{
	if ((evid >= (sc_eventid)timeEvents) && (evid < (sc_eventid)(&timeEvents[timeEventsCount])))
	{
		*(sc_boolean*)evid = true;
	}				
}

sc_boolean ZowiSCT::isStateActive(ZowiSCTStates state) const
{
	switch (state)
	{
		case main_region_Init : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_REGION_INIT] == main_region_Init
			);
		case main_region_Awake : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_REGION_AWAKE] >= main_region_Awake
				&& stateConfVector[SCVI_MAIN_REGION_AWAKE] <= main_region_Awake_walkAndAvoidObstacles_TurnLeft);
		case main_region_Awake_walkAndAvoidObstacles_Welcome : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_REGION_AWAKE_WALKANDAVOIDOBSTACLES_WELCOME] == main_region_Awake_walkAndAvoidObstacles_Welcome
			);
		case main_region_Awake_walkAndAvoidObstacles_WalkStraight : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_REGION_AWAKE_WALKANDAVOIDOBSTACLES_WALKSTRAIGHT] == main_region_Awake_walkAndAvoidObstacles_WalkStraight
			);
		case main_region_Awake_walkAndAvoidObstacles_TurnLeft : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_REGION_AWAKE_WALKANDAVOIDOBSTACLES_TURNLEFT] == main_region_Awake_walkAndAvoidObstacles_TurnLeft
			);
		case main_region_Sleeping : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_REGION_SLEEPING] == main_region_Sleeping
			);
		default: return false;
	}
}

ZowiSCT::DefaultSCI* ZowiSCT::getDefaultSCI()
{
	return &iface;
}
Zowi ZowiSCT::DefaultSCI::get_zowi() const
{
	return zowi;
}

Zowi ZowiSCT::get_zowi() const
{
	return iface.zowi;
}

void ZowiSCT::DefaultSCI::set_zowi(Zowi value)
{
	zowi = value;
}

void ZowiSCT::set_zowi(Zowi value)
{
	iface.zowi = value;
}

float ZowiSCT::DefaultSCI::get_distance() const
{
	return distance;
}

float ZowiSCT::get_distance() const
{
	return iface.distance;
}

void ZowiSCT::DefaultSCI::set_distance(float value)
{
	distance = value;
}

void ZowiSCT::set_distance(float value)
{
	iface.distance = value;
}

uint16_t ZowiSCT::DefaultSCI::get_noise() const
{
	return noise;
}

uint16_t ZowiSCT::get_noise() const
{
	return iface.noise;
}

void ZowiSCT::DefaultSCI::set_noise(uint16_t value)
{
	noise = value;
}

void ZowiSCT::set_noise(uint16_t value)
{
	iface.noise = value;
}

const uint16_t ZowiSCT::DefaultSCI::get_steps() const
{
	return steps;
}

const uint16_t ZowiSCT::get_steps() const
{
	return ZowiSCT::DefaultSCI::steps;
}

const uint16_t ZowiSCT::DefaultSCI::get_t() const
{
	return T;
}

const uint16_t ZowiSCT::get_t() const
{
	return ZowiSCT::DefaultSCI::T;
}


// implementations of all internal functions

sc_boolean ZowiSCT::check_main_region_Init_tr0_tr0()
{
	return true;
}

sc_boolean ZowiSCT::check_main_region_Awake_tr0_tr0()
{
	return timeEvents[0];
}

sc_boolean ZowiSCT::check_main_region_Awake_walkAndAvoidObstacles_Welcome_tr0_tr0()
{
	return timeEvents[1];
}

sc_boolean ZowiSCT::check_main_region_Awake_walkAndAvoidObstacles_WalkStraight_tr0_tr0()
{
	return iface.zowi.getDistance() < iface.distance;
}

sc_boolean ZowiSCT::check_main_region_Awake_walkAndAvoidObstacles_WalkStraight_tr1_tr1()
{
	return timeEvents[2];
}

sc_boolean ZowiSCT::check_main_region_Awake_walkAndAvoidObstacles_TurnLeft_tr0_tr0()
{
	return iface.zowi.getDistance() < iface.distance;
}

sc_boolean ZowiSCT::check_main_region_Awake_walkAndAvoidObstacles_TurnLeft_tr1_tr1()
{
	return true;
}

sc_boolean ZowiSCT::check_main_region_Sleeping_tr0_tr0()
{
	return iface.zowi.getNoise() > iface.noise;
}

void ZowiSCT::effect_main_region_Init_tr0()
{
	exseq_main_region_Init();
	enseq_main_region_Awake_default();
}

void ZowiSCT::effect_main_region_Awake_tr0()
{
	exseq_main_region_Awake();
	enseq_main_region_Sleeping_default();
}

void ZowiSCT::effect_main_region_Awake_walkAndAvoidObstacles_Welcome_tr0()
{
	exseq_main_region_Awake_walkAndAvoidObstacles_Welcome();
	enseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight_default();
}

void ZowiSCT::effect_main_region_Awake_walkAndAvoidObstacles_WalkStraight_tr0()
{
	exseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight();
	enseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft_default();
}

void ZowiSCT::effect_main_region_Awake_walkAndAvoidObstacles_WalkStraight_tr1()
{
	exseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight();
	enseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight_default();
}

void ZowiSCT::effect_main_region_Awake_walkAndAvoidObstacles_TurnLeft_tr0()
{
	exseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft();
	enseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft_default();
}

void ZowiSCT::effect_main_region_Awake_walkAndAvoidObstacles_TurnLeft_tr1()
{
	exseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft();
	enseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight_default();
}

void ZowiSCT::effect_main_region_Sleeping_tr0()
{
	exseq_main_region_Sleeping();
	enseq_main_region_Awake_default();
}

/* Entry action for state 'Init'. */
void ZowiSCT::enact_main_region_Init()
{
	/* Entry action for state 'Init'. */
	iface.zowi.init(PIN_YL, PIN_YR, PIN_RL, PIN_RR);
}

/* Entry action for state 'Awake'. */
void ZowiSCT::enact_main_region_Awake()
{
	/* Entry action for state 'Awake'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[0]), 30 * 1000, false);
}

/* Entry action for state 'Welcome'. */
void ZowiSCT::enact_main_region_Awake_walkAndAvoidObstacles_Welcome()
{
	/* Entry action for state 'Welcome'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[1]), 3 * 1000, false);
	iface.zowi.putMouth(heart);
	iface.zowi.sing(S_superHappy);
}

/* Entry action for state 'WalkStraight'. */
void ZowiSCT::enact_main_region_Awake_walkAndAvoidObstacles_WalkStraight()
{
	/* Entry action for state 'WalkStraight'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[2]), 100, false);
	iface.zowi.putMouth(happyOpen);
	iface.zowi.walk();
}

/* Entry action for state 'TurnLeft'. */
void ZowiSCT::enact_main_region_Awake_walkAndAvoidObstacles_TurnLeft()
{
	/* Entry action for state 'TurnLeft'. */
	iface.zowi.putMouth(bigSurprise);
	iface.zowi.turn();
}

/* Entry action for state 'Sleeping'. */
void ZowiSCT::enact_main_region_Sleeping()
{
	/* Entry action for state 'Sleeping'. */
	iface.zowi.putMouth(lineMouth);
	iface.zowi.home();
}

/* Exit action for state 'Awake'. */
void ZowiSCT::exact_main_region_Awake()
{
	/* Exit action for state 'Awake'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[0]));
}

/* Exit action for state 'Welcome'. */
void ZowiSCT::exact_main_region_Awake_walkAndAvoidObstacles_Welcome()
{
	/* Exit action for state 'Welcome'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[1]));
}

/* Exit action for state 'WalkStraight'. */
void ZowiSCT::exact_main_region_Awake_walkAndAvoidObstacles_WalkStraight()
{
	/* Exit action for state 'WalkStraight'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[2]));
}

/* 'default' enter sequence for state Init */
void ZowiSCT::enseq_main_region_Init_default()
{
	/* 'default' enter sequence for state Init */
	enact_main_region_Init();
	stateConfVector[0] = main_region_Init;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Awake */
void ZowiSCT::enseq_main_region_Awake_default()
{
	/* 'default' enter sequence for state Awake */
	enact_main_region_Awake();
	enseq_main_region_Awake_walkAndAvoidObstacles_default();
}

/* 'default' enter sequence for state Welcome */
void ZowiSCT::enseq_main_region_Awake_walkAndAvoidObstacles_Welcome_default()
{
	/* 'default' enter sequence for state Welcome */
	enact_main_region_Awake_walkAndAvoidObstacles_Welcome();
	stateConfVector[0] = main_region_Awake_walkAndAvoidObstacles_Welcome;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state WalkStraight */
void ZowiSCT::enseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight_default()
{
	/* 'default' enter sequence for state WalkStraight */
	enact_main_region_Awake_walkAndAvoidObstacles_WalkStraight();
	stateConfVector[0] = main_region_Awake_walkAndAvoidObstacles_WalkStraight;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state TurnLeft */
void ZowiSCT::enseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft_default()
{
	/* 'default' enter sequence for state TurnLeft */
	enact_main_region_Awake_walkAndAvoidObstacles_TurnLeft();
	stateConfVector[0] = main_region_Awake_walkAndAvoidObstacles_TurnLeft;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Sleeping */
void ZowiSCT::enseq_main_region_Sleeping_default()
{
	/* 'default' enter sequence for state Sleeping */
	enact_main_region_Sleeping();
	stateConfVector[0] = main_region_Sleeping;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for region main region */
void ZowiSCT::enseq_main_region_default()
{
	/* 'default' enter sequence for region main region */
	react_main_region__entry_Default();
}

/* 'default' enter sequence for region walkAndAvoidObstacles */
void ZowiSCT::enseq_main_region_Awake_walkAndAvoidObstacles_default()
{
	/* 'default' enter sequence for region walkAndAvoidObstacles */
	react_main_region_Awake_walkAndAvoidObstacles__entry_Default();
}

/* Default exit sequence for state Init */
void ZowiSCT::exseq_main_region_Init()
{
	/* Default exit sequence for state Init */
	stateConfVector[0] = ZowiSCT_last_state;
	stateConfVectorPosition = 0;
}

/* Default exit sequence for state Awake */
void ZowiSCT::exseq_main_region_Awake()
{
	/* Default exit sequence for state Awake */
	exseq_main_region_Awake_walkAndAvoidObstacles();
	exact_main_region_Awake();
}

/* Default exit sequence for state Welcome */
void ZowiSCT::exseq_main_region_Awake_walkAndAvoidObstacles_Welcome()
{
	/* Default exit sequence for state Welcome */
	stateConfVector[0] = ZowiSCT_last_state;
	stateConfVectorPosition = 0;
	exact_main_region_Awake_walkAndAvoidObstacles_Welcome();
}

/* Default exit sequence for state WalkStraight */
void ZowiSCT::exseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight()
{
	/* Default exit sequence for state WalkStraight */
	stateConfVector[0] = ZowiSCT_last_state;
	stateConfVectorPosition = 0;
	exact_main_region_Awake_walkAndAvoidObstacles_WalkStraight();
}

/* Default exit sequence for state TurnLeft */
void ZowiSCT::exseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft()
{
	/* Default exit sequence for state TurnLeft */
	stateConfVector[0] = ZowiSCT_last_state;
	stateConfVectorPosition = 0;
}

/* Default exit sequence for state Sleeping */
void ZowiSCT::exseq_main_region_Sleeping()
{
	/* Default exit sequence for state Sleeping */
	stateConfVector[0] = ZowiSCT_last_state;
	stateConfVectorPosition = 0;
}

/* Default exit sequence for region main region */
void ZowiSCT::exseq_main_region()
{
	/* Default exit sequence for region main region */
	/* Handle exit of all possible states (of ZowiSCT.main_region) at position 0... */
	switch(stateConfVector[ 0 ])
	{
		case main_region_Init :
		{
			exseq_main_region_Init();
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_Welcome :
		{
			exseq_main_region_Awake_walkAndAvoidObstacles_Welcome();
			exact_main_region_Awake();
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_WalkStraight :
		{
			exseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight();
			exact_main_region_Awake();
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_TurnLeft :
		{
			exseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft();
			exact_main_region_Awake();
			break;
		}
		case main_region_Sleeping :
		{
			exseq_main_region_Sleeping();
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region walkAndAvoidObstacles */
void ZowiSCT::exseq_main_region_Awake_walkAndAvoidObstacles()
{
	/* Default exit sequence for region walkAndAvoidObstacles */
	/* Handle exit of all possible states (of ZowiSCT.main_region.Awake.walkAndAvoidObstacles) at position 0... */
	switch(stateConfVector[ 0 ])
	{
		case main_region_Awake_walkAndAvoidObstacles_Welcome :
		{
			exseq_main_region_Awake_walkAndAvoidObstacles_Welcome();
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_WalkStraight :
		{
			exseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight();
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_TurnLeft :
		{
			exseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft();
			break;
		}
		default: break;
	}
}

/* The reactions of state Init. */
void ZowiSCT::react_main_region_Init()
{
	/* The reactions of state Init. */
	effect_main_region_Init_tr0();
}

/* The reactions of state Welcome. */
void ZowiSCT::react_main_region_Awake_walkAndAvoidObstacles_Welcome()
{
	/* The reactions of state Welcome. */
	if (check_main_region_Awake_tr0_tr0())
	{ 
		effect_main_region_Awake_tr0();
	}  else
	{
		if (check_main_region_Awake_walkAndAvoidObstacles_Welcome_tr0_tr0())
		{ 
			effect_main_region_Awake_walkAndAvoidObstacles_Welcome_tr0();
		} 
	}
}

/* The reactions of state WalkStraight. */
void ZowiSCT::react_main_region_Awake_walkAndAvoidObstacles_WalkStraight()
{
	/* The reactions of state WalkStraight. */
	if (check_main_region_Awake_tr0_tr0())
	{ 
		effect_main_region_Awake_tr0();
	}  else
	{
		if (check_main_region_Awake_walkAndAvoidObstacles_WalkStraight_tr0_tr0())
		{ 
			effect_main_region_Awake_walkAndAvoidObstacles_WalkStraight_tr0();
		}  else
		{
			if (check_main_region_Awake_walkAndAvoidObstacles_WalkStraight_tr1_tr1())
			{ 
				effect_main_region_Awake_walkAndAvoidObstacles_WalkStraight_tr1();
			} 
		}
	}
}

/* The reactions of state TurnLeft. */
void ZowiSCT::react_main_region_Awake_walkAndAvoidObstacles_TurnLeft()
{
	/* The reactions of state TurnLeft. */
	if (check_main_region_Awake_tr0_tr0())
	{ 
		effect_main_region_Awake_tr0();
	}  else
	{
		if (check_main_region_Awake_walkAndAvoidObstacles_TurnLeft_tr0_tr0())
		{ 
			effect_main_region_Awake_walkAndAvoidObstacles_TurnLeft_tr0();
		}  else
		{
			effect_main_region_Awake_walkAndAvoidObstacles_TurnLeft_tr1();
		}
	}
}

/* The reactions of state Sleeping. */
void ZowiSCT::react_main_region_Sleeping()
{
	/* The reactions of state Sleeping. */
	if (check_main_region_Sleeping_tr0_tr0())
	{ 
		effect_main_region_Sleeping_tr0();
	} 
}

/* Default react sequence for initial entry  */
void ZowiSCT::react_main_region__entry_Default()
{
	/* Default react sequence for initial entry  */
	enseq_main_region_Init_default();
}

/* Default react sequence for initial entry  */
void ZowiSCT::react_main_region_Awake_walkAndAvoidObstacles__entry_Default()
{
	/* Default react sequence for initial entry  */
	enseq_main_region_Awake_walkAndAvoidObstacles_Welcome_default();
}



