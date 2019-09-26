
#ifndef PUSHBUTTON_H_
#define PUSHBUTTON_H_

#include "Arduino.h"

class PushButton {
public:
	PushButton(int _pin, void (*_callback)(PushButton*)):
	state(false), pin(_pin), debounce_delay(50),
	debounce_state(LOW),last_debounce_time(0),callback(_callback)
	{

	}
	virtual ~PushButton(){}

	void readPushButton();

	boolean state;
private:
	int pin;
	unsigned long debounce_delay;
	boolean debounce_state;
	unsigned long last_debounce_time;
	void (*callback)(PushButton*);
};

#endif /* PUSHBUTTON_H_ */
