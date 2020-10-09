/*
 * sc_cycle_runner.h
 *
 *  Created on: Sep 17, 2020
 *      Author: rherrmann
 */

#ifndef SRC_SCUTIL_SC_RUNNER_H_
#define SRC_SCUTIL_SC_RUNNER_H_

#include "../src-gen/CoffeeMachineCpp.h"
#include "CMHMI.hpp"
#include "CMTracing.h"
#include <pthread.h>

class Runner{
public:
	pthread_t thread;
	CoffeeMachineCpp* sm;
	CM_HMI* hmi;
	CMTracing* tracer;
	pthread_mutex_t *event_mutex;
	bool is_active;
	Runner(CoffeeMachineCpp* sm, CM_HMI* hmi, CMTracing* tracer, pthread_mutex_t *event_mutex) {
		this->sm = sm;
		this->hmi = hmi;
		this->tracer = tracer;
		this->event_mutex = event_mutex;
		this->thread = (pthread_t) sc_null;
		this->is_active = false;
	}
	~Runner();

	void start();
};



#endif /* SRC_SCUTIL_SC_RUNNER_H_ */
