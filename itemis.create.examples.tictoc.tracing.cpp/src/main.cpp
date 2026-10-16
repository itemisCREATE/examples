#include <chrono>
#include <cstdlib>
#include <iostream>
#include <string>
#include <thread>
#include "Tictoc.h"
#include "TictocTracer.h"
#include "sc_timer_service.h"
#include "channels/FileWriter.h"
#include "channels/Logger.h"
#include "channels/UdpStream.h"
#include "hmi.h"

namespace {
const char* const DEFAULT_IP = "127.0.0.1";
const uint16_t DEFAULT_PORT = 4444;
const std::size_t MAX_TIMERS = 3;
const std::chrono::steady_clock::time_point start = std::chrono::steady_clock::now();
}

/* The TAS runtime asks the application for the time of every update, in milliseconds. */
sc::tas::Timestamp sc::tas::currentTimestamp()
{
	return static_cast<sc::tas::Timestamp>(
		std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::steady_clock::now() - start).count());
}

int main(int argc, char** argv)
{
	std::string ip = argc > 1 ? argv[1] : DEFAULT_IP;
	uint16_t port = argc > 2 ? static_cast<uint16_t>(std::atoi(argv[2])) : DEFAULT_PORT;
	std::cout << "Sending to " << ip << ":" << port << std::endl;

	sc::timer::TimerTask tasks[MAX_TIMERS];
	sc::timer::TimerService timerService(tasks, MAX_TIMERS);
	Tictoc machine;
	machine.setTimerService(&timerService);

	/* The tracer registers itself with the state machine. */
	TictocTracer tracer(machine);

	channels::FileWriter file("trace.tas");
	channels::UdpStream stream(ip, port);
	channels::Logger log;

	/* Stimuli received from the debugger go to the tracer and to the log. */
	tracer.subscribe(stream.getReceived());
	log.received.subscribe(stream.getReceived());

	/* The messages the tracer sends go to every channel. */
	log.sent.subscribe(tracer.getMessages());
	file.writer.subscribe(tracer.getMessages());
	stream.sender.subscribe(tracer.getMessages());

	stream.connect();
	Hmi hmi(machine, log, stream);
	hmi.help();

	machine.enter();

	sc::tas::Timestamp last = sc::tas::currentTimestamp();
	while (true) {
		std::this_thread::sleep_for(std::chrono::milliseconds(1));
		sc::tas::Timestamp now = sc::tas::currentTimestamp();
		timerService.proceed(static_cast<sc::time>(now - last));
		last = now;
		hmi.proceed();
		stream.receive();
	}
}
