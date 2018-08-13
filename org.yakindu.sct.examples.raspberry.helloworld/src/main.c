/*
 * hello.cpp
 *
 *  Created on: 04.04.2017
 *      Author: rbeckmann
 */

#include <stdio.h>
#include <pthread.h>

#include "../src-gen/Rgb.h"
#include "../scutil/sc_cycle_runner.h"

static Rgb rgb;

static sc_cycle_runner_t cycle_runner;

static pthread_mutex_t rgb_mutex = PTHREAD_MUTEX_INITIALIZER;

static void runCycle(void * handle) {
	rgb_runCycle((Rgb*) handle);
}

int main() {
	char input;

	rgb_init(&rgb);
	rgb_enter(&rgb);

	sc_cycle_runner_start(&cycle_runner, &runCycle, &rgb, 100, &rgb_mutex);

	while (1) {
		input = getchar();
		pthread_mutex_lock(&rgb_mutex);
		switch (input) {
		case 'r':
			rgbIface_raise_red(&rgb);
			break;
		case 'g':
			rgbIface_raise_green(&rgb);
			break;
		case 'b':
			rgbIface_raise_blue(&rgb);
			break;
		case 'e':
			rgbIface_raise_end(&rgb);
			rgb_runCycle(&rgb);
			break;
		default:
			break;
		}
		if (rgb_isFinal(&rgb)) {
			return 0;
		}
		pthread_mutex_unlock(&rgb_mutex);

	}
	return 0;
}
