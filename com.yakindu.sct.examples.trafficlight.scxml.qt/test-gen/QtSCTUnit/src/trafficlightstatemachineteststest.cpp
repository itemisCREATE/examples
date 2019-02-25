#include "trafficlightstatemachineteststest.h"

void TrafficLightStateMachineTestsTest::init(){
	sm = QSharedPointer<TrafficLightStateMachine>::create();
}

void TrafficLightStateMachineTestsTest::shouldOperateNormal()
{
	init();
	initializeStatemachine(sm);
	assertStateActive(sm, "yellow");
	assertStateActive(sm, "switchToGreen");
	proceedTime(1000);
	assertStateActive(sm, "green");
	proceedTime(3000);
	assertStateActive(sm, "switchToRed");
	proceedTime(1000);
	assertStateActive(sm, "red");
	proceedTime(3000);
	assertStateActive(sm, "switchToGreen");
}
void TrafficLightStateMachineTestsTest::shouldBlink()
{
	init();
	initializeStatemachine(sm);
	assertStateActive(sm, "yellow");
	assertStateActive(sm, "switchToGreen");
	raiseEvent(sm, "smash");
	assertStateActive(sm, "blinking");
	proceedTime(1000);
	assertStateActive(sm, "notBlinking");
}
void TrafficLightStateMachineTestsTest::shouldBeRepaired()
{
	init();
	initializeStatemachine(sm);
	assertStateActive(sm, "yellow");
	assertStateActive(sm, "switchToGreen");
	raiseEvent(sm, "smash");
	assertStateActive(sm, "broken");
	assertStateActive(sm, "blinking");
	raiseEvent(sm, "repair");
	assertStateActive(sm, "yellow");
	assertStateActive(sm, "switchToGreen");
}
