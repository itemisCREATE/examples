/*
 * cm_hmi.c
 *
 *  Created on: 13.04.2016
 *      Author: terfloth
 */

#include <stdbool.h>
#include <stdio.h>

#include "cm_hmi.h"

#include "cm_trace.h"



static UserEvents lastEvent = NONE;

static char* choice_texts[] = {
		"",
		"coffee" ,
		"espresso" ,
		"cappucino" ,
		"latte macchiato" ,
		"milk" ,
		""
};


UserEvents provideUserEvent() {
	UserEvents userEvent = lastEvent;
	lastEvent = NONE;
	return userEvent;
}


void scanUserInput() {
	while (1) {
		char c;

		c = getchar();

		switch (c) {
			case 'o':
				lastEvent = ON_OFF;
				break;
			case '1':
				lastEvent = COFFEE;
				break;
			case '2':
				lastEvent = ESPRESSO;
				break;
			case '3':
				lastEvent = CAPPUCINO;
				break;
			case '4':
				lastEvent = LATTE_MACCHIATO;
				break;
			case '5':
				lastEvent = MILK;
				break;
			case 't':
				cm_trace_active = !cm_trace_active;
				break;
			case 'q':
				return;
			case '\n':
				break;
			default:
				lastEvent = NONE;
		}
	}
}

void show(char* text) {

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



