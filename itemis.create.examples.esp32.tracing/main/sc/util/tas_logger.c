/*
 * tas_logger.c
 *
 *  Created on: 31.03.2020
 *      Author: terfloth
 */


#include "tas_logger.h"
#include <stdio.h>

static void next_receive(tas_logger* self, char* msg)
{
	if (self->enabled) printf("receive: %s", msg);
}

static void next_send(tas_logger* self, char* msg)
{
	if (self->enabled) printf("send: %s", msg);
}


void tas_logger_init(tas_logger* self)
{
	self->enabled = true;

	sc_single_subscription_observer_sc_string_init(&(self->receive_logger), self, (sc_observer_next_sc_string_fp) &next_receive);
	sc_single_subscription_observer_sc_string_init(&(self->send_logger), self, (sc_observer_next_sc_string_fp) &next_send);
}
