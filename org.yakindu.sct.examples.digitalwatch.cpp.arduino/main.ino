#include <Arduino.h>
#include "src-gen/sc_timer_service.h"
#include "src/DisplayHandler.h"
#include "src-gen/DigitalWatch.h"

using namespace sc::timer;

#define MAX_TIMERS 10
TimerTask tasks[MAX_TIMERS];


DigitalWatch* stateMachine = new DigitalWatch();
TimerService* timer_sct = new TimerService(tasks, MAX_TIMERS);
DisplayHandler* displayHandler = new DisplayHandler();

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
			Serial.println("mode");
			stateMachine->getSCI_Button()->raise_mode();
			break;
		}
		case LEFT: {
			Serial.println("set");
			stateMachine->getSCI_Button()->raise_set();
			break;
		}
		case DOWN: {
			Serial.println("light");
			stateMachine->getSCI_Button()->raise_light();
			break;
		}
		case UP: {
			Serial.println("light_r");
			stateMachine->getSCI_Button()->raise_light_r();
			break;
		}
		case RIGHT: {
			Serial.println("onoff");
			stateMachine->getSCI_Button()->raise_onoff();
			break;
		}
		default: {
			break;
		}
		}
	}
}

void setup() {
	Serial.begin(115200);
	Serial.println("Start");
	stateMachine->setSCI_Display_OCB(displayHandler);
	stateMachine->setTimerService(timer_sct);
	stateMachine->enter();
}

long current_time = 0;
long last_cycle_time = 0;
void loop() {
	raiseEvents();
	last_cycle_time = current_time;
	current_time = millis();
	timer_sct->updateActiveTimer(stateMachine, current_time - last_cycle_time);
	stateMachine->runCycle();
}
