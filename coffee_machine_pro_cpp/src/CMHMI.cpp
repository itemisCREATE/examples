/*
 * CMHMI.cpp
 *
 *  Created on: 19.03.2018
 *      Author: administrator
 */

#include "CMHMI.hpp"

CM_HMI::CM_HMI() {
	lastEvent = NONE;
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

UserEvents CM_HMI::provideUserEvent() {
	UserEvents userEvent = lastEvent;
	lastEvent = NONE;
	return userEvent;
}

void CM_HMI::scanUserInput() {
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
			//	cm_trace_active = !cm_trace_active;
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

void CM_HMI::show(char* text) {
	std::cout << text << "\n";
}

void CM_HMI::showPrepare(UserEvents choice) {
	std::cout << "Preparing " << choice_texts[choice] << "\n";
}

void CM_HMI::showDone(UserEvents choice) {
	std::cout << "Take and enjoy your " << choice_texts[choice] << "\n";
}
