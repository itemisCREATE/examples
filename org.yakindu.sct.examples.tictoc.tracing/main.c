/*
 * main.c
 *
 *  Created on: 23.05.2019
 *      Author: rbeckmann, terfloth
 */

#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>

#include "sc/base/sc_rxc.h"
#include "sc/Tictoc.h"
#include "sc/TictocTracer.h"
#include "sc/TictocRequired.h"
#include "sc/util/sc_timer_service.h"
#include "sc/util/yet_file.h"
#include "sc/util/yet_udp_stream.h"
#include "sc/util/yet_logger.h"

#include "hmi.h"

#define SCT_PORT 4444
#define SCT_IP "127.0.0.1"

//******************************************************************************************************
// declaration of everything related to the timer required for the state machine

/*! Maximum count of concurrently required timers required to implement time triggers (after & every). */
#define MAX_TIMERS 3

/*! Allocate the desired array of timers. */
static sc_timer_t timers[MAX_TIMERS];

/*! The timers are managed by a timer service. */
static sc_timer_service_t timer_service;

/*! callback implementation for the setting up time events. */
void tictoc_setTimer(Tictoc* handle, const sc_eventid evid, const sc_integer time_ms, const sc_boolean periodic){
	sc_timer_start(&timer_service, (void*) handle, evid, time_ms, periodic);
}

/*! callback implementation for canceling time events. */
void tictoc_unsetTimer(Tictoc* handle, const sc_eventid evid) {
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
unsigned long get_current_timestamp() {
	unsigned long ms = get_ms();
	unsigned long timestamp =  ms - timestamp_offset;
	return timestamp;
}



//******************************************************************************************************
// declaration of everything related to the state machine itself

/* The state machine is allocated statically. */
Tictoc tictoc;

/* Also the YET tracer is allocated statically. */
yet_sc_tracer tictocTracer;

yet_file_writer yet_file;
yet_udp_stream  yet_stream;
yet_logger		yet_log;

sc_observer* out_trace_observers[] = {
		&(yet_log.send_logger),
		&(yet_file.message_writer),
		&(yet_stream.message_sender)
};

sc_observer* in_trace_observers[] = {
		&(yet_log.receive_logger),
		&(tictocTracer.scope.message_receiver)
};



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
				(sc_raise_time_event_fp) &tictoc_raiseTimeEvent);

	/* initialize the state machine. */
	tictoc_init(&tictoc);

	/* initialize the state machine specific tracer. */
	tictoc_init_sc_tracer(&tictocTracer, &tictoc);

	/* initialize different physical channels for the execution trace.
	 * These imclude a yet file, a UDP based yet stream, and a stdout logger.
	 * Custom channels could be added. */
	yet_file_writer_init(&yet_file, "trace.yet");
	yet_udp_stream_init(&yet_stream, ip, port);
	yet_logger_init(&yet_log);

	/* Connect incoming message from UPD yet stream to the tracer and the logger. */
	SC_OBSERVABLE_SUBSCRIBE(&(yet_stream.received_messages), in_trace_observers);
	/* Connect outgoing message stream to all physical channels */
	SC_OBSERVABLE_SUBSCRIBE(&(tictocTracer.scope.trace_messages), out_trace_observers);

	/* start UDP yet stream */
	yet_udp_stream_connect(&yet_stream);

	/* init the hmi */
	hmi_init(&tictoc, &yet_log, &yet_stream);
	hmi_help();

	/* activate the state machine */
	tictoc_enter(&tictoc);

}


void loop() {

	struct timespec sleep;
	sleep.tv_sec = 0;
	sleep.tv_nsec = 100;
	unsigned long last_time = 0;

	while(bool_true) {
		nanosleep(&sleep, 0);

		unsigned long time = get_current_timestamp();
		sc_timer_service_proceed(&timer_service, time - last_time);
		last_time = time;

		hmi_proceed();
		yet_udp_stream_receive(&yet_stream);

	}
}


int main(int argc, char **argv) {

	timestamp_offset = get_ms();

	// set up all structures
	setup(argc, argv);

	// execute the main loop
	loop();

}


