#include "Arduino.h"

#include "src/hw_impl.h"
#include "src/timer_impl.h"
#include "src-gen/StateMachine_required.h"

/*! Define the state machine object */
StateMachine stateMachine;

/*! Instantiates observer for the out events */
sc_single_subscription_observer outEvent1Observer;
sc_single_subscription_observer outEvent2Observer;

/*! Setup the Arduino */
void setup() {
	/*! Setup the hardware you're using.
	 * Digital/Analog Ports, Sensors, Actuators, Communication */
	hw_init();

	/*! Initialize the timer service. Here you must define,
	 * how many time events you're using.
	 * The default value is 10. */
	timer_init();

	/*! Initialize and enter the state machine */
	stateMachine_init(&stateMachine);

	/*! Subscribes observers to the state machine's observables */
	subscribe_observers(&stateMachine, &outEvent1Observer, &outEvent2Observer);

	/*! Enter the state machine */
	stateMachine_enter(&stateMachine);
}

/*! Runs forever */
void loop() {
	/*! Runs until the state machine is final.
	 * Always true, if there is no final state defined */
	while (!stateMachine_is_final(&stateMachine)) {
		/*! Update timer with elapsed time using millis()*/
		handle_timer(millis());

		/*! Poll the inputs/sensors */
		handle_in_events(&stateMachine);

		/*! For @EventDriven state machines runCycle must not be called.
		 * Use run_cycle for @CycleBased state machines */
		//stateMachine_run_cycle(&stateMachine);
	}
}
