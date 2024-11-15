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

/*! Occurred interrupts are stored in bool flags.
 * Handles the in events, by using these flags and
 * set them back to false for the next interrupt.*/
static volatile sc_boolean inEvent1Flag = false;
static volatile sc_boolean inEvent2Flag = false;
void handle_in_events(StateMachine* handle) {
	if (inEvent1Flag) {
		stateMachine_raise_inEvent1(handle);
		inEvent1Flag = false;
	}
	if (inEvent2Flag) {
		stateMachine_raise_inEvent2(handle);
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

/*! Callback for outEvent1. Setting actuator. */
void on_outEvent1(StateMachine* handle) {
	(void) handle;
	digitalWrite(13, LOW);
}

/*! Callback for outEvent2. Setting actuator. */
void on_outEvent2(StateMachine* handle) {
	(void) handle;
	digitalWrite(13, HIGH);
}

/*! Subscribe observer to state machine observables.
 * Thus, every time they will be raised,
 * the registered callback will be called. */
void subscribe_observers(StateMachine *handle,
		sc_single_subscription_observer *outEvent1Observer,
		sc_single_subscription_observer *outEvent2Observer) {

	sc_single_subscription_observer_init(outEvent1Observer, handle,
			(sc_observer_next_fp) on_outEvent1);
	sc_single_subscription_observer_subscribe(outEvent1Observer,
			&handle->iface.outEvent1);

	sc_single_subscription_observer_init(outEvent2Observer, handle,
			(sc_observer_next_fp) on_outEvent2);
	sc_single_subscription_observer_subscribe(outEvent2Observer,
			&handle->iface.outEvent2);
}
