#ifndef SRC_TIMER_IMPL_H_
#define SRC_TIMER_IMPL_H_

#include "sc_timer_service.h"
#include "../src-gen/StateMachineRequired.h"
#include "Arduino.h"
#include "avr/sleep.h"

#ifdef __cplusplus
extern "C" {
#endif

/*! Elapsed timer for timer calculation */
#define TIMER_TICK_MS 32

/*! Initializes the Watch Dog Timer with interrupts every 32 ms.
 * Additionally, initializes the timer service */
void timer_init();

/*! Updates all timer with a elapsed time of 32 ms,
 * as set by the 32 ms interrupt by the WDT */
void handle_timer();


/*! Interrupt Service Routine to store the WDT interrupt */
ISR(WDT_vect);

#ifdef __cplusplus
}
#endif

#endif /* SRC_TIMER_IMPL_H_ */
