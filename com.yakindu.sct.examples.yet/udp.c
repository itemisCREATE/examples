/*
 * udp.c
 *
 *  Created on: 24.05.2019
 *      Author: rbeckmann
 */

#include <netinet/in.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <poll.h>
#include "comm.h"

struct sockaddr_in receiver;
int sockfd, recvlen;

int comm_init_parameters(char* ip, uint16_t port) {
	recvlen = sizeof(receiver);
	memset(&receiver, 0, recvlen);

	// Open an outgoing socket
	if ((sockfd = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0) {
		return -1;
	}

	// Set receiver parameters
	receiver.sin_family = AF_INET;
	receiver.sin_port = htons(port);
	if (inet_aton(ip, &receiver.sin_addr) == 0) {
		return -2;
	}

	return 0;
}

int comm_send_message(char* buf, int len) {
	int bytes_send = sendto(sockfd, buf, len, 0, (struct sockaddr *) &receiver, recvlen);
//	printf("Sent %d bytes\n", bytes_send);
	if (bytes_send <= 0) {
		fprintf(stderr, "ERRNO %d\n", errno);
		return -3;
	}
	return 0;
}

void comm_print_err(int err) {
	switch (err) {
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
		break;
	}
}

int comm_recv_message(char* buf, int len) {
	struct pollfd pfd;
	pfd.fd = sockfd;
	pfd.events = POLLIN;
	poll(&pfd, 1, 0);
	if((pfd.revents & POLLIN) != 0) {
		return recvfrom(sockfd, buf, len, 0, 0, 0);
	}
	return 0;
}
