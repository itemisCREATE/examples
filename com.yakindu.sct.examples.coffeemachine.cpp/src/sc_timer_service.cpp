#include "sc_timer_service.h"

#include <unistd.h>
#include <iostream>


static void *sc_timer_thread(void *arguments) {

	pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
	TimerTask* task = (TimerTask*) arguments;

	do {
		usleep((task->time_ms % 999) * 1000);
		for(int i = 0; i < task->time_ms / 999; i++) {
			usleep(999000);
		}
		pthread_mutex_lock(task->event_mutex);
		task->statemachine->raiseTimeEvent(task->pt_evid);
		pthread_mutex_unlock(task->event_mutex);

	} while (task->periodic);

	return NULL;
}

void TimerService::setTimer(TimedInterface *statemachine, sc_eventid event,
		sc_integer time_ms, sc_boolean isPeriodic) {
	pthread_mutex_lock(&(this->timer_mutex));
	TimerTask *task = new TimerTask(statemachine, event, time_ms, isPeriodic, this->event_mutex);
	timer_tasks.push_back(*task);
	if(pthread_create(&(task->pt), NULL, &sc_timer_thread, task) == EXIT_FAILURE) {
		cout << "ERROR creating thread!!!" << endl;
	}
	pthread_mutex_unlock(&(this->timer_mutex));
}

void TimerService::unsetTimer(TimedInterface *statemachine, sc_eventid event) {
	list<TimerTask>::iterator it;
	for (it = this->timer_tasks.begin(); it != timer_tasks.end(); ++it){
		if(it->pt_evid == event){
			if(pthread_cancel(it->pt) != ESRCH) {
				pthread_join(it->pt, NULL);
			}
			timer_tasks.erase(it);
			return;
		}
	}
}

void TimerService::cancel() {
	list<TimerTask>::iterator it;
	for (it = this->timer_tasks.begin(); it != timer_tasks.end(); ++it){
		pthread_cancel(it->pt);
		timer_tasks.erase(it);
	}
	timer_tasks.clear();
}
