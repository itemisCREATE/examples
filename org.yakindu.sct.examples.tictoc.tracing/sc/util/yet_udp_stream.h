/*
 * yet_udp_stream.h
 *
 *  Created on: 30.03.2020
 *      Author: terfloth
 */

#ifndef YET_UDP_STREAM_H_
#define YET_UDP_STREAM_H_

#include <netinet/in.h>

#include "../base/sc_rxc.h"

#ifdef __cplusplus
extern "C" {
#endif

#ifndef RCV_BUFFER_SIZE
#define RCV_BUFFER_SIZE 256
#endif

typedef struct yet_udp_stream yet_udp_stream;

struct yet_udp_stream {
	char* ip;
	uint16_t port;

	struct sockaddr_in receiver;
	int socket_fd;
	int recvlen;

	char receive_buffer[RCV_BUFFER_SIZE];

	sc_boolean enabled;
	sc_observer message_sender;
	sc_observable received_messages;
};

extern void yet_udp_stream_init(yet_udp_stream *self, char* ip, uint16_t port);
extern int yet_udp_stream_connect(yet_udp_stream* self);
extern int yet_udp_stream_disconnect(yet_udp_stream* self);
extern void yet_udp_stream_receive(yet_udp_stream* self);

#ifdef __cplusplus
}
#endif


#endif /* YET_UDP_STREAM_H_ */
