/*
 * CMTracing.h
 *
 *  Created on: Sep 18, 2020
 *      Author: rherrmann
 */

#ifndef SRC_CMTRACING_H_
#define SRC_CMTRACING_H_

#include "../src-gen/CoffeeMachineCpp.h"

#include <string>

/*!
 * A trace observer for the coffee machine.
 *
 * The generator emits one generic notification, sc::trace::traceEvent(), for everything the
 * machine does - entering and leaving the machine itself, each run-to-completion step, every
 * state entry and exit, every transition, raised events, variable writes and timers being
 * started or cancelled.
 * An observer picks the kinds it is interested in by switching on event.getType().
 *
 * This one prints state entries and exits, and - when verbose tracing is switched on - the
 * run-to-completion brackets and the events and variable writes in between.
 */
class CMTracing: public sc::trace::TraceObserver<CoffeeMachineCpp,
		CoffeeMachineCpp::State, CoffeeMachineCpp::CoffeeMachineCppFeature> {
public:
	CMTracing();
	virtual ~CMTracing();

	void traceEvent(
			const sc::trace::TraceEvent<CoffeeMachineCpp, CoffeeMachineCpp::State,
					CoffeeMachineCpp::CoffeeMachineCppFeature> &event) override;

	bool cm_trace_active = true;
	/*! Switches the non-state kinds on; the 'v' command toggles it. */
	bool cm_trace_verbose = false;

private:
	const std::string& nameOf(CoffeeMachineCpp::State state) const;
	const std::string& nameOf(CoffeeMachineCpp::CoffeeMachineCppFeature feature) const;

	/*! Indexed by CoffeeMachineCpp::State, whose first literal is NO_STATE. */
	std::string stateNames[12] = { //
			"NO_STATE",
			"main_Off",
			"main_On",
			"main_On_r_Heating_Up",
			"main_On_r_Wait_For_Choice",
			"main_On_r_Save_Energy",
			"main_On_r_Process_Recipe",
			"main_On_r_Process_Recipe_r_Make_Coffee",
			"main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans",
			"main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee",
			"main_On_r_Process_Recipe_r_Make_Milk",
			"main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam"
			};

	/*! Indexed by CoffeeMachineCpp::CoffeeMachineCppFeature. */
	std::string featureNames[12] = { //
			"userEvent",
			"Wait_For_Choice.time_event_0",
			"Milling_Beans.time_event_0",
			"Brew_Coffee.time_event_0",
			"Make_Steam.time_event_0",
			"time_event_0",
			"time_event_1",
			"cm",
			"hmi",
			"internal.recipe",
			"internal.lastChoice",
			"internal.processing"
			};
};

#endif /* SRC_CMTRACING_H_ */
