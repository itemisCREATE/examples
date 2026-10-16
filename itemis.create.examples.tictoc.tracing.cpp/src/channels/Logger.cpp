#include "Logger.h"
#include <iostream>

namespace channels {

Logger::Logger() :
	sent([this](std::string message) { if (enabled) std::cout << "send: " << message << std::flush; }),
	received([this](std::string message) { if (enabled) std::cout << "receive: " << message << std::flush; }),
	enabled(true)
{
}

} /* namespace channels */
