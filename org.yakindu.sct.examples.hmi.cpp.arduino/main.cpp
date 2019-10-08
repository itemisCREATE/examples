#include <Arduino.h>
#include "src/CPPTimerinterface.h"
#include "src/DisplayHandler.h"

ArduinoHMI* stateMachine = new ArduinoHMI();
CPPTimerInterface* timer_sct = new CPPTimerInterface();
DisplayHandler* displayHandler = new DisplayHandler();
/*
 * None : 1023
 * Select : 640
 * Left : 411/410
 * Down: 257
 * Up: 100
 * Right : 0
 */

#define NONE 0
#define SELECT 1
#define LEFT 2
#define DOWN 3
#define UP 4
#define RIGHT 5

static int readButton() {
	int result = 0;
	result = analogRead(0);
	if (result < 50) {
		return RIGHT;
	}
	if (result < 150) {
		return UP;
	}
	if (result < 300) {
		return DOWN;
	}
	if (result < 550) {
		return LEFT;
	}
	if (result < 850) {
		return SELECT;
	}
	return NONE;
}

int oldState = NONE;
static void raiseEvents() {
	int buttonPressed = readButton();
	delay(80);
	oldState = buttonPressed;
	if (oldState != NONE && readButton() == NONE) {
		switch (oldState) {
		case SELECT: {
			stateMachine->raise_select();
			break;
		}
		case LEFT: {
			stateMachine->raise_left();
			break;
		}
		case DOWN: {
			stateMachine->raise_down();
			break;
		}
		case UP: {
			stateMachine->raise_up();
			break;
		}
		case RIGHT: {
			stateMachine->raise_right();
			break;
		}
		default: {
			break;
		}
		}
	}
}

void setup() {
	stateMachine->setDefaultSCI_OCB(displayHandler);
	stateMachine->setTimer(timer_sct);
	stateMachine->init();
	stateMachine->enter();
}

void loop() {
	long current_time = 0;
	long last_cycle_time = 0;
	raiseEvents();
	last_cycle_time = current_time;
	current_time = millis();
	timer_sct->updateActiveTimer(stateMachine, current_time - last_cycle_time);
	stateMachine->runCycle();
}
