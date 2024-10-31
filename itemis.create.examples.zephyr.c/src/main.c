#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

#include <zephyr/kernel.h>
#include <zephyr/drivers/uart.h>
#include <zephyr/sys/printk.h>
#include <zephyr/console/console.h>

#include "../src-gen/LightSwitch.h"
#include "../src-gen/sc_rxc.h"
#include "../src-gen/sc_timer_service.h"

/* ! As we make use of time triggers (after & every)
 * we make use of a generic timer implementation
 * and need a defined number of timers. */
#define MAX_TIMERS 4
#define STACK_SIZE 512
#define PRIORITY   5

//! We allocate the desired array of timers.
static sc_timer_t timers[MAX_TIMERS];

//! The timers are managed by a timer service. */
static sc_timer_service_t timer_service;

static char buf[20];

/*! Stores the input events */
static struct k_msgq event_queue;

/*! Timer for timer service */
static struct k_timer timer_service_update_timer;

/*! Input event IDs*/
const uint32_t updateTimerServiceID = 0;
const uint32_t raiseOnButtonID = 1;
const uint32_t raiseOffButtonID = 2;
const uint32_t displayBrightnessID = 3;

/* Message queue buffer */
#define EVENT_QUEUE_SIZE 4
static uint32_t event_queue_buffer[EVENT_QUEUE_SIZE];

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

void timer_service_callback(struct k_timer *dummy)
{
	uint32_t event_id = updateTimerServiceID;
	k_msgq_put(&event_queue, &event_id, K_NO_WAIT);
}

void keyboard_poll_thread(void *lightSwitch, void *unused1, void *unused2)
{
	/*! Ensures non-blocking read() call. */
	fcntl(STDIN_FILENO, F_SETFL, fcntl(0, F_GETFL) | O_NONBLOCK);
	while (1) {
		ssize_t numRead = read(STDIN_FILENO, &buf, 1);

		if (numRead > 0) {
			char input = buf[0];
			if (input >= 32 && input <= 126) {
				if (input == '1') {
					k_msgq_put(&event_queue, &raiseOnButtonID, K_NO_WAIT);
				} else if (input == '0') {
					k_msgq_put(&event_queue, &raiseOffButtonID, K_NO_WAIT);
				}
				if (input != '\n') {
					k_msgq_put(&event_queue, &displayBrightnessID, K_NO_WAIT);
				}
			}
		}
		} else {
			k_sleep(K_MSEC(100));
		}
}

void event_delegater_thread(void *lightSwitch, void *unused1, void *unused2)
{
	LightSwitch *ls = (LightSwitch *)lightSwitch;
	uint32_t receivedTaskID;
	while (1) {
		k_msgq_get(&event_queue, &receivedTaskID, K_FOREVER);
		if (receivedTaskID == updateTimerServiceID) {
            // printk("update timer");
			sc_timer_service_proceed(&timer_service, 100);
		} else if (receivedTaskID == raiseOnButtonID) {
            printk("raise button on\n");
			lightSwitch_user_raise_on_button(ls);
		} else if (receivedTaskID == raiseOffButtonID) {
            printk("raise button off\n");
			lightSwitch_user_raise_off_button(ls);
		} else if (receivedTaskID == displayBrightnessID) {
			printk("Brightness: %d.\n", lightSwitch_light_get_brightness(ls));
		}
		k_yield();
	}
}

K_THREAD_STACK_DEFINE(event_delegater_stack_area, STACK_SIZE);
struct k_thread event_delegater_thread_data;

K_THREAD_STACK_DEFINE(keyboard_poll_stack_area, STACK_SIZE);
struct k_thread keyboard_poll_thread_data;

/*! Instantiates the state machine */
LightSwitch lightSwitch;

/*! Instantiates observer for the out events */
sc_single_subscription_observer lightOnObserver;
sc_single_subscription_observer lightOffObserver;

int main(void)
{
	k_msgq_init(&event_queue, (char *)event_queue_buffer, sizeof(uint32_t), EVENT_QUEUE_SIZE);

	k_thread_create(&event_delegater_thread_data, event_delegater_stack_area,
			K_THREAD_STACK_SIZEOF(event_delegater_stack_area), event_delegater_thread,
			&lightSwitch, NULL, NULL, PRIORITY, 0, K_NO_WAIT);

	k_timer_init(&timer_service_update_timer, timer_service_callback, NULL);



	/*! Initializes the timer service */
	sc_timer_service_init(&timer_service, timers, MAX_TIMERS,
			      (sc_raise_time_event_fp)&lightSwitch_raise_time_event);

	/*! Initializes the state machine, in particular all variables are set to a proper
	 * value */
	lightSwitch_init(&lightSwitch);

	/*! Subscribes observers to the state machine's observables */
	subscribe_observers(&lightSwitch, &lightOnObserver, &lightOffObserver);

	/*! Enters the state machine; from this point on the state machine is ready to react
	 * on incoming event */
	lightSwitch_enter(&lightSwitch);

	k_timer_start(&timer_service_update_timer, K_MSEC(100), K_MSEC(100));

	k_thread_create(&keyboard_poll_thread_data, keyboard_poll_stack_area,
			K_THREAD_STACK_SIZEOF(keyboard_poll_stack_area), keyboard_poll_thread, NULL,
			NULL, NULL, PRIORITY + 1, 0, K_NO_WAIT);

	puts("Type 1 or 0 to switch the light on or off.\n");

	return 0;
}

/*! This function will be called for each time event in LightSwitch when a state is entered.
 */
void lightSwitch_set_timer(LightSwitch *handle, const sc_eventid evid, const sc_integer time_ms,
			   const sc_boolean periodic)
{
	sc_timer_set(&timer_service, handle, evid, time_ms, periodic);
}

/*! This function will be called for each time event in LightSwitch when a state will be
 * left. */
void lightSwitch_unset_timer(LightSwitch *handle, const sc_eventid evid)
{
	sc_timer_unset(&timer_service, evid);
}
