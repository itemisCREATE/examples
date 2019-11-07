#include "Arduino.h"
#include "src-gen/StateMachineRequired.h"
#include "Arduino_FreeRTOS.h"
#include "timers.h"
#include "src/hw_impl.h"
#include "src/timer_impl.h"

/*! Define the state machine object */
StateMachine stateMachine;

/*! Timer task, which triggers the state machine */
TimerHandle_t timer;

/*! Setup the Arduino */
void setup() {
	/*! Setup the hardware you're using. Activate the interrupts.
	 * Digital/Analog Ports, Sensors, Actuators, Communication */
	hw_init();

	/*! Initialize the timer service. Here you must define,
	 * how many time events you're using.
	 * The default value is 10. */
	timer_init();

	/*! Initialize and enter the state machine */
	stateMachine_init(&stateMachine);
	stateMachine_enter(&stateMachine);

	/* Create a timer task, which calls updates the state machine
	 * every 500 ms. The time can be defined in the TIMER_TICK_MS */
	timer = xTimerCreate("cycleHandler", TIMER_TICK_MS / portTICK_PERIOD_MS,
	pdTRUE, (void*) 0, handle_timer);

	/*! Starting the timer */
	xTimerStart(timer, 0);

	/*! Creates a tasks, which raises the input events,
	 * based on the stored interrupts*/
	xTaskCreate(handle_in_events, (const portCHAR *) "HandleInEvents", 128,
			&stateMachine, 2, NULL);

	/*! Create a task, which sets the outputs of the Arduino */
	xTaskCreate(handle_out_events, (const portCHAR *) "HandleOutEvents", 128,
			&stateMachine, 1, NULL);

	/*! Start the scheduler. For now on, everything is handled in the tasks*/
	vTaskStartScheduler();
}

/*! Empty loop */
void loop() {
}
