#include "hmi.h"
#include <fcntl.h>
#include <iostream>
#include <unistd.h>

Hmi::Hmi(Tictoc& machine_, channels::Logger& logger_, channels::UdpStream& stream_) :
	machine(machine_), logger(logger_), stream(stream_)
{
	fcntl(STDIN_FILENO, F_SETFL, fcntl(STDIN_FILENO, F_GETFL) | O_NONBLOCK);
}

void Hmi::help() const
{
	std::cout << "Welcome to Tictoc! Press:" << std::endl
		<< ">t< to toggle tictoc idle state" << std::endl
		<< ">+< to increase tictoc delay" << std::endl
		<< ">-< to decrease tictoc delay" << std::endl
		<< ">l< to enable or disable log" << std::endl
		<< ">u< to disable or enable udp tracing" << std::endl
		<< ">h< for this help" << std::endl
		<< "... followed by ENTER." << std::endl << std::endl;
}

void Hmi::proceed()
{
	char c;
	if (read(STDIN_FILENO, &c, 1) > 0) {
		switch (c) {
		case 't':
			machine.raiseToggle();
			break;
		case '+':
			increaseDelay();
			break;
		case '-':
			decreaseDelay();
			break;
		case 'l':
			logger.enabled = !logger.enabled;
			std::cout << "switched log " << (logger.enabled ? "on" : "off") << std::endl;
			break;
		case 'u':
			stream.enabled = !stream.enabled;
			std::cout << "switched stream " << (stream.enabled ? "on" : "off") << std::endl;
			break;
		case 'h':
			help();
			break;
		default:
			break;
		}
	}
}

/* The step grows with the delay, and a decrease stops at the next step boundary - as in the C example. */
void Hmi::increaseDelay()
{
	sc::integer delay = machine.getDelay();
	sc::integer step = delay >= 1000 ? 1000 : (delay >= 100 ? 100 : 10);
	machine.setDelay(delay + step);
}

void Hmi::decreaseDelay()
{
	sc::integer delay = machine.getDelay();
	sc::integer step = -1000;
	if (delay <= 10) {
		step = 0;
	} else if (delay < 20) {
		step = 10 - delay;
	} else if (delay <= 100) {
		step = -10;
	} else if (delay < 200) {
		step = 100 - delay;
	} else if (delay <= 1000) {
		step = -100;
	} else if (delay < 2000) {
		step = 1000 - delay;
	}
	machine.setDelay(delay + step);
}
