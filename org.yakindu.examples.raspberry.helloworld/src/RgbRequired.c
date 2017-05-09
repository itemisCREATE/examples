/*
 * RgbRequired.c
 *
 *  Created on: 06.04.2017
 *      Author: rbeckmann
 */

#include "../src-gen/Rgb.h"
#include "../src-gen/RgbRequired.h"
#include "sc_types.h"
#include "gpio_util.h"

sc_integer rgbIface_init(const Rgb* handle) {
	sc_integer r = 0;
	r += gpio_export(16);
	r += gpio_export(20);
	r += gpio_export(21);
	r += gpio_direction(16, OUT);
	r += gpio_direction(20, OUT);
	r += gpio_direction(21, OUT);
	return r;
}

void rgbIface_setColor(const Rgb* handle, const sc_boolean r,
		const sc_boolean g, const sc_boolean b) {
		gpio_write(16, r ? HIGH : LOW);
		gpio_write(20, g ? HIGH : LOW);
		gpio_write(21, b ? HIGH : LOW);
}

void rgbIface_teardown(const Rgb* handle) {
	gpio_unexport(16);
	gpio_unexport(20);
	gpio_unexport(21);
}

void rgbIface_usage(const Rgb* handle) {
	puts("Usage:\nr, g, b: Toggle red, green or blue LED\ne: Exit");
}
