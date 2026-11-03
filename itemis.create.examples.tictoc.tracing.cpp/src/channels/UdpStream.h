#ifndef CHANNELS_UDPSTREAM_H_
#define CHANNELS_UDPSTREAM_H_

#include <cstdint>
#include <string>
#include <netinet/in.h>
#include "sc_rxcpp.h"

namespace channels {

/*! Sends TDT messages to the debugger over UDP, one message per datagram, and receives its stimuli. */
class UdpStream
{
public:
	UdpStream(const std::string& ip, uint16_t port);
	~UdpStream();

	/*! Subscribe it to the messages a tracer sends. */
	sc::rx::SimpleObserver<std::string> sender;

	/*! The stimuli received from the debugger; subscribe a tracer to them. */
	sc::rx::Observable<std::string>& getReceived() noexcept;

	bool connect();
	void disconnect();

	/*! Passes on a datagram that has arrived, if any; call it regularly, it does not block. */
	void receive();

	bool enabled;

private:
	bool isEnabled();
	void send(const std::string& message);

	std::string ip;
	uint16_t port;
	int udpSocket;
	struct sockaddr_in address;
	sc::rx::Observable<std::string> received;
};

} /* namespace channels */

#endif /* CHANNELS_UDPSTREAM_H_ */
