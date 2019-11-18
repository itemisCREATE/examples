/*
 * udp.h
 *
 *  Created on: 24.05.2019
 *      Author: rbeckmann
 */

#ifndef COMM_H_
#define COMM_H_

#include <stdint.h>

int comm_init_parameters(char* ip, uint16_t port);
void comm_print_err(int err);
int comm_send_message(char* buf, int len);
int comm_recv_message(char* buf, int len);

#endif /* COMM_H_ */
