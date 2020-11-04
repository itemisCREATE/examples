/*
 * cm_hmi.c
 *
 *  Created on: 13.04.2016
 *      Author: terfloth
 */
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>

#include "cm_hmi.h"

#include "cm_trace.h"

static char buf[20];
static char *choice_texts[] = { //
		"", //
				"coffee", //
				"espresso", //
				"cappucino", //
				"latte macchiato", //
				"milk", //
				"" //
		};//

void hmi_init() {
    fcntl(STDIN_FILENO, F_SETFL, fcntl(0, F_GETFL) | O_NONBLOCK);
}

UserEvents getUserInput() {
	int numRead = read(STDIN_FILENO, buf, 1);

	if (numRead > 0) {
		char c = buf[0];

		switch (c) {
		case 'o':
			return ON_OFF;
		case '1':
			return COFFEE;
		case '2':
			return ESPRESSO;
		case '3':
			return CAPPUCINO;
		case '4':
			return LATTE_MACCHIATO;
		case '5':
			return MILK;
		case 't':
			cm_trace_active = !cm_trace_active;
			return NONE;
		case 'q':
			return QUIT;
		default:
			return NONE;
		}
	}
	return NONE;
}

void show(char *text) {

	fprintf(stdout, "%s", text);
	fflush(stdout);
}

void showPrepare(UserEvents choice) {

	fprintf(stdout, "Preparing %s\n", choice_texts[choice]);
	fflush(stdout);
}

void showDone(UserEvents choice) {

	fprintf(stdout, "Take and enjoy your %s\n", choice_texts[choice]);
	fflush(stdout);
}

