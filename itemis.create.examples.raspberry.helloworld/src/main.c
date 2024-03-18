/*
 * hello.cpp
 *
 *  Created on: 04.04.2017
 *      Author: rbeckmann
 */

#include <stdio.h>
#include <pthread.h>

#include "../src-gen/rgb.h"
#include "../scutil/sc_cycle_runner.h"

static Rgb rgb;

static sc_cycle_runner_t cycle_runner;

static pthread_mutex_t rgb_mutex = PTHREAD_MUTEX_INITIALIZER;

static void runCycle(void * handle) {
	rgb_run_cycle((Rgb*) handle);
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
			rgb_raise_red(&rgb);
			break;
		case 'g':
			rgb_raise_green(&rgb);
			break;
		case 'b':
			rgb_raise_blue(&rgb);
			break;
		case 'e':
			rgb_raise_end(&rgb);
			rgb_run_cycle(&rgb);
			break;
		default:
			break;
		}
		if (rgb_is_final(&rgb)) {
			return 0;
		}
		pthread_mutex_unlock(&rgb_mutex);

	}
	return 0;
}
