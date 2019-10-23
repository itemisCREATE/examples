#ifndef SRC_TIMER_IMPL_H_
#define SRC_TIMER_IMPL_H_

#include "sc_timer_service.h"
#include "../src-gen/StateMachineRequired.h"

#ifdef __cplusplus
extern "C" {
#endif

#define TIMER_TICK_MS 500

/*! Initializes the timer service */
void timer_init();
/*! Updates all timer with a elapsed time calculated by millis(). */
void handle_timer(void *pvParameters);

void callProceed();

#ifdef __cplusplus
}
#endif

#endif /* SRC_TIMER_IMPL_H_ */
