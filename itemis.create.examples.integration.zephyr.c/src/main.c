#include <unistd.h>
#include <fcntl.h>

#include <zephyr/kernel.h>
#include <zephyr/drivers/uart.h>
#include <zephyr/sys/printk.h>
#include <zephyr/console/console.h>

#include "../src-gen/StateMachine.h"
#include "../src-gen/sc_rxc.h"
#include "../src-gen/sc_timer_service.h"

/* ! As we make use of time triggers (after & every)
 * we make use of a generic timer implementation
 * and need a defined number of timers. */
#define MAX_TIMERS 4
#define TIMER_THREAD_TIME_MS 100
#define STACK_SIZE 512
#define PRIORITY 5

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
static struct k_msgq inEventQueue;
static struct k_msgq outEventQueue;

/* Message queue buffer */
#define EVENT_QUEUE_SIZE 4
static uint32_t in_event_queue_buffer[EVENT_QUEUE_SIZE];
static uint32_t out_event_queue_buffer[EVENT_QUEUE_SIZE];

/*! Timer for timer service */
static struct k_timer timer;

/*! Define threads*/
K_THREAD_STACK_DEFINE(statemachine_stack_area, STACK_SIZE);
struct k_thread statemachine_thread_data;

K_THREAD_STACK_DEFINE(input_stack_area, STACK_SIZE);
struct k_thread input_thread_data;

K_THREAD_STACK_DEFINE(output_stack_area, STACK_SIZE);
struct k_thread output_thread_data;

/*! This function will be called by raising the out event outEvent1 */
static void on_outEvent1(StateMachine *o)
{
	k_msgq_put(&outEventQueue, &outEvent1ID, K_NO_WAIT);
}

/*! This function will be called by raising the out event outEvent2 */
static void on_outEvent2(StateMachine *o)
{
	k_msgq_put(&outEventQueue, &outEvent2ID, K_NO_WAIT);
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
static void timer_callback(struct k_timer *unused1)
{
	uint32_t event_id = updateTimerServiceID;
	k_msgq_put(&inEventQueue, &event_id, K_NO_WAIT);
}

/*! This task is executed in order to interact with the keyboard */
static void input_callback(void *parameter1, void *unused1, void *unused2)
{
	StateMachine *statemachine = (StateMachine *)parameter1;
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
				k_msgq_put(&inEventQueue, &inEvent1ID, K_NO_WAIT);
			}
			else if (input == '2')
			{
				k_msgq_put(&inEventQueue, &inEvent2ID, K_NO_WAIT);
			}
		}
		else
		{
			k_sleep(K_MSEC(100));
		}
	}
}

/*! This function dispatches the received events and delegates them to the statemachine */
static void statemachine_callback(void *parameter1, void *unused1, void *unused2)
{
	StateMachine *statemachine = (StateMachine *)parameter1;
	uint32_t receivedInEventID;
	while (!stateMachine_is_final(statemachine))
	{
		k_msgq_get(&inEventQueue, &receivedInEventID, K_FOREVER);
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
		k_yield();
	}
}

static void output_callback(void *parameter1, void *unused1, void *unused2)
{
	StateMachine *statemachine = (StateMachine *)parameter1;
	uint32_t receivedOutEventID;
	while (!stateMachine_is_final(statemachine))
	{
		k_msgq_get(&outEventQueue, &receivedOutEventID, K_FOREVER);
		if (receivedOutEventID == outEvent1ID)
		{
			printk("received outEvent2\n");
		}
		else if (receivedOutEventID == outEvent2ID)
		{
			printk("received outEvent1\n");
		}
		k_yield();
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
	k_msgq_init(&inEventQueue, (char *)in_event_queue_buffer, sizeof(uint32_t), EVENT_QUEUE_SIZE);
	k_msgq_init(&outEventQueue, (char *)out_event_queue_buffer, sizeof(uint32_t), EVENT_QUEUE_SIZE);

	/*! Enters the state machine; from this point on the state machine is ready to react on incoming event */
	stateMachine_enter(&statemachine);

	/*! Initialize a timer thread which gets executed every 100 ms */
	k_timer_init(&timer, timer_callback, NULL);

	/*! Start the timer thread, which will be update and handle all timed events*/
	k_timer_start(&timer, K_MSEC(TIMER_THREAD_TIME_MS), K_MSEC(TIMER_THREAD_TIME_MS));

	// /*! Create a thread, which delegates the events to the state machine */
	k_thread_create(&statemachine_thread_data, statemachine_stack_area,
					K_THREAD_STACK_SIZEOF(statemachine_stack_area), statemachine_callback, &statemachine,
					NULL, NULL, PRIORITY, 0, K_NO_WAIT);

	// /*! Create a thread which allows to interact with the keyboard */
	k_thread_create(&input_thread_data, input_stack_area,
					K_THREAD_STACK_SIZEOF(input_stack_area), input_callback, &statemachine,
					NULL, NULL, PRIORITY, 0, K_NO_WAIT);
					

	// /*! Create a thread, which handles the out events */
	k_thread_create(&output_thread_data, output_stack_area,
					K_THREAD_STACK_SIZEOF(output_stack_area), output_callback, &statemachine,
					NULL, NULL, PRIORITY, 0, K_NO_WAIT);

	printk("Type 1 or 0 to switch the light on or off.\n");

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
