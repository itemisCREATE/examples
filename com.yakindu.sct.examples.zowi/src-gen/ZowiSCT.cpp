
#include "ZowiSCT.h"
#include <string.h>

/*! \file Implementation of the state machine 'ZowiSCT'
*/



ZowiSCT::ZowiSCT():
	timer(null),
	stateConfVectorPosition(0),
	iface()
{
	for (sc_ushort i = 0; i < maxHistoryStates; ++i)
		historyVector[i] = ZowiSCT_last_state;
		
}

ZowiSCT::~ZowiSCT()
{
}

const int32_t ZowiSCT::DefaultSCI::maxRounds = 3;


void ZowiSCT::init()
{
	for (sc_ushort i = 0; i < maxOrthogonalStates; ++i)
		stateConfVector[i] = ZowiSCT_last_state;
	
	for (sc_ushort i = 0; i < maxHistoryStates; ++i)
		historyVector[i] = ZowiSCT_last_state;
	
	stateConfVectorPosition = 0;

	clearInEvents();
	clearOutEvents();
	
	/* Default init sequence for statechart ZowiSCT */
	iface.distance = 20.0;
	iface.noise = 700;
	iface.roundCounter = 0;
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
		case main_region_WelcomeZowi :
		{
			main_region_WelcomeZowi_react(true);
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_WalkStraight :
		{
			main_region_Awake_walkAndAvoidObstacles_WalkStraight_react(true);
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_WaitForTurn :
		{
			main_region_Awake_walkAndAvoidObstacles_WaitForTurn_react(true);
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_TurnLeft :
		{
			main_region_Awake_walkAndAvoidObstacles_TurnLeft_react(true);
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_WaitForWalking :
		{
			main_region_Awake_walkAndAvoidObstacles_WaitForWalking_react(true);
			break;
		}
		case main_region_IsSomeOneHere__Changing_mood_Suprised :
		{
			main_region_IsSomeOneHere__Changing_mood_Suprised_react(true);
			break;
		}
		case main_region_IsSomeOneHere__Changing_mood_Sad :
		{
			main_region_IsSomeOneHere__Changing_mood_Sad_react(true);
			break;
		}
		case main_region_ObstacleDetected_RemoveTheObstacle_WalkBack :
		{
			main_region_ObstacleDetected_RemoveTheObstacle_WalkBack_react(true);
			break;
		}
		case main_region_ObstacleDetected_RemoveTheObstacle_WalkForward :
		{
			main_region_ObstacleDetected_RemoveTheObstacle_WalkForward_react(true);
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
	timeEvents[3] = false; 
	timeEvents[4] = false; 
	timeEvents[5] = false; 
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
		case main_region_WelcomeZowi : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_REGION_WELCOMEZOWI] == main_region_WelcomeZowi
			);
		case main_region_Awake : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_REGION_AWAKE] >= main_region_Awake
				&& stateConfVector[SCVI_MAIN_REGION_AWAKE] <= main_region_Awake_walkAndAvoidObstacles_WaitForWalking);
		case main_region_Awake_walkAndAvoidObstacles_WalkStraight : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_REGION_AWAKE_WALKANDAVOIDOBSTACLES_WALKSTRAIGHT] == main_region_Awake_walkAndAvoidObstacles_WalkStraight
			);
		case main_region_Awake_walkAndAvoidObstacles_WaitForTurn : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_REGION_AWAKE_WALKANDAVOIDOBSTACLES_WAITFORTURN] == main_region_Awake_walkAndAvoidObstacles_WaitForTurn
			);
		case main_region_Awake_walkAndAvoidObstacles_TurnLeft : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_REGION_AWAKE_WALKANDAVOIDOBSTACLES_TURNLEFT] == main_region_Awake_walkAndAvoidObstacles_TurnLeft
			);
		case main_region_Awake_walkAndAvoidObstacles_WaitForWalking : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_REGION_AWAKE_WALKANDAVOIDOBSTACLES_WAITFORWALKING] == main_region_Awake_walkAndAvoidObstacles_WaitForWalking
			);
		case main_region_IsSomeOneHere_ : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_REGION_ISSOMEONEHERE_] >= main_region_IsSomeOneHere_
				&& stateConfVector[SCVI_MAIN_REGION_ISSOMEONEHERE_] <= main_region_IsSomeOneHere__Changing_mood_Sad);
		case main_region_IsSomeOneHere__Changing_mood_Suprised : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_REGION_ISSOMEONEHERE__CHANGING_MOOD_SUPRISED] == main_region_IsSomeOneHere__Changing_mood_Suprised
			);
		case main_region_IsSomeOneHere__Changing_mood_Sad : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_REGION_ISSOMEONEHERE__CHANGING_MOOD_SAD] == main_region_IsSomeOneHere__Changing_mood_Sad
			);
		case main_region_ObstacleDetected : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_REGION_OBSTACLEDETECTED] >= main_region_ObstacleDetected
				&& stateConfVector[SCVI_MAIN_REGION_OBSTACLEDETECTED] <= main_region_ObstacleDetected_RemoveTheObstacle_WalkForward);
		case main_region_ObstacleDetected_RemoveTheObstacle_WalkBack : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_REGION_OBSTACLEDETECTED_REMOVETHEOBSTACLE_WALKBACK] == main_region_ObstacleDetected_RemoveTheObstacle_WalkBack
			);
		case main_region_ObstacleDetected_RemoveTheObstacle_WalkForward : 
			return (sc_boolean) (stateConfVector[SCVI_MAIN_REGION_OBSTACLEDETECTED_REMOVETHEOBSTACLE_WALKFORWARD] == main_region_ObstacleDetected_RemoveTheObstacle_WalkForward
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

uint32_t ZowiSCT::DefaultSCI::get_roundCounter() const
{
	return roundCounter;
}

uint32_t ZowiSCT::get_roundCounter() const
{
	return iface.roundCounter;
}

void ZowiSCT::DefaultSCI::set_roundCounter(uint32_t value)
{
	roundCounter = value;
}

void ZowiSCT::set_roundCounter(uint32_t value)
{
	iface.roundCounter = value;
}

const int32_t ZowiSCT::DefaultSCI::get_maxRounds() const
{
	return maxRounds;
}

const int32_t ZowiSCT::get_maxRounds() const
{
	return ZowiSCT::DefaultSCI::maxRounds;
}


// implementations of all internal functions

/* Entry action for state 'WelcomeZowi'. */
void ZowiSCT::enact_main_region_WelcomeZowi()
{
	/* Entry action for state 'WelcomeZowi'. */
	iface.zowi.init(PIN_YL, PIN_YR, PIN_RL, PIN_RR);
	iface.zowi.home();
}

/* Entry action for state 'WalkStraight'. */
void ZowiSCT::enact_main_region_Awake_walkAndAvoidObstacles_WalkStraight()
{
	/* Entry action for state 'WalkStraight'. */
	iface.zowi.putMouth(iface.roundCounter);
	iface.zowi.walk();
}

/* Entry action for state 'WaitForTurn'. */
void ZowiSCT::enact_main_region_Awake_walkAndAvoidObstacles_WaitForTurn()
{
	/* Entry action for state 'WaitForTurn'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[0]), 2 * 1000, false);
	iface.zowi.home();
	iface.zowi.sing(S_superHappy);
}

/* Entry action for state 'TurnLeft'. */
void ZowiSCT::enact_main_region_Awake_walkAndAvoidObstacles_TurnLeft()
{
	/* Entry action for state 'TurnLeft'. */
	iface.zowi.putMouth(bigSurprise);
	iface.zowi.turn();
}

/* Entry action for state 'WaitForWalking'. */
void ZowiSCT::enact_main_region_Awake_walkAndAvoidObstacles_WaitForWalking()
{
	/* Entry action for state 'WaitForWalking'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[1]), 2 * 1000, false);
	iface.zowi.home();
	iface.zowi.putMouth(heart);
}

/* Entry action for state 'Suprised'. */
void ZowiSCT::enact_main_region_IsSomeOneHere__Changing_mood_Suprised()
{
	/* Entry action for state 'Suprised'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[2]), 5 * 1000, false);
	iface.zowi.putMouth(bigSurprise);
}

/* Entry action for state 'Sad'. */
void ZowiSCT::enact_main_region_IsSomeOneHere__Changing_mood_Sad()
{
	/* Entry action for state 'Sad'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[3]), 5 * 1000, false);
	iface.zowi.putMouth(sadClosed);
}

/* Entry action for state 'WalkBack'. */
void ZowiSCT::enact_main_region_ObstacleDetected_RemoveTheObstacle_WalkBack()
{
	/* Entry action for state 'WalkBack'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[4]), 2 * 1000, false);
	iface.zowi.home();
	iface.zowi.walk(2, 1000, BACKWARD);
}

/* Entry action for state 'WalkForward'. */
void ZowiSCT::enact_main_region_ObstacleDetected_RemoveTheObstacle_WalkForward()
{
	/* Entry action for state 'WalkForward'. */
	timer->setTimer(this, (sc_eventid)(&timeEvents[5]), 2 * 1000, false);
	iface.zowi.home();
	iface.zowi.walk(2, 1000, FORWARD);
}

/* Exit action for state 'Awake'. */
void ZowiSCT::exact_main_region_Awake()
{
	/* Exit action for state 'Awake'. */
	iface.roundCounter = 0;
}

/* Exit action for state 'WaitForTurn'. */
void ZowiSCT::exact_main_region_Awake_walkAndAvoidObstacles_WaitForTurn()
{
	/* Exit action for state 'WaitForTurn'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[0]));
}

/* Exit action for state 'WaitForWalking'. */
void ZowiSCT::exact_main_region_Awake_walkAndAvoidObstacles_WaitForWalking()
{
	/* Exit action for state 'WaitForWalking'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[1]));
	iface.roundCounter++;
}

/* Exit action for state 'Suprised'. */
void ZowiSCT::exact_main_region_IsSomeOneHere__Changing_mood_Suprised()
{
	/* Exit action for state 'Suprised'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[2]));
}

/* Exit action for state 'Sad'. */
void ZowiSCT::exact_main_region_IsSomeOneHere__Changing_mood_Sad()
{
	/* Exit action for state 'Sad'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[3]));
}

/* Exit action for state 'WalkBack'. */
void ZowiSCT::exact_main_region_ObstacleDetected_RemoveTheObstacle_WalkBack()
{
	/* Exit action for state 'WalkBack'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[4]));
}

/* Exit action for state 'WalkForward'. */
void ZowiSCT::exact_main_region_ObstacleDetected_RemoveTheObstacle_WalkForward()
{
	/* Exit action for state 'WalkForward'. */
	timer->unsetTimer(this, (sc_eventid)(&timeEvents[5]));
}

/* 'default' enter sequence for state WelcomeZowi */
void ZowiSCT::enseq_main_region_WelcomeZowi_default()
{
	/* 'default' enter sequence for state WelcomeZowi */
	enact_main_region_WelcomeZowi();
	stateConfVector[0] = main_region_WelcomeZowi;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Awake */
void ZowiSCT::enseq_main_region_Awake_default()
{
	/* 'default' enter sequence for state Awake */
	enseq_main_region_Awake_walkAndAvoidObstacles_default();
}

/* 'default' enter sequence for state WalkStraight */
void ZowiSCT::enseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight_default()
{
	/* 'default' enter sequence for state WalkStraight */
	enact_main_region_Awake_walkAndAvoidObstacles_WalkStraight();
	stateConfVector[0] = main_region_Awake_walkAndAvoidObstacles_WalkStraight;
	stateConfVectorPosition = 0;
	historyVector[0] = stateConfVector[0];
}

/* 'default' enter sequence for state WaitForTurn */
void ZowiSCT::enseq_main_region_Awake_walkAndAvoidObstacles_WaitForTurn_default()
{
	/* 'default' enter sequence for state WaitForTurn */
	enact_main_region_Awake_walkAndAvoidObstacles_WaitForTurn();
	stateConfVector[0] = main_region_Awake_walkAndAvoidObstacles_WaitForTurn;
	stateConfVectorPosition = 0;
	historyVector[0] = stateConfVector[0];
}

/* 'default' enter sequence for state TurnLeft */
void ZowiSCT::enseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft_default()
{
	/* 'default' enter sequence for state TurnLeft */
	enact_main_region_Awake_walkAndAvoidObstacles_TurnLeft();
	stateConfVector[0] = main_region_Awake_walkAndAvoidObstacles_TurnLeft;
	stateConfVectorPosition = 0;
	historyVector[0] = stateConfVector[0];
}

/* 'default' enter sequence for state WaitForWalking */
void ZowiSCT::enseq_main_region_Awake_walkAndAvoidObstacles_WaitForWalking_default()
{
	/* 'default' enter sequence for state WaitForWalking */
	enact_main_region_Awake_walkAndAvoidObstacles_WaitForWalking();
	stateConfVector[0] = main_region_Awake_walkAndAvoidObstacles_WaitForWalking;
	stateConfVectorPosition = 0;
	historyVector[0] = stateConfVector[0];
}

/* 'default' enter sequence for state IsSomeOneHere? */
void ZowiSCT::enseq_main_region_IsSomeOneHere__default()
{
	/* 'default' enter sequence for state IsSomeOneHere? */
	enseq_main_region_IsSomeOneHere__Changing_mood_default();
}

/* 'default' enter sequence for state Suprised */
void ZowiSCT::enseq_main_region_IsSomeOneHere__Changing_mood_Suprised_default()
{
	/* 'default' enter sequence for state Suprised */
	enact_main_region_IsSomeOneHere__Changing_mood_Suprised();
	stateConfVector[0] = main_region_IsSomeOneHere__Changing_mood_Suprised;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state Sad */
void ZowiSCT::enseq_main_region_IsSomeOneHere__Changing_mood_Sad_default()
{
	/* 'default' enter sequence for state Sad */
	enact_main_region_IsSomeOneHere__Changing_mood_Sad();
	stateConfVector[0] = main_region_IsSomeOneHere__Changing_mood_Sad;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state ObstacleDetected */
void ZowiSCT::enseq_main_region_ObstacleDetected_default()
{
	/* 'default' enter sequence for state ObstacleDetected */
	enseq_main_region_ObstacleDetected_RemoveTheObstacle_default();
}

/* 'default' enter sequence for state WalkBack */
void ZowiSCT::enseq_main_region_ObstacleDetected_RemoveTheObstacle_WalkBack_default()
{
	/* 'default' enter sequence for state WalkBack */
	enact_main_region_ObstacleDetected_RemoveTheObstacle_WalkBack();
	stateConfVector[0] = main_region_ObstacleDetected_RemoveTheObstacle_WalkBack;
	stateConfVectorPosition = 0;
}

/* 'default' enter sequence for state WalkForward */
void ZowiSCT::enseq_main_region_ObstacleDetected_RemoveTheObstacle_WalkForward_default()
{
	/* 'default' enter sequence for state WalkForward */
	enact_main_region_ObstacleDetected_RemoveTheObstacle_WalkForward();
	stateConfVector[0] = main_region_ObstacleDetected_RemoveTheObstacle_WalkForward;
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

/* shallow enterSequence with history in child walkAndAvoidObstacles */
void ZowiSCT::shenseq_main_region_Awake_walkAndAvoidObstacles()
{
	/* shallow enterSequence with history in child walkAndAvoidObstacles */
	/* Handle shallow history entry of walkAndAvoidObstacles */
	switch(historyVector[ 0 ])
	{
		case main_region_Awake_walkAndAvoidObstacles_WalkStraight :
		{
			enseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight_default();
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_WaitForTurn :
		{
			enseq_main_region_Awake_walkAndAvoidObstacles_WaitForTurn_default();
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_TurnLeft :
		{
			enseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft_default();
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_WaitForWalking :
		{
			enseq_main_region_Awake_walkAndAvoidObstacles_WaitForWalking_default();
			break;
		}
		default: break;
	}
}

/* 'default' enter sequence for region Changing mood */
void ZowiSCT::enseq_main_region_IsSomeOneHere__Changing_mood_default()
{
	/* 'default' enter sequence for region Changing mood */
	react_main_region_IsSomeOneHere__Changing_mood__entry_Default();
}

/* 'default' enter sequence for region RemoveTheObstacle */
void ZowiSCT::enseq_main_region_ObstacleDetected_RemoveTheObstacle_default()
{
	/* 'default' enter sequence for region RemoveTheObstacle */
	react_main_region_ObstacleDetected_RemoveTheObstacle__entry_Default();
}

/* Default exit sequence for state WelcomeZowi */
void ZowiSCT::exseq_main_region_WelcomeZowi()
{
	/* Default exit sequence for state WelcomeZowi */
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

/* Default exit sequence for state WalkStraight */
void ZowiSCT::exseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight()
{
	/* Default exit sequence for state WalkStraight */
	stateConfVector[0] = ZowiSCT_last_state;
	stateConfVectorPosition = 0;
}

/* Default exit sequence for state WaitForTurn */
void ZowiSCT::exseq_main_region_Awake_walkAndAvoidObstacles_WaitForTurn()
{
	/* Default exit sequence for state WaitForTurn */
	stateConfVector[0] = ZowiSCT_last_state;
	stateConfVectorPosition = 0;
	exact_main_region_Awake_walkAndAvoidObstacles_WaitForTurn();
}

/* Default exit sequence for state TurnLeft */
void ZowiSCT::exseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft()
{
	/* Default exit sequence for state TurnLeft */
	stateConfVector[0] = ZowiSCT_last_state;
	stateConfVectorPosition = 0;
}

/* Default exit sequence for state WaitForWalking */
void ZowiSCT::exseq_main_region_Awake_walkAndAvoidObstacles_WaitForWalking()
{
	/* Default exit sequence for state WaitForWalking */
	stateConfVector[0] = ZowiSCT_last_state;
	stateConfVectorPosition = 0;
	exact_main_region_Awake_walkAndAvoidObstacles_WaitForWalking();
}

/* Default exit sequence for state IsSomeOneHere? */
void ZowiSCT::exseq_main_region_IsSomeOneHere_()
{
	/* Default exit sequence for state IsSomeOneHere? */
	exseq_main_region_IsSomeOneHere__Changing_mood();
}

/* Default exit sequence for state Suprised */
void ZowiSCT::exseq_main_region_IsSomeOneHere__Changing_mood_Suprised()
{
	/* Default exit sequence for state Suprised */
	stateConfVector[0] = ZowiSCT_last_state;
	stateConfVectorPosition = 0;
	exact_main_region_IsSomeOneHere__Changing_mood_Suprised();
}

/* Default exit sequence for state Sad */
void ZowiSCT::exseq_main_region_IsSomeOneHere__Changing_mood_Sad()
{
	/* Default exit sequence for state Sad */
	stateConfVector[0] = ZowiSCT_last_state;
	stateConfVectorPosition = 0;
	exact_main_region_IsSomeOneHere__Changing_mood_Sad();
}

/* Default exit sequence for state ObstacleDetected */
void ZowiSCT::exseq_main_region_ObstacleDetected()
{
	/* Default exit sequence for state ObstacleDetected */
	exseq_main_region_ObstacleDetected_RemoveTheObstacle();
}

/* Default exit sequence for state WalkBack */
void ZowiSCT::exseq_main_region_ObstacleDetected_RemoveTheObstacle_WalkBack()
{
	/* Default exit sequence for state WalkBack */
	stateConfVector[0] = ZowiSCT_last_state;
	stateConfVectorPosition = 0;
	exact_main_region_ObstacleDetected_RemoveTheObstacle_WalkBack();
}

/* Default exit sequence for state WalkForward */
void ZowiSCT::exseq_main_region_ObstacleDetected_RemoveTheObstacle_WalkForward()
{
	/* Default exit sequence for state WalkForward */
	stateConfVector[0] = ZowiSCT_last_state;
	stateConfVectorPosition = 0;
	exact_main_region_ObstacleDetected_RemoveTheObstacle_WalkForward();
}

/* Default exit sequence for region main region */
void ZowiSCT::exseq_main_region()
{
	/* Default exit sequence for region main region */
	/* Handle exit of all possible states (of ZowiSCT.main_region) at position 0... */
	switch(stateConfVector[ 0 ])
	{
		case main_region_WelcomeZowi :
		{
			exseq_main_region_WelcomeZowi();
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_WalkStraight :
		{
			exseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight();
			exact_main_region_Awake();
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_WaitForTurn :
		{
			exseq_main_region_Awake_walkAndAvoidObstacles_WaitForTurn();
			exact_main_region_Awake();
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_TurnLeft :
		{
			exseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft();
			exact_main_region_Awake();
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_WaitForWalking :
		{
			exseq_main_region_Awake_walkAndAvoidObstacles_WaitForWalking();
			exact_main_region_Awake();
			break;
		}
		case main_region_IsSomeOneHere__Changing_mood_Suprised :
		{
			exseq_main_region_IsSomeOneHere__Changing_mood_Suprised();
			break;
		}
		case main_region_IsSomeOneHere__Changing_mood_Sad :
		{
			exseq_main_region_IsSomeOneHere__Changing_mood_Sad();
			break;
		}
		case main_region_ObstacleDetected_RemoveTheObstacle_WalkBack :
		{
			exseq_main_region_ObstacleDetected_RemoveTheObstacle_WalkBack();
			break;
		}
		case main_region_ObstacleDetected_RemoveTheObstacle_WalkForward :
		{
			exseq_main_region_ObstacleDetected_RemoveTheObstacle_WalkForward();
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
		case main_region_Awake_walkAndAvoidObstacles_WalkStraight :
		{
			exseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight();
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_WaitForTurn :
		{
			exseq_main_region_Awake_walkAndAvoidObstacles_WaitForTurn();
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_TurnLeft :
		{
			exseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft();
			break;
		}
		case main_region_Awake_walkAndAvoidObstacles_WaitForWalking :
		{
			exseq_main_region_Awake_walkAndAvoidObstacles_WaitForWalking();
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region Changing mood */
void ZowiSCT::exseq_main_region_IsSomeOneHere__Changing_mood()
{
	/* Default exit sequence for region Changing mood */
	/* Handle exit of all possible states (of ZowiSCT.main_region.IsSomeOneHere_.Changing_mood) at position 0... */
	switch(stateConfVector[ 0 ])
	{
		case main_region_IsSomeOneHere__Changing_mood_Suprised :
		{
			exseq_main_region_IsSomeOneHere__Changing_mood_Suprised();
			break;
		}
		case main_region_IsSomeOneHere__Changing_mood_Sad :
		{
			exseq_main_region_IsSomeOneHere__Changing_mood_Sad();
			break;
		}
		default: break;
	}
}

/* Default exit sequence for region RemoveTheObstacle */
void ZowiSCT::exseq_main_region_ObstacleDetected_RemoveTheObstacle()
{
	/* Default exit sequence for region RemoveTheObstacle */
	/* Handle exit of all possible states (of ZowiSCT.main_region.ObstacleDetected.RemoveTheObstacle) at position 0... */
	switch(stateConfVector[ 0 ])
	{
		case main_region_ObstacleDetected_RemoveTheObstacle_WalkBack :
		{
			exseq_main_region_ObstacleDetected_RemoveTheObstacle_WalkBack();
			break;
		}
		case main_region_ObstacleDetected_RemoveTheObstacle_WalkForward :
		{
			exseq_main_region_ObstacleDetected_RemoveTheObstacle_WalkForward();
			break;
		}
		default: break;
	}
}

/* Default react sequence for initial entry  */
void ZowiSCT::react_main_region__entry_Default()
{
	/* Default react sequence for initial entry  */
	enseq_main_region_WelcomeZowi_default();
}

/* Default react sequence for shallow history entry  */
void ZowiSCT::react_main_region_Awake_walkAndAvoidObstacles__entry_Default()
{
	/* Default react sequence for shallow history entry  */
	/* Enter the region with shallow history */
	if (historyVector[0] != ZowiSCT_last_state)
	{
		shenseq_main_region_Awake_walkAndAvoidObstacles();
	} else
	{
		enseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight_default();
	} 
}

/* Default react sequence for initial entry  */
void ZowiSCT::react_main_region_IsSomeOneHere__Changing_mood__entry_Default()
{
	/* Default react sequence for initial entry  */
	enseq_main_region_IsSomeOneHere__Changing_mood_Suprised_default();
}

/* Default react sequence for initial entry  */
void ZowiSCT::react_main_region_ObstacleDetected_RemoveTheObstacle__entry_Default()
{
	/* Default react sequence for initial entry  */
	enseq_main_region_ObstacleDetected_RemoveTheObstacle_WalkBack_default();
}

sc_boolean ZowiSCT::react(const sc_boolean try_transition) {
	/* State machine reactions. */
	return false;
}

sc_boolean ZowiSCT::main_region_WelcomeZowi_react(const sc_boolean try_transition) {
	/* The reactions of state WelcomeZowi. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (((react(try_transition)) == (false)))
		{ 
			exseq_main_region_WelcomeZowi();
			enseq_main_region_Awake_default();
		} 
	} 
	if (((did_transition) == (false)))
	{ 
	} 
	return did_transition;
}

sc_boolean ZowiSCT::main_region_Awake_react(const sc_boolean try_transition) {
	/* The reactions of state Awake. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (((react(try_transition)) == (false)))
		{ 
			if (((true)) && ((((iface.roundCounter) > (ZowiSCT::DefaultSCI::maxRounds)))))
			{ 
				exseq_main_region_Awake();
				enseq_main_region_IsSomeOneHere__default();
			}  else
			{
				if (((true)) && ((((iface.zowi.getDistance()) < (iface.distance)))))
				{ 
					exseq_main_region_Awake();
					enseq_main_region_ObstacleDetected_default();
				}  else
				{
					did_transition = false;
				}
			}
		} 
	} 
	if (((did_transition) == (false)))
	{ 
	} 
	return did_transition;
}

sc_boolean ZowiSCT::main_region_Awake_walkAndAvoidObstacles_WalkStraight_react(const sc_boolean try_transition) {
	/* The reactions of state WalkStraight. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (((main_region_Awake_react(try_transition)) == (false)))
		{ 
			exseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight();
			enseq_main_region_Awake_walkAndAvoidObstacles_WaitForTurn_default();
		} 
	} 
	if (((did_transition) == (false)))
	{ 
	} 
	return did_transition;
}

sc_boolean ZowiSCT::main_region_Awake_walkAndAvoidObstacles_WaitForTurn_react(const sc_boolean try_transition) {
	/* The reactions of state WaitForTurn. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (((main_region_Awake_react(try_transition)) == (false)))
		{ 
			if (timeEvents[0])
			{ 
				exseq_main_region_Awake_walkAndAvoidObstacles_WaitForTurn();
				enseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft_default();
			}  else
			{
				did_transition = false;
			}
		} 
	} 
	if (((did_transition) == (false)))
	{ 
	} 
	return did_transition;
}

sc_boolean ZowiSCT::main_region_Awake_walkAndAvoidObstacles_TurnLeft_react(const sc_boolean try_transition) {
	/* The reactions of state TurnLeft. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (((main_region_Awake_react(try_transition)) == (false)))
		{ 
			exseq_main_region_Awake_walkAndAvoidObstacles_TurnLeft();
			enseq_main_region_Awake_walkAndAvoidObstacles_WaitForWalking_default();
		} 
	} 
	if (((did_transition) == (false)))
	{ 
	} 
	return did_transition;
}

sc_boolean ZowiSCT::main_region_Awake_walkAndAvoidObstacles_WaitForWalking_react(const sc_boolean try_transition) {
	/* The reactions of state WaitForWalking. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (((main_region_Awake_react(try_transition)) == (false)))
		{ 
			if (timeEvents[1])
			{ 
				exseq_main_region_Awake_walkAndAvoidObstacles_WaitForWalking();
				enseq_main_region_Awake_walkAndAvoidObstacles_WalkStraight_default();
			}  else
			{
				did_transition = false;
			}
		} 
	} 
	if (((did_transition) == (false)))
	{ 
	} 
	return did_transition;
}

sc_boolean ZowiSCT::main_region_IsSomeOneHere__react(const sc_boolean try_transition) {
	/* The reactions of state IsSomeOneHere?. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (((react(try_transition)) == (false)))
		{ 
			if (((true)) && ((((iface.zowi.getNoise()) > (iface.noise)))))
			{ 
				exseq_main_region_IsSomeOneHere_();
				iface.roundCounter = 0;
				enseq_main_region_Awake_default();
			}  else
			{
				did_transition = false;
			}
		} 
	} 
	if (((did_transition) == (false)))
	{ 
	} 
	return did_transition;
}

sc_boolean ZowiSCT::main_region_IsSomeOneHere__Changing_mood_Suprised_react(const sc_boolean try_transition) {
	/* The reactions of state Suprised. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (((main_region_IsSomeOneHere__react(try_transition)) == (false)))
		{ 
			if (timeEvents[2])
			{ 
				exseq_main_region_IsSomeOneHere__Changing_mood_Suprised();
				enseq_main_region_IsSomeOneHere__Changing_mood_Sad_default();
			}  else
			{
				did_transition = false;
			}
		} 
	} 
	if (((did_transition) == (false)))
	{ 
	} 
	return did_transition;
}

sc_boolean ZowiSCT::main_region_IsSomeOneHere__Changing_mood_Sad_react(const sc_boolean try_transition) {
	/* The reactions of state Sad. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (((main_region_IsSomeOneHere__react(try_transition)) == (false)))
		{ 
			if (timeEvents[3])
			{ 
				exseq_main_region_IsSomeOneHere__Changing_mood_Sad();
				enseq_main_region_IsSomeOneHere__Changing_mood_Suprised_default();
			}  else
			{
				did_transition = false;
			}
		} 
	} 
	if (((did_transition) == (false)))
	{ 
	} 
	return did_transition;
}

sc_boolean ZowiSCT::main_region_ObstacleDetected_react(const sc_boolean try_transition) {
	/* The reactions of state ObstacleDetected. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (((react(try_transition)) == (false)))
		{ 
			if (((true)) && ((((iface.zowi.getDistance()) >= (iface.distance)))))
			{ 
				exseq_main_region_ObstacleDetected();
				enseq_main_region_Awake_default();
			}  else
			{
				did_transition = false;
			}
		} 
	} 
	if (((did_transition) == (false)))
	{ 
	} 
	return did_transition;
}

sc_boolean ZowiSCT::main_region_ObstacleDetected_RemoveTheObstacle_WalkBack_react(const sc_boolean try_transition) {
	/* The reactions of state WalkBack. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (((main_region_ObstacleDetected_react(try_transition)) == (false)))
		{ 
			if (timeEvents[4])
			{ 
				exseq_main_region_ObstacleDetected_RemoveTheObstacle_WalkBack();
				enseq_main_region_ObstacleDetected_RemoveTheObstacle_WalkForward_default();
			}  else
			{
				did_transition = false;
			}
		} 
	} 
	if (((did_transition) == (false)))
	{ 
	} 
	return did_transition;
}

sc_boolean ZowiSCT::main_region_ObstacleDetected_RemoveTheObstacle_WalkForward_react(const sc_boolean try_transition) {
	/* The reactions of state WalkForward. */
	sc_boolean did_transition = try_transition;
	if (try_transition)
	{ 
		if (((main_region_ObstacleDetected_react(try_transition)) == (false)))
		{ 
			if (timeEvents[5])
			{ 
				exseq_main_region_ObstacleDetected_RemoveTheObstacle_WalkForward();
				enseq_main_region_ObstacleDetected_RemoveTheObstacle_WalkBack_default();
			}  else
			{
				did_transition = false;
			}
		} 
	} 
	if (((did_transition) == (false)))
	{ 
	} 
	return did_transition;
}




