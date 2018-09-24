/*
 * sc_statemachine.c
 *
 *  Created on: 22.05.2017
 *      Author: terfloth
 */

#include "sc_statemachine.h"


void sc_enter(sc_statemachine_t *machine) {
	machine->enter(machine->machine);
}

void sc_exit(sc_statemachine_t *machine) {
	machine->exit(machine->machine);
}

void sc_runCycle(sc_statemachine_t *machine) {
	machine->runCycle(machine->machine);
}

sc_boolean sc_isFinal(sc_statemachine_t *machine) {
	return machine->isFinal(machine->machine);
}
