/*
 * example_utils.h
 *
 *  Created on: 17.10.2016
 *      Author: rbeckmann
 */

#ifndef SCT_UTILS_H_
#define SCT_UTILS_H_

#include <stdint.h>

#define ARRAY_SIZE 5

uint8_t values[ARRAY_SIZE];

void initialize_random();
float get_float_rand();
uint8_t get_random(uint8_t min, uint8_t max);

uint16_t calc_array_sum(uint8_t values[], uint8_t array_size);

uint8_t get_sensor_measurement();
void init_sensor();

float square(float input);
float root(float input);

#endif /* SCT_UTILS_H_ */
