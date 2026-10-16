/*
 * tas_file_writer.c
 *
 *  Created on: 30.03.2020
 *      Author: terfloth
 */


#include "tas_file.h"


static void next(tas_file_writer* self, char* msg)
{
	fputs(msg, self->tracefile);
	fflush(self->tracefile);
}


void tas_file_writer_init(tas_file_writer* self, char* filename)
{
	self->tracefile = fopen(filename, "w");
	sc_single_subscription_observer_sc_string_init(&(self->message_writer), self, (sc_observer_next_sc_string_fp) &next);
}
