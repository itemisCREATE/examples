/*
 * main.c
 *
 *  Created on: 23.05.2019
 *      Author: rbeckmann, terfloth, rherrmann
 */
#include <string.h>
#include <sys/param.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"
#include "esp_wifi.h"
#include "esp_event.h"
#include "esp_log.h"
#include "nvs_flash.h"
#include "tcpip_adapter.h"
#include "protocol_examples_common.h"

#include "lwip/err.h"
#include "lwip/sockets.h"
#include "lwip/sys.h"
#include <lwip/netdb.h>

#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <time.h>
#include <stdlib.h>

#include "driver/gpio.h"

#include "sc/base/sc_rxc.h"
#include "sc/sm/blink.h"
#include "sc/sm/blink_tracer.h"
#include "sc/sm/blink_required.h"
#include "sc/util/sc_timer_service.h"
#include "sc/util/yet_udp_stream.h"
#include "sc/util/yet_logger.h"

#include "hmi.h"



#define SCT_PORT 4444
// you can find your local IP using 'ifconfig' on linux/mac
// or using 'ipconfig' on windwos
#define SCT_IP "Add your IP "
#define SCT_IP_LOCAL "127.0.0.1"


//******************************************************************************************************
// declaration of everything related to the timer required for the state machine

/*! Maximum count of concurrently required timers required to implement time triggers (after & every). */
#define MAX_TIMERS 3

/*! Allocate the desired array of timers. */
static sc_timer_t timers[MAX_TIMERS];

/*! The timers are managed by a timer service. */
static sc_timer_service_t timer_service;

/*! callback implementation for pinMode. */
void blink_pinMode(Blink* handle, const sc_integer pin, const sc_integer mode){
    gpio_pad_select_gpio(pin);
    gpio_set_direction(pin, mode);
	printf("Configure LED pin %d as %s.\n", pin, mode ? "OUTPUT" : "INPUT");
}

/*! callback implementation for digitalWrite. */
void blink_digitalWrite(Blink* handle, const sc_integer pin, const sc_integer value){
    gpio_set_level(pin, value);
	printf("Set LED pin %d %s.\n", pin, value ? "HIGH" : "LOW");
}

/*! callback implementation for the setting up time events. */
void blink_set_timer(Blink* handle, const sc_eventid evid, const sc_integer time_ms, const sc_boolean periodic){
	sc_timer_start(&timer_service, (void*) handle, evid, time_ms, periodic);
}

/*! callback implementation for canceling time events. */
void blink_unset_timer(Blink* handle, const sc_eventid evid) {
	sc_timer_cancel(&timer_service, evid);
}

unsigned long timestamp_offset = 0;


unsigned long get_ms() {
	struct timeval tv;
	unsigned long ms;
	gettimeofday(&tv, 0);
	ms = tv.tv_sec * 1000 + (tv.tv_usec / 1000);
	return ms;
}


/*! Function to retrieve the current timestamp, ideally in milliseconds. */
yet_timestamp yet_current_timestamp() {
	unsigned long ms = get_ms();
	unsigned long timestamp =  ms - timestamp_offset;
	return timestamp;
}



//******************************************************************************************************
// declaration of everything related to the state machine itself

/* The state machine is allocated statically. */
Blink blink;

/* Also the YET tracer is allocated statically. */
yet_sc_tracer blinkTracer;

yet_udp_stream  yet_stream;
yet_logger		yet_log;


char * udp_ip(int argc, char **argv) {
	if(argc > 1) {
		return argv[1];
	} else {
		return SCT_IP;
	}
}

uint16_t udp_port(int argc, char **argv){
	if(argc > 2) {
		return atoi(argv[2]);
	} else {
		return SCT_PORT;
	}
}


void setup(int argc, char **argv) {

	/* read ip addreass and port for UDP socket from arguments. */
	uint16_t port = udp_port(argc,  argv);
	char*    ip   = udp_ip(argc, argv);
	printf("Sending to %s:%d\n", ip, port);

	/* initialize the timer service */
	sc_timer_service_init(
				&timer_service,
				timers, MAX_TIMERS,
				(sc_raise_time_event_fp) &blink_raise_time_event);

	/* initialize the state machine. */
	blink_init(&blink);

	/* initialize the state machine specific tracer. */
	blink_init_sc_tracer(&blinkTracer, &blink);

	/* initialize different physical channels for the execution trace.
	 * These imclude a yet file, a UDP based yet stream, and a stdout logger.
	 * Custom channels could be added. */
	yet_udp_stream_init(&yet_stream, ip, port);
	yet_logger_init(&yet_log);

	/* Connect incoming message from UPD yet stream to the tracer and the logger. */
	sc_single_subscription_observer_sc_string_subscribe(&(yet_log.receive_logger), &(yet_stream.received_messages));
	sc_single_subscription_observer_sc_string_subscribe(&(blinkTracer.scope.message_receiver), &(yet_stream.received_messages));
	
	
	/* Connect outgoing message stream to all physical channels */
	sc_single_subscription_observer_sc_string_subscribe(&(yet_log.send_logger), &(blinkTracer.scope.trace_messages));
	sc_single_subscription_observer_sc_string_subscribe(&(yet_stream.message_sender), &(blinkTracer.scope.trace_messages));

	/* start UDP yet stream */
	yet_udp_stream_connect(&yet_stream);

	/* init the hmi */
	hmi_init(&blink, &yet_log, &yet_stream);
	hmi_help();

	/* activate the state machine */
	blink_enter(&blink);

}


void loop(void *pvParameters) {
	unsigned long last_time = 0;

	while(1) {
		vTaskDelay(1/portTICK_PERIOD_MS);

		yet_timestamp time = yet_current_timestamp();
		sc_timer_service_proceed(&timer_service, time - last_time);
		last_time = time;

		hmi_proceed();
		yet_udp_stream_receive(&yet_stream);

	}
}

void app_main(int argc, char **argv)
{
    ESP_ERROR_CHECK(nvs_flash_init());
    tcpip_adapter_init();
    ESP_ERROR_CHECK(esp_event_loop_create_default());


    ESP_ERROR_CHECK(example_connect());

    printf("Hello YAKINDU Statechart Tools!\n");

	timestamp_offset = get_ms();

	// set up all structures
	setup(argc, argv);

	// execute the main loop
	xTaskCreate(loop, "loop", 4096, NULL, 5, NULL);
}
