/*
 * yet_udp_stream.c
 *
 *  Created on: 30.03.2020
 *      Author: terfloth
 */

#include <sys/socket.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <poll.h>
#include <unistd.h>


#include "../base/sc_types.h"
#include "../base/sc_rxc.h"
#include "yet_udp_stream.h"



static sc_boolean is_enabled(yet_udp_stream* self) {

	if ( self->enabled ) {
		if ( self->socket_fd == -1 ) {
			yet_udp_stream_connect(self);
		}
	} else if ( self->socket_fd != -1 ) {
		yet_udp_stream_disconnect(self);
	}

	return self->enabled;
}


static void next(yet_udp_stream* self, char* msg)
{
	if (! is_enabled(self) ) return;

	int bytes_send =
			sendto(self->socket_fd,
					msg,
					strlen(msg),
					0,
					(struct sockaddr *) &self->receiver,
					self->recvlen);
	if (bytes_send <= 0) {
		fprintf(stderr, "ERRNO %d\n", errno);
	}
}


void yet_udp_stream_init(yet_udp_stream* self, char* ip, uint16_t port)
{
	self->ip = ip;
	self->port = port;

	self->message_sender.observer = self;
	self->message_sender.next = (sc_observer_next_fp) next;

	self->received_messages.observer_count = 0;
	self->received_messages.observers = sc_null;

	self->enabled = true;
	self->socket_fd = -1;

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

static int open_socket(yet_udp_stream* self) {
	self->recvlen = sizeof(self->receiver);
	memset(&(self->receiver), 0, self->recvlen);

	// Open an outgoing socket
	if ((self->socket_fd = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0) {
		return -1;
	}

	// Set receiver parameters
	self->receiver.sin_family = AF_INET;
	self->receiver.sin_port = htons(self->port);
	if (inet_aton(self->ip, &(self->receiver.sin_addr)) == 0) {
		return -2;
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
	if ((err = close(self->socket_fd)) != 0) {
		print_udp_err(err);
	}

	self->socket_fd = -1;

	return err;
}


static int receive_from_socket(yet_udp_stream* self, char* buf, int len) {
	struct pollfd pfd;
	pfd.fd = self->socket_fd;
	pfd.events = POLLIN;
	poll(&pfd, 1, 0);
	if((pfd.revents & POLLIN) != 0) {
		return recvfrom(self->socket_fd, buf, len, 0, 0, 0);
	}
	return 0;
}


extern void yet_udp_stream_receive(yet_udp_stream* self) {

	if (! is_enabled(self) ) return;

	int rcv_byte_len = receive_from_socket(self, self->receive_buffer, RCV_BUFFER_SIZE);
	if(rcv_byte_len > 0) {
		SC_OBSERVABLE_NEXT(&(self->received_messages), self->receive_buffer);
	}
}

