#include "FileWriter.h"

namespace channels {

FileWriter::FileWriter(const std::string& fileName) :
	writer([this](std::string message) { file << message << std::flush; }),
	file(fileName)
{
}

} /* namespace channels */
