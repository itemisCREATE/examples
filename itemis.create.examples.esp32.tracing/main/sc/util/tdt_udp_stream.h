/*
 * tdt_udp_stream.h
 *
 *  Created on: 30.03.2020
 *      Author: terfloth
 */

#ifndef TDT_UDP_STREAM_H_
#define TDT_UDP_STREAM_H_

#include <netinet/in.h>
#include <sys/socket.h>

#include "../base/sc_rxc.h"

#ifdef __cplusplus
extern "C" {
#endif

#ifndef RCV_BUFFER_SIZE
#define RCV_BUFFER_SIZE 256
#endif

typedef struct tdt_udp_stream tdt_udp_stream;


struct tdt_udp_stream {

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

extern void tdt_udp_stream_init(tdt_udp_stream *self, char* ip, uint16_t port);
extern int tdt_udp_stream_connect(tdt_udp_stream* self);
extern int tdt_udp_stream_disconnect(tdt_udp_stream* self);
extern void tdt_udp_stream_receive(tdt_udp_stream* self);

#ifdef __cplusplus
}
#endif


#endif /* TDT_UDP_STREAM_H_ */
