/*
 * cm_main.c
 *
 *  Created on: 13.04.2016
 *      Author: terfloth
 */


#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>

#include "cm_hmi.h"

#include "CoffeeMachine.h"
#include "ProcessCappucino.h"
#include "ProcessCoffee.h"
#include "ProcessEspresso.h"
#include "ProcessLatteMacchiato.h"
#include "ProcessMilk.h"

#include "scutil/sc_cycle_runner.h"
#include "scutil/sc_timer_service.h"



/*! \file Implementation of the main function and setup of the virtual YAKINDU Coffee Maker.
 * It includes everything to setup and run the example. The example applies a cycle based execution
 * model and makes use of POSIX threads.
 */

//! First we create our coffee state machine.
static CoffeeMachine coffee_state_machine;

//! First we create our recipe processing state machine.
//static ProcessRecipe recipe_state_machine;
static ProcessCappucino recipe_machine_cappucino;
static ProcessCoffee recipe_machine_coffee;
static ProcessEspresso recipe_machine_espresso;
static ProcessLatteMacchiato recipe_machine_latte;
static ProcessMilk recipe_machine_milk;

sc_statemachine_t recipeProcessors[] = {
		{
				&recipe_machine_coffee,
				(sc_statemachine_enter_fp) processCoffee_enter,
				(sc_statemachine_exit_fp) processCoffee_exit,
				(sc_statemachine_runCycle_fp) processCoffee_runCycle,
				(sc_statemachine_isFinal_fp) processCoffee_isFinal
		},
		{
				&recipe_machine_espresso,
				(sc_statemachine_enter_fp) processEspresso_enter,
				(sc_statemachine_exit_fp) processEspresso_exit,
				(sc_statemachine_runCycle_fp) processEspresso_runCycle,
				(sc_statemachine_isFinal_fp) processEspresso_isFinal
		},
		{
				&recipe_machine_cappucino,
				(sc_statemachine_enter_fp) processCappucino_enter,
				(sc_statemachine_exit_fp) processCappucino_exit,
				(sc_statemachine_runCycle_fp) processCappucino_runCycle,
				(sc_statemachine_isFinal_fp) processCappucino_isFinal
		},
		{
				&recipe_machine_latte,
				(sc_statemachine_enter_fp) processLatteMacchiato_enter,
				(sc_statemachine_exit_fp) processLatteMacchiato_exit,
				(sc_statemachine_runCycle_fp) processLatteMacchiato_runCycle,
				(sc_statemachine_isFinal_fp) processLatteMacchiato_isFinal
		},
		{
				&recipe_machine_milk,
				(sc_statemachine_enter_fp) processMilk_enter,
				(sc_statemachine_exit_fp) processMilk_exit,
				(sc_statemachine_runCycle_fp) processMilk_runCycle,
				(sc_statemachine_isFinal_fp) processMilk_isFinal
		}
};


//! We additionally make use of a generic cycle runner that invokes the state machines runCycle function at a fixed frequency.
static sc_cycle_runner_t cycle_runner;

//! As we make use of time triggers (after & every) we make use of a generic timer implementation and need a defined number of timers.
#define MAX_TIMERS 4

//! We allocate the desired array of timers.
static sc_timer_t timers[MAX_TIMERS];

//! The timers are managed by a timer service. */
static sc_timer_service_t timer_service;

//! For synchronizing the various threads (cycle runner, timers) we create a mutex.
static pthread_mutex_t coffe_state_machine_mutex = PTHREAD_MUTEX_INITIALIZER;



static void run_cycle(void *handle) {
	coffeeMachineIface_raise_userEvent(handle, provideUserEvent());
	coffeeMachine_runCycle(handle);
}

static void dispatch_time_event(void* handle, sc_eventid evid) {
	if (handle == &coffee_state_machine) coffeeMachine_raiseTimeEvent(handle, evid);
	if (handle == &recipe_machine_cappucino) processCappucino_raiseTimeEvent(handle, evid);
	if (handle == &recipe_machine_coffee) processCoffee_raiseTimeEvent(handle, evid);
	if (handle == &recipe_machine_espresso) processEspresso_raiseTimeEvent(handle, evid);
	if (handle == &recipe_machine_latte) processLatteMacchiato_raiseTimeEvent(handle, evid);
	if (handle == &recipe_machine_milk) processMilk_raiseTimeEvent(handle, evid);
}

int main(void) {

	puts("!!!Hello Coffee!!!");
	puts("general commands are:");
	puts("(o) toggle on/off");
	puts("(t) toggle state trace");
	puts("(q) quit");

	// We initialize the timer service with everything it requires.
	sc_timer_service_init(
			&timer_service,
			timers, MAX_TIMERS,
			(sc_raise_time_event_fp) &dispatch_time_event,
			&coffe_state_machine_mutex);

	// then we initialize
	coffeeMachine_init(&coffee_state_machine);
	processCappucino_init(&recipe_machine_cappucino);
	processCoffee_init(&recipe_machine_coffee);
	processEspresso_init(&recipe_machine_espresso);
	processLatteMacchiato_init(&recipe_machine_latte);
	processMilk_init(&recipe_machine_milk);

	// ... and enter the state machine
	coffeeMachine_enter(&coffee_state_machine);

	// ... start up the cycle runner
	sc_cycle_runner_start(
			&cycle_runner,
			&run_cycle,
			&coffee_state_machine,
			100, &coffe_state_machine_mutex);

	// ... and finally process user input.
	scanUserInput();

	puts("Bye ...");

	return EXIT_SUCCESS;
}


/*!
 This function will be called for each time event that is relevant for a state when a state will be entered.
 \param evid An unique identifier of the event.
 \time_ms The time in milli seconds
 \periodic Indicates the the time event must be raised periodically until the timer is unset
 */
void coffeeMachine_setTimer(CoffeeMachine* handle, const sc_eventid evid, const sc_integer time_ms, const sc_boolean periodic) {

	// simply delegate to the generic timer service implementation.
	sc_timer_start(&timer_service, handle, evid, time_ms, periodic);
}

/*!
	This function will be called for each time event that is relevant for a state when a state will be left.
	\param evid An unique identifier of the event.
*/
void coffeeMachine_unsetTimer(CoffeeMachine* handle, const sc_eventid evid) {

	// simply delegate to the generic timer service implementation.
	sc_timer_cancel(&timer_service, evid);
}


void processCappucino_setTimer(ProcessCappucino* handle, const sc_eventid evid, const sc_integer time_ms, const sc_boolean periodic){
	// simply delegate to the generic timer service implementation.
	sc_timer_start(&timer_service, handle, evid, time_ms, periodic);
}


void processCappucino_unsetTimer(ProcessCappucino* handle, const sc_eventid evid) {
	// simply delegate to the generic timer service implementation.
	sc_timer_cancel(&timer_service, evid);
}



void processCoffee_setTimer(ProcessCoffee* handle, const sc_eventid evid, const sc_integer time_ms, const sc_boolean periodic){
	// simply delegate to the generic timer service implementation.
	sc_timer_start(&timer_service, handle, evid, time_ms, periodic);
}

void processCoffee_unsetTimer(ProcessCoffee* handle, const sc_eventid evid){
	// simply delegate to the generic timer service implementation.
	sc_timer_cancel(&timer_service, evid);
}


void processEspresso_setTimer(ProcessEspresso* handle, const sc_eventid evid, const sc_integer time_ms, const sc_boolean periodic){
	// simply delegate to the generic timer service implementation.
	sc_timer_start(&timer_service, handle, evid, time_ms, periodic);
}

void processEspresso_unsetTimer(ProcessEspresso* handle, const sc_eventid evid){
	// simply delegate to the generic timer service implementation.
	sc_timer_cancel(&timer_service, evid);
}


void processLatteMacchiato_setTimer(ProcessLatteMacchiato* handle, const sc_eventid evid, const sc_integer time_ms, const sc_boolean periodic){
	// simply delegate to the generic timer service implementation.
	sc_timer_start(&timer_service, handle, evid, time_ms, periodic);
}

void processLatteMacchiato_unsetTimer(ProcessLatteMacchiato* handle, const sc_eventid evid){
	// simply delegate to the generic timer service implementation.
	sc_timer_cancel(&timer_service, evid);
}


void processMilk_setTimer(ProcessMilk* handle, const sc_eventid evid, const sc_integer time_ms, const sc_boolean periodic){
	// simply delegate to the generic timer service implementation.
	sc_timer_start(&timer_service, handle, evid, time_ms, periodic);
}

void processMilk_unsetTimer(ProcessMilk* handle, const sc_eventid evid){
	// simply delegate to the generic timer service implementation.
	sc_timer_cancel(&timer_service, evid);
}



