#include "hw_impl.h"
#include "Arduino_FreeRTOS.h"
#include "timers.h"



/*! Setup the hardware you're using.
 * Digital/Analog Ports, Sensors, Actuators, Communication */
void hw_init() {
	pinMode(2, INPUT_PULLUP);
	pinMode(3, INPUT_PULLUP);
	attachInterrupt(digitalPinToInterrupt(2), ISR_in_event_one, CHANGE);
	attachInterrupt(digitalPinToInterrupt(3), ISR_in_event_two, CHANGE);

	pinMode(13, OUTPUT);
	digitalWrite(13, LOW);

	sei();

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

/*! Occurred interrupts are stored in bool flags.
 * Handles the in events, by using these flags and
 * set them back to false for the next interrupt.*/
static volatile sc_boolean inEvent1Flag = false;
static volatile sc_boolean inEvent2Flag = false;
void handle_in_events(void *pvParameters) {
	for (;;) {
		vTaskDelay(50/portTICK_PERIOD_MS);
		if (inEvent1Flag) {
			stateMachineIface_raise_inEvent1(pvParameters);
			inEvent1Flag = false;
		}
		if (inEvent2Flag) {
			stateMachineIface_raise_inEvent2(pvParameters);
			inEvent2Flag = false;
		}
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
