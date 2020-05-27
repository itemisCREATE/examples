/*
 * yet_udp_stream.c
 *
 *  Created on: 30.03.2020
 *      Author: terfloth
 */

#include <arpa/inet.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
//#include <poll.h>
#include <unistd.h>


#include "../base/sc_types.h"
#include "../base/sc_rxc.h"
#include "yet_udp_stream.h"



static sc_boolean is_enabled(yet_udp_stream* self) {

	if ( self->enabled ) {
		if ( self->transport.socket == -1 ) {
			yet_udp_stream_connect(self);
		}
	} else if ( self->transport.socket != -1 ) {
		yet_udp_stream_disconnect(self);
	}

	return self->enabled;
}


static void next(yet_udp_stream* self, char* msg)
{
	if (! is_enabled(self) ) return;

	int bytes_send =
			sendto(self->transport.socket,
					msg,
					strlen(msg),
					0,
					(struct sockaddr *) &self->transport.address,
					self->transport.len);
	if (bytes_send <= 0) {
		fprintf(stderr, "ERRNO %d\n", errno);
	}
}


void yet_udp_stream_init(yet_udp_stream* self, char* ip, uint16_t port)
{
	self->conf.ip = ip;
	self->conf.port = port;

	self->message_sender.observer = self;
	self->message_sender.next = (sc_observer_next_fp) next;

	self->received_messages.observer_count = 0;
	self->received_messages.observers = sc_null;

	self->enabled = true;
	self->transport.socket = -1;

}

static void print_udp_err(int err) {
	switch (err) {
	case 0:
		break;
	case -1:
		fprintf(stderr, "Could not open socket!\n");
		break;
	case -2:
		fprintf(stderr, "Could not parse IP-address!\n");
		break;
	case -3:
		fprintf(stderr, "Could not send message!\n");
		break;
	default:
		fprintf(stderr, "Unknown UPD error '%d'!\n", err);
		break;
	}
}

static sc_boolean use_broadcast_address(yet_udp_stream* self) {
	return (ntohl(self->transport.address.sin_addr.s_addr) & 0x000000ff) == 0x000000ff;
}

static sc_boolean use_multicast_address(yet_udp_stream* self) {
	return IN_MULTICAST(ntohl(self->transport.address.sin_addr.s_addr));
}

static int open_socket(yet_udp_stream* self) {

	int broadcast_options;
	unsigned char multicast_ttl;

	// configure address
	self->transport.len = sizeof(self->transport.address);
	memset(&(self->transport.address), 0, self->transport.len);
	self->transport.address.sin_family = AF_INET;
	self->transport.address.sin_port = htons(self->conf.port);
	if (inet_aton(self->conf.ip, &(self->transport.address.sin_addr)) == 0) {
		return -1;
	}


	/* create a socket */
	if ((self->transport.socket = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0) {
		return -2;
	}

	/* configure socket options depending on mode */
	if (use_broadcast_address(self)) {
		fprintf(stdout, "configure UDP socket for broadcast\n");
	    broadcast_options = 1;
	    if (setsockopt(self->transport.socket, SOL_SOCKET, SO_BROADCAST, (void *) &broadcast_options,
	          sizeof(broadcast_options)) < 0)
	        return -3;
	}
	else if (use_multicast_address(self)){
		fprintf(stdout, "configure UDP socket for multicast\n");
		  if (setsockopt(self->transport.socket, IPPROTO_IP, IP_MULTICAST_TTL, (void *) &multicast_ttl,
		          sizeof(multicast_ttl)) < 0)
			  return -4;
	} else {
		fprintf(stdout, "configure UDP socket for unicast\n");
	}

	return 0;
}


int yet_udp_stream_connect(yet_udp_stream* self) {

	int err;
	if((err = open_socket(self)) != 0) {
		print_udp_err(err);
		return err;
	}

	return 0;
}

int yet_udp_stream_disconnect(yet_udp_stream* self) {

	int err;
	if ((err = close(self->transport.socket)) != 0) {
		print_udp_err(err);
	}

	self->transport.socket = -1;

	return err;
}


static int receive_from_socket(yet_udp_stream* self, char* buf, int len) {
	struct pollfd pfd;
	pfd.fd = self->transport.socket;
	pfd.events = POLLIN;
	poll(&pfd, 1, 0);
	if((pfd.revents & POLLIN) != 0) {
		return recvfrom(self->transport.socket, buf, len, 0, 0, 0);
	}
	return 0;
}


extern void yet_udp_stream_receive(yet_udp_stream* self) {

	if (! is_enabled(self) ) return;

	int rcv_byte_len = receive_from_socket(self, self->transport.receive_buffer, RCV_BUFFER_SIZE);
	if(rcv_byte_len > 0) {
		SC_OBSERVABLE_NEXT(&(self->received_messages), self->transport.receive_buffer);
	}
}

