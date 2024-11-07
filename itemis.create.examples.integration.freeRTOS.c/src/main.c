#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "semphr.h"

#include "../src-gen/StateMachine.h"
#include "../src-gen/sc_rxc.h"
#include "../src-gen/sc_timer_service.h"

/* ! As we make use of time triggers (after & every)
 * we make use of a generic timer implementation
 * and need a defined number of timers. */
#define MAX_TIMERS 4
#define TIMER_THREAD_TIME_MS 100

//! We allocate the desired array of timers.
static sc_timer_t timers[MAX_TIMERS];

//! The timers are managed by a timer service. */
static sc_timer_service_t timer_service;

static char buf[20];

/*! Instantiates the state machine */
StateMachine statemachine;

/*! Instantiates observer for the out events */
sc_single_subscription_observer outEvent1Observer;
sc_single_subscription_observer outEvent2Obsever;

/*! Event IDs*/
const uint32_t updateTimerServiceID = 0;
const uint32_t inEvent1ID = 1;
const uint32_t inEvent2ID = 2;
const uint32_t displayBrightnessID = 3;

const uint32_t outEvent1ID = 1;
const uint32_t outEvent2ID = 2;

/*! Stores the events */
static QueueHandle_t inEventQueue = NULL;
static QueueHandle_t outEventQueue = NULL;

/*! This function will be called by raising the out event outEvent1 */
static void on_outEvent1(StateMachine *o)
{
	xQueueSend(outEventQueue, &outEvent1ID, 0U);
}

/*! This function will be called by raising the out event outEvent2 */
static void on_outEvent2(StateMachine *o)
{
	xQueueSend(outEventQueue, &outEvent2ID, 0U);
}

/*! Subscribes the observers on the out event observables outEvent1 and outEvent2 */
static void subscribe_observers(StateMachine *statemachine,
								sc_single_subscription_observer *outEvent1Observer,
								sc_single_subscription_observer *outEvent2Obsever)
{
	sc_single_subscription_observer_init(outEvent1Observer, statemachine, (sc_observer_next_fp)on_outEvent1);
	sc_single_subscription_observer_subscribe(outEvent1Observer, stateMachine_get_outEvent1(statemachine));

	sc_single_subscription_observer_init(outEvent2Obsever, statemachine, (sc_observer_next_fp)on_outEvent2);
	sc_single_subscription_observer_subscribe(outEvent2Obsever, stateMachine_get_outEvent2(statemachine));
}

/*! This function will be called every 100 ms and updates the timer service */
static void timer_callback(TimerHandle_t timerHandle)
{
	xQueueSend(inEventQueue, &updateTimerServiceID, 0U);
}

/*! This task is executed in order to interact with the keyboard */
static void input_callback(void *parameters)
{
	StateMachine *statemachine = (StateMachine *)parameters;
	/*! Ensures non-blocking read() call. */
	fcntl(STDIN_FILENO, F_SETFL, fcntl(0, F_GETFL) | O_NONBLOCK);
	while (!stateMachine_is_final(statemachine))
	{
		ssize_t numRead = read(STDIN_FILENO, &buf, 1);
		if (numRead > 0)
		{
			char input = buf[0];
			if (input == '1')
			{
				xQueueSend(inEventQueue, &inEvent1ID, 0U);
			}
			else if (input == '2')
			{
				xQueueSend(inEventQueue, &inEvent2ID, 0U);
			}
		}
		else
		{
			vTaskDelay(pdMS_TO_TICKS(100));
		}
	}
}

/*! This function dispatches the received events and delegates them to the statemachine */
static void statemachine_callback(void *parameters)
{
	StateMachine *statemachine = (StateMachine *)parameters;
	uint32_t receivedInEventID;
	while (!stateMachine_is_final(statemachine))
	{
		xQueueReceive(inEventQueue, &receivedInEventID, portMAX_DELAY);
		if (receivedInEventID == updateTimerServiceID)
		{
			sc_timer_service_proceed(&timer_service, TIMER_THREAD_TIME_MS);
		}
		else if (receivedInEventID == inEvent1ID)
		{
			stateMachine_raise_inEvent1(statemachine);
		}
		else if (receivedInEventID == inEvent2ID)
		{
			stateMachine_raise_inEvent2(statemachine);
		}
		vTaskDelay(pdMS_TO_TICKS(100));
	}
}

static void output_callback(void *parameters)
{
	StateMachine *statemachine = (StateMachine *)parameters;
	uint32_t receivedOutEventID;
	while (!stateMachine_is_final(statemachine))
	{
		xQueueReceive(outEventQueue, &receivedOutEventID, portMAX_DELAY);
		if (receivedOutEventID == outEvent1ID)
		{
			printf("received outEvent2\n");
		}
		else if (receivedOutEventID == outEvent2ID)
		{
			printf("received outEvent1\n");
		}
	}
}

int main(void)
{
	/*! Initializes the timer service */
	sc_timer_service_init(&timer_service, timers, MAX_TIMERS, (sc_raise_time_event_fp)&stateMachine_raise_time_event);

	/*! Initializes the state machine, in particular all variables are set to a proper value */
	stateMachine_init(&statemachine);

	/*! Subscribes observers to the state machine's observables */
	subscribe_observers(&statemachine, &outEvent1Observer, &outEvent2Obsever);

	/*! Initialize the queues */
	inEventQueue = xQueueCreate(2, sizeof(uint32_t));
	outEventQueue = xQueueCreate(2, sizeof(uint32_t));

	/*! Enters the state machine; from this point on the state machine is ready to react on incoming event */
	stateMachine_enter(&statemachine);

	/*! Instantiates a timer task which gets executed every 100 ms */
	TimerHandle_t xTimer = xTimerCreate("timer", 100, pdTRUE, NULL, timer_callback);

	/*! Start the timer task, which will be update and handle all timed events*/
	xTimerStart(xTimer, 0);

	/*! Create a task, which delegates the events to the state machine */
	xTaskCreate(statemachine_callback, "statemachine", configMINIMAL_STACK_SIZE, &statemachine, 1, NULL);

	/*! Create a task which allows to interact with the keyboard */
	xTaskCreate(input_callback, "input", configMINIMAL_STACK_SIZE, &statemachine, 1, NULL);

	/*! Create a task, which handles the out events */
	xTaskCreate(output_callback, "output", configMINIMAL_STACK_SIZE, &statemachine, 1, NULL);

	puts("Type 1 or 2 to raise event 1 or 2.\n");

	/*! Start the freeRTOS scheduler*/
	vTaskStartScheduler();

	return 0;
}

/*! This function will be called for each time event in StateMachine when a state is entered. */
void stateMachine_set_timer(StateMachine *handle, const sc_eventid evid, const sc_integer time_ms, const sc_boolean periodic)
{
	sc_timer_set(&timer_service, handle, evid, time_ms, periodic);
}

/*! This function will be called for each time event in StateMachine when a state will be left. */
void stateMachine_unset_timer(StateMachine *handle, const sc_eventid evid)
{
	sc_timer_unset(&timer_service, evid);
}
