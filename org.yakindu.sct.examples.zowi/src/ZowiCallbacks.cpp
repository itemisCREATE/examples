/*
 * ZowiCallbacks.cpp
 *
 *  Created on: 16.10.2019
 *      Author: administrator
 */

#include "ZowiCallbacks.h"
#include "../Zowi/Zowi.h"
#include "../Zowi/ZowiPinOut.h"

Zowi zowi;

ZowiCallbacks::ZowiCallbacks() {
}

ZowiCallbacks::~ZowiCallbacks() {
}

void ZowiCallbacks::init() {
	zowi.init(PIN_YL, PIN_YR, PIN_RL, PIN_RR);
}

void ZowiCallbacks::home() {
	zowi.home();
}

void ZowiCallbacks::walk(sc_integer steps, sc_integer T, sc_integer dir) {
	zowi.walk(steps, T, dir);
}

void ZowiCallbacks::turn() {
	zowi.turn();
}

sc_real ZowiCallbacks::getDistance() {
	return zowi.getDistance();
}

sc_real ZowiCallbacks::getNoise() {
	return zowi.getNoise();
}

void ZowiCallbacks::putMouth(sc_integer mouth) {
	zowi.putMouth(mouth);
}

void ZowiCallbacks::sing(sc_integer songName) {
	zowi.sing(songName);
}
