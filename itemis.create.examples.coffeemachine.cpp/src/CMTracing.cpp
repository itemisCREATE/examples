/*
 * CMTracing.cpp
 *
 *  Created on: Sep 18, 2020
 *      Author: rherrmann
 */

#include "CMTracing.h"
#include <iostream>

using namespace std;

CMTracing::CMTracing() {
}

CMTracing::~CMTracing() {
}

void CMTracing::stateEntered(CoffeeMachineCpp::CoffeeMachineCppStates state) {

	if (cm_trace_active)
		cerr << "-> [" << stateNames[state] << "]" << endl;
}
void CMTracing::stateExited(CoffeeMachineCpp::CoffeeMachineCppStates state) {
	if (cm_trace_active)
		cerr << "[" << stateNames[state] << "] ->" << endl;
}
