/*
 * cm_hmi.c
 *
 *  Created on: 13.04.2016
 *      Author: terfloth
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/select.h>
#include <termios.h>

#include "cm_hmi.h"

#include "cm_trace.h"

static char *choice_texts[] = { //
		"", //
				"coffee", //
				"espresso", //
				"cappucino", //
				"latte macchiato", //
				"milk", //
				"" //
		};//

/*!
 * Implementation for non blocking getchar()
 * https://stackoverflow.com/questions/448944/c-non-blocking-keyboard-input
 */
struct termios orig_termios;

void reset_terminal_mode() {
	tcsetattr(0, TCSANOW, &orig_termios);
}

void set_conio_terminal_mode() {
	struct termios new_termios;

	/* take two copies - one for now, one for later */
	tcgetattr(0, &orig_termios);
	memcpy(&new_termios, &orig_termios, sizeof(new_termios));

	/* register cleanup handler, and set the new terminal mode */
	atexit(reset_terminal_mode);
	cfmakeraw(&new_termios);
	tcsetattr(0, TCSANOW, &new_termios);
}

int kbhit() {
	struct timeval tv = { 0L, 0L };
	fd_set fds;
	FD_ZERO(&fds);
	FD_SET(0, &fds);
	return select(1, &fds, NULL, NULL, &tv);
}

int getch() {
	int r;
	unsigned char c;
	if ((r = read(0, &c, sizeof(c))) < 0) {
		return r;
	} else {
		return c;
	}
}

UserEvents getUserInput() {
	if (kbhit()) {
		char c;

		c = getchar();

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

