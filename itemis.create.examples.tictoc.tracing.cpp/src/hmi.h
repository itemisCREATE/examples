#ifndef HMI_H_
#define HMI_H_

#include "Tictoc.h"
#include "channels/Logger.h"
#include "channels/UdpStream.h"

/*! Reads single character commands from the console and applies them. */
class Hmi
{
public:
	Hmi(Tictoc& machine, channels::Logger& logger, channels::UdpStream& stream);

	void help() const;

	/*! Applies a command that has been typed, if any; it does not block. */
	void proceed();

private:
	void increaseDelay();
	void decreaseDelay();

	Tictoc& machine;
	channels::Logger& logger;
	channels::UdpStream& stream;
};

#endif /* HMI_H_ */
