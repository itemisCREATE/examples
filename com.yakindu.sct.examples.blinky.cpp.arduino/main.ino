#include <Arduino.h>

#include "src/sc_timer_service.h"
#include "src-gen/Arduino_Blinky_SCT.h"

#define MAX_TIMER 3

Arduino_Blinky_SCT *arduino = new Arduino_Blinky_SCT();
sc::timer::TimerTask tasks[MAX_TIMER];
sc::timer::TimerService *timer_sct = new sc::timer::TimerService(tasks, MAX_TIMER);
void setup() {
	arduino->setTimerService(timer_sct);
	arduino->enter();
}

long current_time = 0;
long last_cycle_time = 0;
void loop() {
	last_cycle_time = current_time;
	current_time = millis();
	timer_sct->updateActiveTimer(current_time - last_cycle_time);
	arduino->runCycle();
}
