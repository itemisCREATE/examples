#include "CMHMI.hpp"
#include <iostream>
#include <stdlib.h>
#include <unistd.h>
#include <sys/select.h>
#include <termios.h>

CM_HMI::CM_HMI() {
	choice_texts[0] = "";
	choice_texts[1] = "coffee";
	choice_texts[2] = "espresso";
	choice_texts[3] = "cappucino";
	choice_texts[4] = "latte macchiato";
	choice_texts[5] = "milk";
	choice_texts[6] = "";
}

CM_HMI::~CM_HMI() {
}

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

CM_HMI::UserEvents CM_HMI::getUserInput() {
	if (kbhit()) {
		char c;
		c = getchar();

		switch (c) {
		case 'o':
			return ON_OFF;
			break;
		case '1':
			return COFFEE;
			break;
		case '2':
			return ESPRESSO;
			break;
		case '3':
			return CAPPUCINO;
			break;
		case '4':
			return LATTE_MACCHIATO;
			break;
		case '5':
			return MILK;
			break;
		case 't':
			return TRACING;
			break;
		case 'q':
			return QUIT;
		default:
			break;
		}
	}
	return NONE;
}

void CM_HMI::show(char *text) {
	// avoid newline
	fprintf(stdout, "%s", text);
	fflush(stdout);
}

void CM_HMI::showPrepare(UserEvents choice) {
	std::cout << "Preparing " << choice_texts[choice] << "\n";
}

void CM_HMI::showDone(UserEvents choice) {
	std::cout << "Take and enjoy your " << choice_texts[choice] << "\n";
}
