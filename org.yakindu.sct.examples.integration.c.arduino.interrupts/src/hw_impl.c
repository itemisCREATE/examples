#include "avr/sleep.h"
#include "hw_impl.h"

/*! Setup the hardware you're using. Activate the interrupts.
 * Digital/Analog Ports, Sensors, Actuators, Communication */
void hw_init() {
	pinMode(2, INPUT_PULLUP);
	pinMode(3, INPUT_PULLUP);
	attachInterrupt(digitalPinToInterrupt(2), ISR_in_event_one, CHANGE);
	attachInterrupt(digitalPinToInterrupt(3), ISR_in_event_two, CHANGE);

	pinMode(13, OUTPUT);
	digitalWrite(13, LOW);

	set_sleep_mode(SLEEP_MODE_ADC);
	sleep_enable();
}

/*! Update your actuators, by checking the
 * out event status */
void handle_out_events(StateMachine* handle) {
	if (stateMachineIface_israised_outEvent1(handle)) {
		digitalWrite(13, LOW);
	}
	if (stateMachineIface_israised_outEvent2(handle)) {
		digitalWrite(13, HIGH);
	}
}

/*! Occurred interrupts are stored in bool flags.
 * Handles the in events, by using these flags and
 * set them back to false for the next interrupt.*/
static volatile sc_boolean inEvent1Flag = false;
static volatile sc_boolean inEvent2Flag = false;
void handle_in_events(StateMachine* handle) {
	if (inEvent1Flag) {
		stateMachineIface_raise_inEvent1(handle);
		inEvent1Flag = false;
	}
	if (inEvent2Flag) {
		stateMachineIface_raise_inEvent2(handle);
		inEvent2Flag = false;
	}
}

/*! Interrupt Service Routine to store the pin 2 interrupt */
void ISR_in_event_one() {
	inEvent1Flag = true;
}

/*! Interrupt Service Routine to store the pin 3 interrupt */
void ISR_in_event_two() {
	inEvent2Flag = true;
}

