#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "semphr.h"

#include "../src-gen/LightSwitch.h"
#include "../src-gen/sc_rxc.h"
#include "../src-gen/sc_timer_service.h"

/* ! As we make use of time triggers (after & every)
 * we make use of a generic timer implementation
 * and need a defined number of timers. */
#define MAX_TIMERS 4

//! We allocate the desired array of timers.
static sc_timer_t timers[MAX_TIMERS];

//! The timers are managed by a timer service. */
static sc_timer_service_t timer_service;

static char buf[20];

/*! Instantiates the state machine */
LightSwitch lightSwitch;

/*! Instantiates observer for the out events */
sc_single_subscription_observer lightOnObserver;
sc_single_subscription_observer lightOffObserver;

/*! Input event IDs*/
const uint32_t updateTimerServiceID = 0;
const uint32_t raiseOnButtonID = 1;
const uint32_t raiseOffButtonID = 2;
const uint32_t displayBrightnessID = 3;

/*! Stores the input events */
static QueueHandle_t eventQueue = NULL;

/*! This function will be called by raising the out event light.on */
static void on_light_on(LightSwitch *o)
{
	printf("Light is on.\n");
}

/*! This function will be called by raising the out event light.off */
static void on_light_off(LightSwitch *o)
{
	printf("Light is off.\n");
}

/*! Subscribes the observers on the out event observables light.on and light.off */
static void subscribe_observers(LightSwitch *lightSwitch,
								sc_single_subscription_observer *lightOnObserver,
								sc_single_subscription_observer *lightOffObserver)
{

	sc_single_subscription_observer_init(lightOnObserver, lightSwitch,
										 (sc_observer_next_fp)on_light_on);
	sc_single_subscription_observer_subscribe(lightOnObserver,
											  lightSwitch_light_get_on(lightSwitch));

	sc_single_subscription_observer_init(lightOffObserver, lightSwitch,
										 (sc_observer_next_fp)on_light_off);
	sc_single_subscription_observer_subscribe(lightOffObserver,
											  lightSwitch_light_get_off(lightSwitch));
}

/*! This function will be called every 100 ms and updates the timer service */
static void timerCallback(TimerHandle_t timerHandle)
{
	(void)timerHandle;
	xQueueSend(eventQueue, &updateTimerServiceID, 0U);
}

/*! This task is executed in order to interact with the keyboard */
static void KeyboardPollTask(void *pvParameters)
{
	/*! Ensures non-blocking read() call. */
	fcntl(STDIN_FILENO, F_SETFL, fcntl(0, F_GETFL) | O_NONBLOCK);
	while (1)
	{
		ssize_t numRead = read(STDIN_FILENO, &buf, 1);

		if (numRead > 0)
		{
			char input = buf[0];
			if (input >= 32 && input <= 126)
			{
				if (input == '1')
				{
					xQueueSend(eventQueue, &raiseOnButtonID, 0U);
				}
				else if (input == '0')
				{
					xQueueSend(eventQueue, &raiseOffButtonID, 0U);
				}
				if (input != '\n')
				{
					xQueueSend(eventQueue, &displayBrightnessID, 0U);
				}
			}
		}
		else
		{
			vTaskDelay(pdMS_TO_TICKS(100));
		}
	}
}

/*! This function dispatches the received events and delegates them to the light switch */
static void eventDelegater(void *parameters)
{
	LightSwitch *lightSwitch = (LightSwitch *)parameters;
	uint32_t receivedTaskID;
	for (;;)
	{
		xQueueReceive(eventQueue, &receivedTaskID, portMAX_DELAY);
		if (receivedTaskID == updateTimerServiceID)
		{
			sc_timer_service_proceed(&timer_service, 100);
		}
		else if (receivedTaskID == raiseOnButtonID)
		{
			/*! Raises the On event in the state machine which causes the corresponding transition to be taken */
			lightSwitch_user_raise_on_button(lightSwitch);
		}
		else if (receivedTaskID == raiseOffButtonID)
		{
			/*! Raises the Off event in the state machine */
			lightSwitch_user_raise_off_button(lightSwitch);
		}
		else if (receivedTaskID == displayBrightnessID)
		{
			/*! Prints the value of the brightness variable */
			printf("Brightness: %d.\n", lightSwitch_light_get_brightness(lightSwitch));
		}
	}
}

int main(void)
{
	/*! Initialize the event queue */
	eventQueue = xQueueCreate(2, sizeof(uint32_t));

	/*! Create a task, which delegates the events to the state machine */
	xTaskCreate(eventDelegater,
				"TaskReceiver",
				configMINIMAL_STACK_SIZE,
				&lightSwitch,
				1,
				NULL);

	/*! Instantiates a timer task which gets executed every 100 ms */
	TimerHandle_t xTimer = xTimerCreate("Timer",
										100,
										pdTRUE,
										NULL,
										timerCallback);

	/*! Initializes the timer service */
	sc_timer_service_init(&timer_service, timers, MAX_TIMERS,
						  (sc_raise_time_event_fp)&lightSwitch_raise_time_event);

	/*! Initializes the state machine, in particular all variables are set to a proper value */
	lightSwitch_init(&lightSwitch);

	/*! Subscribes observers to the state machine's observables */
	subscribe_observers(&lightSwitch, &lightOnObserver, &lightOffObserver);

	/*! Enters the state machine; from this point on the state machine is ready to react on incoming event */
	lightSwitch_enter(&lightSwitch);

	/*! Start the timer task, which will be update and handle all timed events*/
	xTimerStart(xTimer, 0);

	/*! Create a task which allows to interact with the keyboard */
	xTaskCreate(KeyboardPollTask, "KeyboardPoll", configMINIMAL_STACK_SIZE, NULL, 1, NULL);

	puts("Type 1 or 0 to switch the light on or off.\n");

	/*! Start the freeRTOS scheduler*/
	vTaskStartScheduler();

	return 0;
}

/*! This function will be called for each time event in LightSwitch when a state is entered. */
void lightSwitch_set_timer(LightSwitch *handle, const sc_eventid evid,
						   const sc_integer time_ms, const sc_boolean periodic)
{
	sc_timer_set(&timer_service, handle, evid, time_ms, periodic);
}

/*! This function will be called for each time event in LightSwitch when a state will be left. */
void lightSwitch_unset_timer(LightSwitch *handle, const sc_eventid evid)
{
	sc_timer_unset(&timer_service, evid);
}
