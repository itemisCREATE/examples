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
void handle_in_events(void *pvParameters);

/*! Update your actuators, by checking the
 * out event status */
void handle_out_events(void *pvParameters);

#ifdef __cplusplus
}
#endif

#endif /* SRC_HW_IMPL_H_ */
