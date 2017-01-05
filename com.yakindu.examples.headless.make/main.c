/*
 * main.c
 *
 *  Created on: 04.01.2017
 *      Author: rbeckmann
 */

#include <stdio.h>

#include "src/sc_types.h"
#include "src-gen/DefaultSM.h"

int main(int argc, char** argv)
{
	DefaultSM statemachine;

	defaultSM_init(&statemachine);
	defaultSM_enter(&statemachine);

	while(!defaultSM_isFinal(&statemachine)) {
		defaultSM_runCycle(&statemachine);
	}

	printf("Statemachine has finished, final value of a is %d!\n", defaultSMIface_get_a(&statemachine));
}
