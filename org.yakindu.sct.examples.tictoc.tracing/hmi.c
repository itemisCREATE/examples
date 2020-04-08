/*
 * hmi.c
 *
 *  Created on: 07.04.2020
 *      Author: terfloth
 */


#include "hmi.h"
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>


static char buf[20];
static Tictoc* tictoc;
static yet_logger* trace_logger;
static yet_udp_stream* trace_stream;


static void increaseDelay() {
	sc_integer increment = 10;
	sc_integer delay = tictocIface_get_delay(tictoc);

	if (delay >= 1000) {
		increment = 1000;
	} else if (delay >= 100) {
		increment = 100;
	}

	tictocIface_set_delay(tictoc, delay + increment);
}


static void decreaseDelay() {
	sc_integer increment = -1000;
	sc_integer delay = tictocIface_get_delay(tictoc);

	if (delay <= 10) return;

	if (delay < 20) {
		increment = 10 - delay;
	} else if (delay <= 100) {
		increment = -10;
	} else if (delay < 200 ) {
		increment = 100 - delay;
	} else if (delay <= 1000) {
		increment = -100;
	} else if (delay < 2000) {
		increment = 1000 - delay;
	}

	tictocIface_set_delay(tictoc, delay + increment);
}


void hmi_help() {
    printf("Welcome to Tictoc! Press:\n");
    printf(">t< to toggle tictoc idle state\n");
    printf(">+< to increase tictoc delay\n");
    printf(">-< to decrease tictoc delay\n");
    printf(">l< to enable or disable log\n");
    printf(">u< to disable or enable udp tracing\n");
    printf(">h< for this help\n");
    printf("... followed by ENTER.\n\n\n");
}

void hmi_init(Tictoc* machine, yet_logger* logger, yet_udp_stream* udp_trace)
{
	tictoc = machine;
	trace_logger = logger;
	trace_stream = udp_trace;

    fcntl(STDIN_FILENO, F_SETFL, fcntl(0, F_GETFL) | O_NONBLOCK);
}


void hmi_proceed()
{
	int numRead = read(STDIN_FILENO,buf,1);

    if(numRead > 0){
    	char c = buf[0];

    	switch (c) {
    		case 't':
    			tictocIface_raise_toggle(tictoc);
    			break;
    		case '+':
    			increaseDelay();
    			break;
    		case '-':
    			decreaseDelay();
    			break;
    		case 'l':
    			trace_logger->enabled = ! trace_logger->enabled;
    			printf("switched log %s\n", (trace_logger->enabled) ? "on" : "off");
    			break;
    		case 'u':
    			trace_stream->enabled = ! trace_stream->enabled;
    			printf("switched stream %s\n", (trace_stream->enabled) ? "on" : "off");
    			break;
    		case 'h':
    			hmi_help();
    			break;
    	}
    }
}


