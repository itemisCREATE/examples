/*
 * yet_logger.c
 *
 *  Created on: 31.03.2020
 *      Author: terfloth
 */


#include "yet_logger.h"
#include <stdio.h>

static void next_receive(yet_logger* self, char* msg)
{
	if (self->enabled) printf("receive: %s", msg);
}

static void next_send(yet_logger* self, char* msg)
{
	if (self->enabled) printf("send: %s", msg);
}


void yet_logger_init(yet_logger* self)
{
	self->enabled = true;

	self->receive_logger.observer = self;
	self->receive_logger.next = (sc_observer_next_fp) next_receive;

	self->send_logger.observer = self;
	self->send_logger.next = (sc_observer_next_fp) next_send;
}
