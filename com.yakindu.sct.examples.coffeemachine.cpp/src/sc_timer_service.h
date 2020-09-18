/*
 * sc_timer_service.hpp
 *
 *  Created on: Sep 17, 2020
 *      Author: rherrmann
 */

#ifndef SRC_SCUTIL_SC_TIMER_SERVICE_H_
#define SRC_SCUTIL_SC_TIMER_SERVICE_H_

#include "../src-gen/sc_timer.h"
#include <list>
#include <pthread.h>

using namespace std;
using namespace sc::timer;


class TimerTask{
public:
	sc_integer time_ms;
	sc_boolean periodic;
	sc_eventid pt_evid;
	pthread_t pt;
	TimedInterface* statemachine;
	pthread_mutex_t *event_mutex;

	TimerTask(TimedInterface* statemachine, sc_eventid event, sc_integer time, sc_boolean isPeriodic, pthread_mutex_t *event_mutex){
		this->statemachine = statemachine;
		this->pt_evid = event;
		this->periodic = isPeriodic;
		this->time_ms = time;
		this->pt = (pthread_t)event;
		this->event_mutex = event_mutex;
	}
	~TimerTask(){}

};



class TimerService: public TimerServiceInterface {
public:
	pthread_mutex_t *event_mutex;
	pthread_mutex_t timer_mutex;

	TimerService(pthread_mutex_t *event_mutex){
		this->event_mutex = event_mutex;
	}
	~TimerService(){}
	virtual void setTimer(TimedInterface *statemachine, sc_eventid event,
			sc_integer time_ms, sc_boolean isPeriodic);
	virtual void unsetTimer(TimedInterface *statemachine, sc_eventid event);
	virtual void cancel();
	list<TimerTask> timer_tasks;
};

#endif /* SRC_SCUTIL_SC_TIMER_SERVICE_H_ */
