#ifndef SRC_HARDWAREIMPLEMENTATION_H_
#define SRC_HARDWAREIMPLEMENTATION_H_

#include "Arduino.h"
#include "../src-gen/StateMachine.h"

#ifdef __cplusplus
extern "C" {
#endif

void hardwareInit();
void handleInEvents(StateMachine* handle);
void handleOutEvents(StateMachine* handle);

#ifdef __cplusplus
}
#endif

#endif /* SRC_HARDWAREIMPLEMENTATION_H_ */
