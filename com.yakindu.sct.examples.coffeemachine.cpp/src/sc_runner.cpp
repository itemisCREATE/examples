#include "sc_runner.h"

#include <pthread.h>
#include <unistd.h>
#include <iostream>

using namespace std;

static void* sc_cycle_runner_thread(void *arg) {
	CM_HMI::UserEvents lastEvent = CM_HMI::NONE;

	Runner *runner = (Runner*) arg;
	while (1) {
		lastEvent = runner->hmi->scanUserInput();
		if(lastEvent == CM_HMI::NONE) {
			runner->is_active = false;
			return NULL;
		}
		if(lastEvent == CM_HMI::TRACING) {
			if(runner->tracer->cm_trace_active) {
				runner->tracer->cm_trace_active = false;
			} else {
				runner->tracer->cm_trace_active = true;
			}
		} else {
			pthread_mutex_lock(runner->event_mutex);
			runner->sm->raise_userEvent(lastEvent);
			pthread_mutex_unlock(runner->event_mutex);
		}
	}
	return NULL;
}

void Runner::start() {
	this->is_active = true;
	pthread_create(&(this->thread), NULL, sc_cycle_runner_thread, this);
}
