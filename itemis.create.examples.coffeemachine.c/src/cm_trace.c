/*
 * cm_trace.c
 *
 *  Created on: 13.04.2016
 *      Author: terfloth
 */

#include <stdio.h>

#include "cm_trace.h"
#include "../src-gen/CoffeeMachine.h"

/*! Indexed by CoffeeMachineStates, whose first literal is CoffeeMachine_last_state. */
static const char *stateNames[] = { //
		"InvalidState", //
				"Off", //
				"On", //
				"On.Welcome", //
				"On.HeatingUp", //
				"On.WaitForChoice", //
				"On.SaveEnergy", //
				"On.ProcessRecipe", //
				"On.ProcessRecipe.MakeMilk", //
				"On.ProcessRecipe.MakeMilk.MakeSteam", //
				"On.ProcessRecipe.MakeCoffee", //
				"On.ProcessRecipe.MakeCoffee.MillingBeans", //
				"On.ProcessRecipe.MakeCoffee.BrewCoffee" //
		};//

/*! Indexed by CoffeeMachineFeature, whose first literal is CoffeeMachine_no_feature. */
static const char *featureNames[] = { //
		"<none>", //
				"userEvent", //
				"internal.recipe", //
				"internal.lastChoice", //
				"internal.processing", //
				"internal.userInput" //
		};//

bool cm_trace_active = true;
bool cm_trace_verbose = false;

/*! Machine life cycle: entered, exited, and the brackets around every run cycle. */
static void cm_trace(void *handler, void *machine, sc_trace_event event) {
	if (!cm_trace_verbose)
		return;
	switch (event) {
	case sc_trace_machine_enter:
		fprintf(stderr, "   (machine entered)\n");
		break;
	case sc_trace_machine_exit:
		fprintf(stderr, "   (machine exited)\n");
		break;
	case sc_trace_machine_run_cycle_start:
		fprintf(stderr, "   (run cycle start)\n");
		break;
	case sc_trace_machine_run_cycle_end:
		fprintf(stderr, "   (run cycle end)\n");
		break;
	default:
		break;
	}
}

/*! State entries and exits, plus (verbose) each transition taken, named by its source state. */
static void cm_trace_state(void *handler, void *machine, sc_trace_event event,
		sc_integer state_id) {
	if (!cm_trace_active)
		return;
	if (event == sc_trace_state_entered)
		fprintf(stderr, "-> [%s]\n", stateNames[state_id]);
	else if (event == sc_trace_state_exited)
		fprintf(stderr, "[%s] ->\n", stateNames[state_id]);
	else if (event == sc_trace_state_transition && cm_trace_verbose)
		fprintf(stderr, "   (transition from [%s])\n", stateNames[state_id]);
}

/*! Raised events and variable writes. The payload's type follows from the feature. */
static void cm_trace_feature(void *handler, void *machine,
		sc_trace_event event, sc_integer feature_id, const void *payload) {
	if (!cm_trace_verbose)
		return;
	if (event == sc_trace_event_raised)
		fprintf(stderr, "   (raised %s)\n", featureNames[feature_id]);
	else if (event == sc_trace_variable_set)
		fprintf(stderr, "   (set %s)\n", featureNames[feature_id]);
}

/*! Time events being started and cancelled; a timer firing shows as the transition it takes. */
static void cm_trace_time_event(void *handler, void *machine,
		sc_trace_event event, sc_integer tevid) {
	if (!cm_trace_verbose)
		return;
	switch (event) {
	case sc_trace_time_event_set:
		fprintf(stderr, "   (started timer %d)\n", (int) tevid);
		break;
	case sc_trace_time_event_unset:
		fprintf(stderr, "   (cancelled timer %d)\n", (int) tevid);
		break;
	default:
		break;
	}
}

static sc_trace_handler handler = { //
		.trace = &cm_trace, //
				.traceFeature = &cm_trace_feature, //
				.traceTimeEvent = &cm_trace_time_event, //
				.traceState = &cm_trace_state //
		};

sc_trace_handler* cm_trace_handler(void) {
	return &handler;
}
