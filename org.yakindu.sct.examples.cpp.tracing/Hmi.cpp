/*
 * Hmi.cpp
 *
 *  Created on: 05.11.2020
 *      Author: aterfloth
 */

#include "Hmi.h"
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <iostream>

using namespace std;


Hmi::Hmi(Tictoc &machine) : machine(machine) {

    fcntl(STDIN_FILENO, F_SETFL, fcntl(0, F_GETFL) | O_NONBLOCK);
}

Hmi::~Hmi() {
	// TODO Auto-generated destructor stub
}


void Hmi::increaseDelay() {
	sc_integer increment = 10;
	sc_integer delay = machine.getDelay();

	if (delay >= 1000) {
		increment = 1000;
	} else if (delay >= 100) {
		increment = 100;
	}

	machine.setDelay( delay + increment);
}


void Hmi::decreaseDelay() {
	sc_integer increment = -1000;
	sc_integer delay = machine.getDelay();

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

	machine.setDelay( delay + increment);
}

void Hmi::proceed()
{
	int numRead = read(STDIN_FILENO,buf,1);

    if(numRead > 0){
    	char c = buf[0];

    	switch (c) {
    		case 't':
    			machine.raiseToggle();
    			break;
    		case '+':
    			this->increaseDelay();
    			break;
    		case '-':
    			this->decreaseDelay();
    			break;
    		case 'l':
//    			trace_logger->enabled = ! trace_logger->enabled;
//    			printf("switched log %s\n", (trace_logger->enabled) ? "on" : "off");
    			break;
    		case 'u':
//    			trace_stream->enabled = ! trace_stream->enabled;
//    			printf("switched stream %s\n", (trace_stream->enabled) ? "on" : "off");
    			break;
    		case 'h':
    			this->help();
    			break;
    	}
    }
}

void Hmi::help() {
	cout
		<< "Welcome to Tictoc! \nPress:\n"
		<< ">t< to toggle tictoc idle stat\n"
		<< ">+< to increase tictoc delay\n"
		<< ">-< to decrease tictoc delay\n"
		<< ">l< to enable or disable log\n"
		<< ">u< to disable or enable udp tracing\n"
		<< ">h< for this help\n"
		<< "... followed by ENTER.\n\n\n";
}
