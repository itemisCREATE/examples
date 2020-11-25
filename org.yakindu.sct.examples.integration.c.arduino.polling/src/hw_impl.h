#ifndef SRC_HW_IMPL_H_
#define SRC_HW_IMPL_H_

#include "Arduino.h"
#include "../src-gen/StateMachine.h"

#ifdef __cplusplus
extern "C" {
#endif

/*! Setup the hardware you're using.
 * Digital/Analog Ports, Sensors, Actuators, Communication */
void hw_init();

/*! Poll the inputs/sensors.
 * Wire inputs to the according event.*/
void handle_in_events(StateMachine* handle);

/*! Update your actuators, by checking the
 * out event status */
void handle_out_events(StateMachine* handle);


/*! Callback for outEvent1. Setting actuator. */
void on_outEvent1(StateMachine* handle);

/*! Callback for outEvent2. Setting actuator. */
void on_outEvent2(StateMachine* handle);

/*! Subscribe observer to state machine observables.
 * Thus, every time they will be raised,
 * the registered callback will be called. */
void subscribe_observers(StateMachine *handle,
		sc_single_subscription_observer *outEvent1Observer,
		sc_single_subscription_observer *outEvent2Observer);

#ifdef __cplusplus
}
#endif

#endif /* SRC_HW_IMPL_H_ */
