#ifndef CHANNELS_FILEWRITER_H_
#define CHANNELS_FILEWRITER_H_

#include <fstream>
#include <string>
#include "sc_rxcpp.h"

namespace channels {

/*! Writes the TED messages a tracer sends to a trace file, which the debugger can replay. */
class FileWriter
{
public:
	explicit FileWriter(const std::string& fileName);

	/*! Subscribe it to the messages a tracer sends. */
	sc::rx::SimpleObserver<std::string> writer;

private:
	std::ofstream file;
};

} /* namespace channels */

#endif /* CHANNELS_FILEWRITER_H_ */
