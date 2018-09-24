/*
 * sc_statemachine.h
 *
 *  Created on: 22.05.2017
 *      Author: terfloth
 */

#ifndef SRC_SCUTIL_SC_STATEMACHINE_H_
#define SRC_SCUTIL_SC_STATEMACHINE_H_


#include "../sc/sc_types.h"


/*! Function pointer type for state machines enter function. */
typedef void (*sc_statemachine_enter_fp)(void *handle);

/*! Function pointer type for state machines exit function. */
typedef void (*sc_statemachine_exit_fp)(void *handle);

/*! Function pointer type for state machines runCycle function. */
typedef void (*sc_statemachine_runCycle_fp)(void *handle);

/*! Function pointer type for state machines isFinal function. */
typedef sc_boolean (*sc_statemachine_isFinal_fp)(void *handle);


/* struct of a dynamic state machine interface. */
typedef struct {
	void *machine;
	sc_statemachine_enter_fp enter;
	sc_statemachine_exit_fp exit;
	sc_statemachine_runCycle_fp runCycle;
	sc_statemachine_isFinal_fp isFinal;
} sc_statemachine_t;


extern void sc_enter(sc_statemachine_t *machine);

extern void sc_exit(sc_statemachine_t *machine);

extern void sc_runCycle(sc_statemachine_t *machine);

extern sc_boolean sc_isFinal(sc_statemachine_t *machine);


#endif /* SRC_SCUTIL_SC_STATEMACHINE_H_ */
