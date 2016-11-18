/*
 * example_utils.c
 *
 *  Created on: 17.10.2016
 *      Author: rbeckmann
 */

#include "sensor_utils.h"

#include <math.h>
#include <time.h>
#include <stdlib.h>
#include <stdbool.h>

static bool seeded = false;
static int32_t offset;
static int32_t noise_ampl;

uint8_t get_random(uint8_t min, uint8_t max)
{
	if(!seeded) {
		initialize_random();
	}

	return (uint8_t) (get_float_rand() * (float)(max-min) + min);
}

uint8_t get_sensor_measurement()
{
	return get_random(offset - noise_ampl, offset + noise_ampl);
}

void initialize_random()
{
	srand(time(NULL));
	seeded = true;
}

void init_sensor()
{
	offset = get_float_rand() * 190 + 5;
	noise_ampl = get_float_rand() * 5;
}

float get_float_rand()
{
	return (float) rand() / (float) RAND_MAX;
}

uint16_t calc_array_sum(uint8_t values[], uint8_t array_size)
{
	uint16_t sum = 0;
	for(int i = 0; i < array_size; i++) {
		sum += values[i];
	}
	return sum;
}

float square(float input)
{
	return pow(input, 2);
}

float root(float input)
{
	return pow(input, 0.5f);
}
