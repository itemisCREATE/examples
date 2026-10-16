#ifndef CHANNELS_LOGGER_H_
#define CHANNELS_LOGGER_H_

#include <string>
#include "sc_rxcpp.h"

namespace channels {

/*! Prints the TAS messages a tracer sends and receives to the console. */
class Logger
{
public:
	Logger();

	/*! Subscribe it to the messages a tracer sends. */
	sc::rx::SimpleObserver<std::string> sent;

	/*! Subscribe it to the messages a tracer receives. */
	sc::rx::SimpleObserver<std::string> received;

	bool enabled;
};

} /* namespace channels */

#endif /* CHANNELS_LOGGER_H_ */
