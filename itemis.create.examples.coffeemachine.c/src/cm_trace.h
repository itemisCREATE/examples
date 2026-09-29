/*
 * cm_trace.h
 *
 *  Created on: 18.04.2016
 *      Author: terfloth
 */

#ifndef CM_TRACE_H_
#define CM_TRACE_H_

#include <stdbool.h>

#include "../src-gen/sc_tracing.h"

/*! Prints state entries and exits. Toggled by the '(t)' command. */
extern bool cm_trace_active;

/*! Prints the remaining trace event kinds as well. Toggled by the '(v)' command. */
extern bool cm_trace_verbose;

/*!
 * The trace handler to hand to coffeeMachine_init_with_tracing().
 *
 * The generated machine reports everything it does through one handler: entering and leaving
 * the machine, each run cycle, every state entry, exit and transition, raised events, variable
 * writes and timers being started or cancelled. The handler holds one function per kind, and a null slot simply means
 * "not interested".
 */
sc_trace_handler* cm_trace_handler(void);

#endif /* CM_TRACE_H_ */
