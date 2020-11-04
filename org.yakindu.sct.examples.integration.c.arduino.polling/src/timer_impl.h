#ifndef SRC_TIMER_IMPL_H_
#define SRC_TIMER_IMPL_H_

#include "../src-gen/sc_timer_service.h"
#include "../src-gen/StateMachine_required.h"

#ifdef __cplusplus
extern "C" {
#endif

/*! Initializes the timer service */
void timer_init();
/*! Updates all timer with a elapsed time calculated by millis(). */
void handle_timer(unsigned long millis);


#ifdef __cplusplus
}
#endif

#endif /* SRC_TIMER_IMPL_H_ */
