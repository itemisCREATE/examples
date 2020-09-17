#include <Arduino.h>
#include "src-gen/Arduino_Blinky_SCT.h"
#include "src/CPPTimerinterface.h"

Arduino_Blinky_SCT* arduino = new Arduino_Blinky_SCT();
CPPTimerInterface* timer_sct = new CPPTimerInterface();
void setup() {
	arduino->setTimerService(timer_sct);
	arduino->enter();
}

long current_time = 0;
long last_cycle_time = 0;
void loop() {
	last_cycle_time = current_time;
	current_time = millis();
	timer_sct->updateActiveTimer(arduino, current_time - last_cycle_time);
	arduino->runCycle();
}
