/*
 * ted_udp_stream.h
 *
 *  Created on: 30.03.2020
 *      Author: terfloth
 */

#ifndef TED_UDP_STREAM_H_
#define TED_UDP_STREAM_H_

#include <netinet/in.h>

#include "../base/sc_rxc.h"

#ifdef __cplusplus
extern "C" {
#endif

#ifndef RCV_BUFFER_SIZE
#define RCV_BUFFER_SIZE 256
#endif

typedef struct ted_udp_stream ted_udp_stream;


struct ted_udp_stream {

	struct {
		char* ip;
		uint16_t port;
	} conf;

	struct {
		int socket;
		struct sockaddr_in address;
		socklen_t len;
		char receive_buffer[RCV_BUFFER_SIZE];
	} transport;

	sc_boolean enabled;
	sc_single_subscription_observer_sc_string message_sender;
	sc_observable_sc_string received_messages;
};

extern void ted_udp_stream_init(ted_udp_stream *self, char* ip, uint16_t port);
extern int ted_udp_stream_connect(ted_udp_stream* self);
extern int ted_udp_stream_disconnect(ted_udp_stream* self);
extern void ted_udp_stream_receive(ted_udp_stream* self);

#ifdef __cplusplus
}
#endif


#endif /* TED_UDP_STREAM_H_ */
