#include "PushButton.h"

void PushButton::readPushButton(){

	int pin_value = digitalRead(pin);

	if (pin_value != debounce_state) {
		last_debounce_time = millis();
	}

	if ((millis() - last_debounce_time) > debounce_delay) {
		if (pin_value != state) {
			state = pin_value;
			callback(this);
		}
	}

	debounce_state = pin_value;

}
