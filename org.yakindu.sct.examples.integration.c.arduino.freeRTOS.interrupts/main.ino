#include "Arduino.h"
#include "src-gen/StateMachineRequired.h"
#include "Arduino_FreeRTOS.h"
#include "timers.h"
#include "src/hw_impl.h"
#include "src/timer_impl.h"

/*! Define the state machine object */
StateMachine stateMachine;

TimerHandle_t cycleHandler;



void setup() {
	Serial.begin(9600);
	Serial.println("Hello World!");


	hw_init();
	timer_init();

	stateMachine_init(&stateMachine);
	stateMachine_enter(&stateMachine);

	cycleHandler = xTimerCreate("cycleHandler", TIMER_TICK_MS / portTICK_PERIOD_MS,
	pdTRUE, (void*) 0, handle_timer);

	xTimerStart(cycleHandler, 0);

	xTaskCreate(handle_in_events, (const portCHAR *) "HandleInEvents", 128,
			&stateMachine, 2, NULL);
	xTaskCreate(handle_out_events, (const portCHAR *) "HandleOutEvents", 128,
			&stateMachine, 1, NULL);

	vTaskStartScheduler();
}

void loop() {
}
