/*
 * ted_file_writer.c
 *
 *  Created on: 30.03.2020
 *      Author: terfloth
 */


#include "ted_file.h"


static void next(ted_file_writer* self, char* msg)
{
	fputs(msg, self->tracefile);
	fflush(self->tracefile);
}


void ted_file_writer_init(ted_file_writer* self, char* filename)
{
	self->tracefile = fopen(filename, "w");
	sc_single_subscription_observer_sc_string_init(&(self->message_writer), self, (sc_observer_next_sc_string_fp) &next);
}
