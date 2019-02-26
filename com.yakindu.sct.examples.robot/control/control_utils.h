/*
 * control_utils.h
 *
 *  Created on: 19.10.2016
 *      Author: rbeckmann
 */

#ifndef CONTROL_CONTROL_UTILS_H_
#define CONTROL_CONTROL_UTILS_H_

#include <stdint.h>

#define MIN_DIST 20

typedef enum motormode {
	STOP,
	IDLE,
	FWD,
	RWD
} motormode_t;

typedef struct motor {
	motormode_t mode;
	uint8_t speed;
} motor_t;

uint8_t * get_distance_p();

motor_t * get_motor_p();

#endif /* CONTROL_CONTROL_UTILS_H_ */
