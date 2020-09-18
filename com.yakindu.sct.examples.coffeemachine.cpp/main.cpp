#include "src-gen/CoffeeMachineCpp.h"
#include "src/CMHMI.hpp"
#include "src/CoffeeMachine.hpp"
#include <pthread.h>
#include "src/sc_runner.h"
#include "src/sc_timer_service.h"
#include <iostream>

using namespace std;

static pthread_mutex_t coffe_state_machine_mutex = PTHREAD_MUTEX_INITIALIZER;


int main(int argc, char **argv) {
	CoffeeMachineCpp* sm = new CoffeeMachineCpp();
	TimerService* timerService = new TimerService(&coffe_state_machine_mutex);
	Coffee_Machine machine;
	CM_HMI* hmi = new CM_HMI();
	Runner* runner = new Runner(sm, hmi, &coffe_state_machine_mutex);

	sm->set_cm(machine);
	sm->set_hmi(*hmi);
	sm->setTimerService(timerService);
	if(!sm->check()) {
		cout << "Timer service or operation callbacks has not been set" << endl;
		return -1;
	}
	sm->enter();
	runner->start();
	while(runner->is_active) {
	}

	return 0;
}
