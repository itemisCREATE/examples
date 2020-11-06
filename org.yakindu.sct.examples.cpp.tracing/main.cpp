#include "sc/Tictoc.h"
#include "sc/base/sc_timer_service.h"

#include "Hmi.h"
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <iostream>

using namespace std;
using namespace sc::timer;

#define MAX_TIMERS 4
unsigned long timestamp_offset = 0;
unsigned long last_time = 0;
struct timespec sleep_time;

// allocate required objects statically
Tictoc sm;
TimerTask tasks[MAX_TIMERS];
TimerService timerService(tasks, MAX_TIMERS);

Hmi hmi(sm);



unsigned long get_ms() {
	struct timeval tv;
	unsigned long ms;
	gettimeofday(&tv, 0);
	ms = tv.tv_sec * 1000 + (tv.tv_usec / 1000);
	return ms;
}

void setup() {

	timestamp_offset = get_ms();
	sleep_time.tv_sec = 0;
	sleep_time.tv_nsec = 100;
	last_time = 0;


	sm.setTimerService(&timerService);
	if (! sm.check()) {
		cout << "Timer service and operation callbacks must be set!" << endl;
		exit(EXIT_FAILURE);
	}
	sm.enter();

	hmi.help();
}

void loop() {

	nanosleep(&sleep_time, 0);

	unsigned long time = get_ms() - timestamp_offset;
	// yet_timestamp time = yet_current_timestamp();
	timerService.proceed(time - last_time);
	last_time = time;

	hmi.proceed();
//	yet_udp_stream_receive(&yet_stream);
}


int main() {

	setup();

	for (;;) {
		loop();
	}
	return 0;
}
