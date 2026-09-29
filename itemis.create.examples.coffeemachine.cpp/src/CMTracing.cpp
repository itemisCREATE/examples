/*
 * CMTracing.cpp
 *
 *  Created on: Sep 18, 2020
 *      Author: rherrmann
 */

#include "CMTracing.h"
#include <iostream>

using namespace std;
using namespace sc::trace;

typedef TraceEvent<CoffeeMachineCpp, CoffeeMachineCpp::State,
		CoffeeMachineCpp::CoffeeMachineCppFeature> CMTraceEvent;

CMTracing::CMTracing() {
}

CMTracing::~CMTracing() {
}

const string& CMTracing::nameOf(CoffeeMachineCpp::State state) const {
	return stateNames[static_cast<int>(state)];
}

const string& CMTracing::nameOf(
		CoffeeMachineCpp::CoffeeMachineCppFeature feature) const {
	return featureNames[static_cast<int>(feature)];
}

void CMTracing::traceEvent(const CMTraceEvent &event) {
	if (!cm_trace_active)
		return;

	switch (event.getType()) {
	case TraceEventType::STATE_ENTERED:
		cerr << "-> [" << nameOf(event.getState()) << "]" << endl;
		break;
	case TraceEventType::STATE_EXITED:
		cerr << "[" << nameOf(event.getState()) << "] ->" << endl;
		break;
	default:
		break;
	}

	if (!cm_trace_verbose)
		return;

	switch (event.getType()) {
	case TraceEventType::MACHINE_ENTER:
		cerr << "   (machine entered)" << endl;
		break;
	case TraceEventType::MACHINE_EXIT:
		cerr << "   (machine exited)" << endl;
		break;
	case TraceEventType::MACHINE_RTS_START:
		cerr << "   (run-to-completion step start)" << endl;
		break;
	case TraceEventType::MACHINE_RTS_STOP:
		cerr << "   (run-to-completion step stop)" << endl;
		break;
	case TraceEventType::STATE_TRANSITION:
		cerr << "   (transition from " << nameOf(event.getState()) << ")" << endl;
		break;
	case TraceEventType::EVENT_RAISED:
		cerr << "   (raised " << nameOf(event.getFeature()) << ")" << endl;
		break;
	case TraceEventType::VARIABLE_SET:
		cerr << "   (set " << nameOf(event.getFeature()) << ")" << endl;
		break;
	case TraceEventType::TIME_EVENT_SET:
		cerr << "   (started timer " << nameOf(event.getFeature()) << ")" << endl;
		break;
	case TraceEventType::TIME_EVENT_UNSET:
		cerr << "   (cancelled timer " << nameOf(event.getFeature()) << ")" << endl;
		break;
	default:
		break;
	}
}
