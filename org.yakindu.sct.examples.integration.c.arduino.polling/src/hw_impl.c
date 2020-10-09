#include "hw_impl.h"
#include "avr/sleep.h"

/*! Setup the hardware you're using.
 * Digital/Analog Ports, Sensors, Actuators, Communication */
void hw_init(){
	pinMode(13, OUTPUT);
	pinMode(2, INPUT);
	pinMode(3, INPUT);
	digitalWrite(13, LOW);
}

/*! Update your actuators, by checking the
 * out event status */
void handle_out_events(StateMachine* handle){
	if(stateMachine_is_raised_outEvent1(handle)) {
		digitalWrite(13,LOW);
	}
	if(stateMachine_is_raised_outEvent2(handle)) {
		digitalWrite(13,HIGH);
	}
}

/*! Poll the inputs/sensors.
 * Wire inputs to the according event.*/
void handle_in_events(StateMachine* handle) {
	if(digitalRead(2) == HIGH) {
		stateMachine_raise_inEvent1(handle);
	}
	if(digitalRead(3) == HIGH) {
		stateMachine_raise_inEvent2(handle);
	}
}
