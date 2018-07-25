/*
 * main.c
 *
 *  Created on: 17.10.2016
 *      Author: rbeckmann
 */


#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include "model/src-gen/Sensor.h"

int main(int argc, char** argv)
{
	Sensor * sensor = (Sensor*) malloc(sizeof(Sensor));

	sensor_init(sensor);

	sensor_enter(sensor);

	while(1) {
		if(sensor_isStateActive(sensor, Sensor_main_region_wait)) {
			sensorIfaceSensor_raise_measure(sensor);
		}
		sensor_runCycle(sensor);

		if(sensorIfaceSensor_israised_done(sensor)) {
			printf("Sensor measured distance of %f\n", sensorIfaceStddev_get_mean(sensor));
		}
		else if(sensorIfaceSensor_israised_error(sensor)) {
			puts("Sensor could not measure distance reliably.");
		}

	}

	return 0;
}
