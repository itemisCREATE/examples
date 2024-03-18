/*
 * gpio_util.h
 *
 *  Created on: 04.04.2017
 *      Author: rbeckmann
 */

#ifndef GPIO_UTIL_H_
#define GPIO_UTIL_H_


#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define IN  0
#define OUT 1

#define LOW  0
#define HIGH 1

int gpio_export(int pin);

int gpio_unexport(int pin);

int gpio_direction(int pin, int dir);

int gpio_write(int pin, int value);

#endif /* GPIO_UTIL_H_ */
