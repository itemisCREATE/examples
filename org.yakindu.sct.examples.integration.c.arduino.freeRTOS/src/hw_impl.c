#include "hw_impl.h"
#include "Arduino_FreeRTOS.h"
#include "timers.h"



/*! Setup the hardware you're using.
 * Digital/Analog Ports, Sensors, Actuators, Communication */
void hw_init() {
	pinMode(13, OUTPUT);
	pinMode(2, INPUT);
	pinMode(3, INPUT);
	digitalWrite(13, LOW);
}

/*! Update your actuators, by checking the
 * out event status */
void handle_out_events(void *pvParameters) {
	for (;;) {
		vTaskDelay(50/portTICK_PERIOD_MS);
		if (stateMachineIface_israised_outEvent1(pvParameters)) {
			digitalWrite(13, LOW);
		}
		if (stateMachineIface_israised_outEvent2(pvParameters)) {
			digitalWrite(13, HIGH);
		}
	}
}

/*! Poll the inputs/sensors.
 * Wire inputs to the according event.*/
void handle_in_events(void *pvParameters) {
	for (;;) {
		vTaskDelay(50/portTICK_PERIOD_MS);
		if (digitalRead(2) == HIGH) {
			stateMachineIface_raise_inEvent1(pvParameters);
		}
		if (digitalRead(3) == HIGH) {
			stateMachineIface_raise_inEvent2(pvParameters);
		}
	}
}
