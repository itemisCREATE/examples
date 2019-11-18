/*
 * main.c
 *
 *  Created on: 17.10.2019
 *      Author: rbeckmann
 */

#include "src/sc_types.h"
#include "src/sc_yet.h"
#include "src-gen/Controller.h"
#include "src-gen/Heater.h"
#include <unistd.h>
#include <string.h>
#include <sys/time.h>
#include <stdio.h>
#include "comm.h"

unsigned long ts;

unsigned long get_ms();

FILE * tracefile;
char rcv_buf[255];

static void handle_out_events(Heater *heater, Controller *controller);

int main(int argc, char **argv) {
	Heater heater = {};
	Controller controller = {};
	yet_scope *scopes[2];
	yet_scope parent_scope;
	scopes[0] = &heater.scope;
	scopes[1] = &controller.scope;
	heater.scope.parent_scope = &parent_scope;
	controller.scope.parent_scope = &parent_scope;
	parent_scope.child_scopes = scopes;
	parent_scope.num_child_scopes = 2;
	comm_init_parameters("127.0.0.1", 8444);
	ts = get_ms();

	tracefile = fopen("trace.yet", "w");

	controller_init(&controller);
	heater_init(&heater);
	controller_enter(&controller);
	heater_enter(&heater);

	controllerIface_set_targetTemp(&controller, 80);
	controllerIface_raise_on(&controller);

	while(1) {
		memset(rcv_buf, 0, 255);
		int recv = comm_recv_message(rcv_buf, 255);
		if(recv > 0) {
			printf("RECV %s\n", rcv_buf);
			yet_accept_message(&parent_scope, rcv_buf);
		}

		handle_out_events(&heater, &controller);

		controllerIface_raise_temperatureChanged(&controller, heaterIface_get_t(&heater));

		handle_out_events(&heater, &controller);

		heater_runCycle(&heater);

		usleep(200000);
	}
}

void handle_out_events(Heater *heater, Controller *controller) {
	if(controllerIface_israised_heaterOn(controller)) {
		heaterIface_raise_on(heater);
	}
	if(controllerIface_israised_heaterOff(controller)) {
		heaterIface_raise_off(heater);
	}
}

/*! Function to write YET messages somewhere, e.g. via serial. */
void yet_write(char* buf, int len) {
	printf("%s\n", buf);
	fprintf(tracefile, "%s", buf);
	comm_send_message(buf, len);
	fflush(tracefile);
}
/*! Function to retrieve the current timestamp, ideally in milliseconds. */
unsigned long get_current_timestamp(void* handle) {
	return get_ms() - ts;
}
/*! Function to set the current timestamp - will be called on enter. */

unsigned long get_ms() {
	struct timeval t;
	gettimeofday(&t, 0);
 	unsigned long ms = t.tv_sec * 1000 + (t.tv_usec / 1000);
 	return ms;
}
