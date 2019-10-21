#include "hardwareImplementation.h"
#include "avr/sleep.h"

void hardwareInit(){
	pinMode(13, OUTPUT);
	pinMode(0, INPUT);
	pinMode(1, INPUT);
	digitalWrite(13, LOW);
}


void handleInEvents(StateMachine* handle) {
	if(digitalRead(0)) {
		stateMachineIface_raise_inEvent1(handle);
	}
	if(digitalRead(1)) {
		stateMachineIface_raise_inEvent1(handle);
	}
}

void handleOutEvents(StateMachine* handle){
	if(stateMachineIface_israised_outEvent1(handle)) {
		digitalWrite(13,HIGH);
	}

	if(stateMachineIface_israised_outEvent2(handle)) {
		digitalWrite(13,LOW);
	}
}
