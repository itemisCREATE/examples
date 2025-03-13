#include <unistd.h>
#include <fcntl.h>

#include <zephyr/kernel.h>
#include <zephyr/drivers/uart.h>
#include <zephyr/sys/printk.h>
#include <zephyr/console/console.h>

#include "../src-gen/Light.h"
#include "../src-gen/LightController.h"
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
LightController controller;
/* Instantiates and sets the sub machines */
Light light1;
Light light2;

/*! Instantiates observer for the out events */
sc_single_subscription_observer_sc_integer light1Observer;
sc_single_subscription_observer_sc_integer light2Observer;

/*! Event IDs*/
const uint32_t updateTimerServiceID = 0;
const uint32_t switchOnID = 1;
const uint32_t switchOffID = 2;
const uint32_t blinkModeID = 3;

typedef struct {
	const uint32_t id;
	sc_integer value;
} lightBrightness_t;

const uint32_t light1BrightnessID = 1;
const uint32_t light2BrightnessID = 2;

lightBrightness_t light1Brightness = {
	.id = light1BrightnessID,
	.value = 0,
};

lightBrightness_t light2Brightness = {
	.id = light2BrightnessID,
	.value = 0,
};

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
K_THREAD_STACK_DEFINE(controller_stack_area, STACK_SIZE);
struct k_thread controller_thread_data;

K_THREAD_STACK_DEFINE(input_stack_area, STACK_SIZE);
struct k_thread input_thread_data;

K_THREAD_STACK_DEFINE(output_stack_area, STACK_SIZE);
struct k_thread output_thread_data;

/*! This function will be called when brightness_changed event is called in light1 */
static void on_light1_brightness_changed(LightController *o, sc_integer value) {
	light1Brightness.value = value;
	k_msgq_put(&outEventQueue, &light1Brightness, K_NO_WAIT);
}

/*! This function will be called when brightness_changed event is called in light2 */
static void on_light2_brightness_changed(LightController *o, sc_integer value) {
	light2Brightness.value = value;
	k_msgq_put(&outEventQueue, &light2Brightness, K_NO_WAIT);
}

/*! This function is used in the timer service and required to reuse the same timer service for all state machines */
static void dispatchTimeEvent(void *handle, sc_eventid evid) {
	if (handle == &controller) {
		lightController_raise_time_event(&controller, evid);
	}
	if (handle == &light1) {
		light_raise_time_event(&light1, evid);
	}
	if (handle == &light2) {
		light_raise_time_event(&light2, evid);
	}
}

/*! Subscribes the observers on the out event observables outEvent1 and outEvent2 */
static void subscribe_observers(Light *light1, Light *light2,
	sc_single_subscription_observer_sc_integer *light1Observer,
	sc_single_subscription_observer_sc_integer *light2Observer)
{
	/*! Subscribes observers to the lights' brightness_changed events */
	sc_single_subscription_observer_sc_integer_init(light1Observer, light1,
			(sc_observer_next_sc_integer_fp) on_light1_brightness_changed);
	sc_single_subscription_observer_sc_integer_subscribe(light1Observer,
			&light1->iface.brightness_changed);
	sc_single_subscription_observer_sc_integer_init(light2Observer, light2,
			(sc_observer_next_sc_integer_fp) on_light2_brightness_changed);
	sc_single_subscription_observer_sc_integer_subscribe(light2Observer,
			&light2->iface.brightness_changed);
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
	LightController *controller = (LightController *)controller;
	/*! Ensures non-blocking read() call. */
	fcntl(STDIN_FILENO, F_SETFL, fcntl(0, F_GETFL) | O_NONBLOCK);
	while (!lightController_is_final(controller))
	{
		ssize_t numRead = read(STDIN_FILENO, &buf, 1);
		if (numRead > 0)
		{
			char input = buf[0];
			if (input == '1') {
				k_msgq_put(&inEventQueue, &switchOnID, K_NO_WAIT);
			} 
			else if (input == '0') {
				k_msgq_put(&inEventQueue, &switchOffID, K_NO_WAIT);
			} 
			else if (input == '2') {
				k_msgq_put(&inEventQueue, &blinkModeID, K_NO_WAIT);
			}
		}
		else
		{
			k_sleep(K_MSEC(100));
		}
	}
}

/*! This function dispatches the received events and delegates them to the statemachine */
static void controller_callback(void *parameter1, void *unused1, void *unused2)
{
	LightController *controller = (LightController *)parameter1;
	uint32_t receivedInEventID;
	while (!lightController_is_final(controller))
	{
		k_msgq_get(&inEventQueue, &receivedInEventID, K_FOREVER);
		if (receivedInEventID == updateTimerServiceID)
		{
			sc_timer_service_proceed(&timer_service, TIMER_THREAD_TIME_MS);
		}
		else if (receivedInEventID == switchOnID)
		{
			lightController_user_raise_switch_on(controller);
		}
		else if (receivedInEventID == switchOffID)
		{
			lightController_user_raise_switch_off(controller);
		}
		else if (receivedInEventID == blinkModeID)
		{
			lightController_user_raise_blink_mode(controller);
		}
		k_yield();
	}
}

static void output_callback(void *parameter1, void *unused1, void *unused2)
{
	LightController *controller = (LightController *)parameter1;
	lightBrightness_t receivedBrightness;
	while (!lightController_is_final(controller))
	{
		k_msgq_get(&outEventQueue, &receivedBrightness, K_FOREVER);
		if (receivedBrightness.id == light1Brightness.id) {
			printk("Light 1 Brightness: %d\n", light1Brightness.value);
		}
		else if (receivedBrightness.id == light2Brightness.id) {
			printk("Light 2 Brightness: %d\n", light2Brightness.value);
		}
		k_yield();
	}
}

int main(int argc, char **argv) {
	/*! Initializes the timer service */
	sc_timer_service_init(&timer_service, timers, MAX_TIMERS,
			(sc_raise_time_event_fp) &dispatchTimeEvent);

	/*! Initializes the state machines and sets all sub machines */
	lightController_init(&controller);
	light_init(&light1);
	light_init(&light2);
	lightController_set_light1(&controller, &light1);
	lightController_set_light2(&controller, &light2);

	/*! Subscribes observers to the state machine's observables */
	subscribe_observers(&light1, &light2, &light1Observer, &light2Observer);

	/*! Initialize the queues */
	k_msgq_init(&inEventQueue, (char *)in_event_queue_buffer, sizeof(uint32_t), EVENT_QUEUE_SIZE);
	k_msgq_init(&outEventQueue, (char *)out_event_queue_buffer, sizeof(uint32_t), EVENT_QUEUE_SIZE);

	/*! Enters the state machine; from this point on the state machine is ready to react on incoming event */
	lightController_enter(&controller);

	/*! Initialize a timer thread which gets executed every 100 ms */
	k_timer_init(&timer, timer_callback, NULL);

	/*! Start the timer thread, which will be update and handle all timed events*/
	k_timer_start(&timer, K_MSEC(TIMER_THREAD_TIME_MS), K_MSEC(TIMER_THREAD_TIME_MS));

	/*! Create a thread, which delegates the events to the state machine */
	k_thread_create(&controller_thread_data, controller_stack_area,
		K_THREAD_STACK_SIZEOF(controller_stack_area), controller_callback, &controller,
		NULL, NULL, PRIORITY, 0, K_NO_WAIT);

	// /*! Create a thread which allows to interact with the keyboard */
	k_thread_create(&input_thread_data, input_stack_area,
				K_THREAD_STACK_SIZEOF(input_stack_area), input_callback, &controller,
				NULL, NULL, PRIORITY, 0, K_NO_WAIT);
				

	/*! Create a thread, which handles the out events */
	k_thread_create(&output_thread_data, output_stack_area,
				K_THREAD_STACK_SIZEOF(output_stack_area), output_callback, &controller,
				NULL, NULL, PRIORITY, 0, K_NO_WAIT);

	printk("Type 1 or 0 to switch the lights on or off.\n");
	printk("Type 2 to toggle the blink mode.\n");

	return 0;
}

/*! This function will be called for each time event in LightController when a state is entered. */
void lightController_set_timer(LightController *handle, const sc_eventid evid,
		const sc_integer time_ms, const sc_boolean periodic) {
	sc_timer_set(&timer_service, handle, evid, time_ms, periodic);
}

/*! This function will be called for each time event in LightController when a state will be left. */
void lightController_unset_timer(LightController *handle, const sc_eventid evid) {
	sc_timer_unset(&timer_service, evid);
}

/*! This function will be called for each time event in Light when a state is entered. */
void light_set_timer(Light *handle, const sc_eventid evid,
		const sc_integer time_ms, const sc_boolean periodic) {
	sc_timer_set(&timer_service, handle, evid, time_ms, periodic);
}

/*! This function will be called for each time event in Light when a state will be left. */
void light_unset_timer(Light *handle, const sc_eventid evid) {
	sc_timer_unset(&timer_service, evid);
}
