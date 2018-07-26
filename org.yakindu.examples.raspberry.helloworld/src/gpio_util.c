/*
 * gpio_util.c
 *
 *  Created on: 04.04.2017
 *      Author: rbeckmann
 */

#include "gpio_util.h"

int gpio_export(int pin) {
	char buffer[3];
	ssize_t b_wr;
	int fd;

	fd = open("/sys/class/gpio/export", O_WRONLY);
	if (fd == -1) {
		fprintf(stderr,
				"Failed to open /sys/class/gpio/export for writing, aborting\n");
		return -1;
	}

	b_wr = snprintf(buffer, 3, "%d", pin);
	write(fd, buffer, b_wr);
	close(fd);
	return 0;
}

int gpio_unexport(int pin) {
	char buffer[3];
	ssize_t b_wr;
	int fd;

	fd = open("/sys/class/gpio/unexport", O_WRONLY);
	if (fd == -1) {
		fprintf(stderr,
				"Failed to open /sys/class/gpio/unexport for writing, aborting\n");
		return -1;
	}

	b_wr = snprintf(buffer, 3, "%d", pin);
	write(fd, buffer, b_wr);
	close(fd);
	return 0;
}

int gpio_direction(int pin, int dir) {
	static const char s_directions_str[]  = "in\0out";

	char path[35];
	int fd;

	snprintf(path, 35, "/sys/class/gpio/gpio%d/direction", pin);
	fd = open(path, O_WRONLY);
	if (-1 == fd) {
		fprintf(stderr, "Failed to open gpio direction for writing!\n");
		return -1;
	}

	if (-1 == write(fd, &s_directions_str[IN == dir ? 0 : 3], IN == dir ? 2 : 3)) {
		fprintf(stderr, "Failed to set direction!\n");
		return (-1);
	}

	close(fd);
	return (0);
}
int gpio_write(int pin, int value)
{
	static const char on_s[] = "1";
	static const char off_s[] = "0";

	char path[30];
	int fd;

	snprintf(path, 30, "/sys/class/gpio/gpio%d/value", pin);
	fd = open(path, O_WRONLY);
	if (-1 == fd) {
		fprintf(stderr, "Failed to open gpio value for writing!\n");
		return(-1);
	}

	if (1 != write(fd, LOW == value ? &off_s : &on_s, 1)) {
		fprintf(stderr, "Failed to write value!\n");
		return(-1);
	}

	close(fd);
	return(0);
}
