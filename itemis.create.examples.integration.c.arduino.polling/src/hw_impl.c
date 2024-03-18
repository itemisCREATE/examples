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
