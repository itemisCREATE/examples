#ifndef SRC_HW_IMPL_H_
#define SRC_HW_IMPL_H_

#include "Arduino.h"
#include "../src-gen/StateMachine.h"

#ifdef __cplusplus
extern "C" {
#endif

/*! Setup the hardware you're using. Activate the interrupts.
 * Digital/Analog Ports, Sensors, Actuators, Communication */
void hw_init();

/*! Update your actuators, by checking the
 * out event status */
void handle_out_events(StateMachine* handle);

/*! Occurred interrupts are stored in bool flags.
 * Handles the in events, by using these flags and
 * set them back to false for the next interrupt.*/
void handle_in_events(StateMachine* handle);


/*! Interrupt Service Routine to store the pin 2 interrupt */
void ISR_in_event_one();

/*! Interrupt Service Routine to store the pin 3 interrupt */
void ISR_in_event_two();


#ifdef __cplusplus
}
#endif

#endif /* SRC_HW_IMPL_H_ */
