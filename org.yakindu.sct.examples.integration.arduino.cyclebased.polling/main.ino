#include "Arduino.h"
#include "src/timerImplementation.h"
#include "src/hardwareImplementation.h"
#include "src-gen/StateMachineRequired.h"

StateMachine stateMachine;

void setup()
{
	hardwareInit();
	timerInit(&stateMachine);

	stateMachine_init(&stateMachine);
	stateMachine_enter(&stateMachine);
}

void loop()
{
	while(!stateMachine_isFinal(&stateMachine)){
		handleInEvents(&stateMachine);
		handleTimer(millis());
		stateMachine_runCycle(&stateMachine);
		handleOutEvents(&stateMachine);
	}
}
