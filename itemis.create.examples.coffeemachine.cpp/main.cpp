#include "src-gen/CoffeeMachineCpp.h"
#include "src-gen/sc_timer_service.h"
#include "src/CoffeeMachine.hpp"
#include "src/CMHMI.hpp"
#include "src/CMTracing.h"

#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <iostream>

using namespace std;
using namespace sc::timer;

#define MAX_TIMERS 4
unsigned long time_offset = 0;
unsigned long last_time = 0;
unsigned long current_time = 0;
struct timespec sleep_time;

TimerTask tasks[MAX_TIMERS];
CoffeeMachineCpp *sm = new CoffeeMachineCpp();
TimerService *timerService = new TimerService(tasks, MAX_TIMERS);
CMTracing *tracer = new CMTracing();
Coffee_Machine machine;
CM_HMI *hmi = new CM_HMI();

unsigned long get_ms() {
	struct timeval tv;
	unsigned long ms;
	gettimeofday(&tv, 0);
	ms = tv.tv_sec * 1000 + (tv.tv_usec / 1000);
	return ms;
}

void setup() {
	time_offset = get_ms();
	sleep_time.tv_sec = 0;
	sleep_time.tv_nsec = 100;

	cout << "!!!Hello Coffee!!!" << endl;
	cout << "general commands are:" << endl;
	cout << "(o) toggle on/off" << endl;
	cout << "(t) toggle state trace" << endl;
	cout << "(q) quit" << endl;

	sm->setCm(machine);
	sm->setHmi(*hmi);
	sm->setTimerService(timerService);
	sm->setTraceObserver(tracer);
	if (!sm->check()) {
		cout << "Timer service and operation callbacks must be set!" << endl;
		exit(EXIT_FAILURE);
	}
	sm->enter();
}

void loop() {
	current_time = get_ms() - time_offset;
	timerService->proceed(current_time - last_time);
	CM_HMI::UserEvents userInput = hmi->getUserInput();
	if (userInput == CM_HMI::QUIT) {
		cout << "Bye ..." << endl;
		exit(EXIT_SUCCESS);
	}
	if (userInput != CM_HMI::NONE) {
		sm->raiseUserEvent(userInput);
	}
	if (userInput == CM_HMI::TRACING) {
		tracer->cm_trace_active = !tracer->cm_trace_active;
	}
	last_time = current_time;
	nanosleep(&sleep_time, 0);
}

int main() {
	setup();
	for (;;) {
		loop();
	}
	return 0;
}
