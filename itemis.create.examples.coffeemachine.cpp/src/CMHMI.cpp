#include "CMHMI.hpp"
#include <iostream>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

CM_HMI::CM_HMI() {
	choice_texts[0] = "";
	choice_texts[1] = "coffee";
	choice_texts[2] = "espresso";
	choice_texts[3] = "cappucino";
	choice_texts[4] = "latte macchiato";
	choice_texts[5] = "milk";
	choice_texts[6] = "";

    fcntl(STDIN_FILENO, F_SETFL, fcntl(0, F_GETFL) | O_NONBLOCK);
}

CM_HMI::~CM_HMI() {
}

CM_HMI::UserEvents CM_HMI::getUserInput() {
	int numRead = read(STDIN_FILENO, buf, 1);

	if (numRead > 0) {
		char c = buf[0];

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
