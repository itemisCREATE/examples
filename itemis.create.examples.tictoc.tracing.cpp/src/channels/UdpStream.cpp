#include "UdpStream.h"
#include <arpa/inet.h>
#include <cstring>
#include <iostream>
#include <poll.h>
#include <sys/socket.h>
#include <unistd.h>

namespace channels {

namespace {
const std::size_t RECEIVE_BUFFER_SIZE = 256;
}

UdpStream::UdpStream(const std::string& ip_, uint16_t port_) :
	sender([this](std::string message) { send(message); }),
	enabled(true), ip(ip_), port(port_), udpSocket(-1), address(), received()
{
}

UdpStream::~UdpStream()
{
	disconnect();
}

sc::rx::Observable<std::string>& UdpStream::getReceived() noexcept
{
	return received;
}

bool UdpStream::connect()
{
	std::memset(&address, 0, sizeof(address));
	address.sin_family = AF_INET;
	address.sin_port = htons(port);
	if (inet_aton(ip.c_str(), &address.sin_addr) == 0) {
		std::cerr << "Could not parse IP address " << ip << std::endl;
		return false;
	}
	udpSocket = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
	if (udpSocket < 0) {
		std::cerr << "Could not open socket" << std::endl;
		return false;
	}
	return true;
}

void UdpStream::disconnect()
{
	if (udpSocket != -1) {
		close(udpSocket);
		udpSocket = -1;
	}
}

/* Switching the stream off closes the socket, switching it on again reopens it. */
bool UdpStream::isEnabled()
{
	if (enabled && udpSocket == -1) {
		connect();
	} else if (!enabled && udpSocket != -1) {
		disconnect();
	}
	return enabled && udpSocket != -1;
}

void UdpStream::send(const std::string& message)
{
	if (isEnabled()) {
		sendto(udpSocket, message.data(), message.size(), 0, reinterpret_cast<struct sockaddr*>(&address),
			sizeof(address));
	}
}

void UdpStream::receive()
{
	if (isEnabled()) {
		struct pollfd descriptor;
		descriptor.fd = udpSocket;
		descriptor.events = POLLIN;
		descriptor.revents = 0;
		if (poll(&descriptor, 1, 0) > 0 && (descriptor.revents & POLLIN) != 0) {
			char buffer[RECEIVE_BUFFER_SIZE];
			ssize_t length = recvfrom(udpSocket, buffer, sizeof(buffer), 0, nullptr, nullptr);
			if (length > 0) {
				received.next(std::string(buffer, static_cast<std::size_t>(length)));
			}
		}
	}
}

} /* namespace channels */
