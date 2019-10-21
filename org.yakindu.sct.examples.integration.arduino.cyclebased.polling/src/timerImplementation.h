#ifndef SRC_TIMERIMPLEMENTATION_H_
#define SRC_TIMERIMPLEMENTATION_H_

#include "sc_timer_service.h"
#include "../src-gen/StateMachineRequired.h"

#ifdef __cplusplus
extern "C" {
#endif

#define TIMER_TICK_MS 32

void timerInit(StateMachine* handle);
void handleTimer(sc_integer millis);


#ifdef __cplusplus
}
#endif

#endif /* SRC_TIMERIMPLEMENTATION_H_ */
