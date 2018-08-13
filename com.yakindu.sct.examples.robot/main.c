/*
 * main.c
 *
 *  Created on: 17.10.2016
 *      Author: rbeckmann
 */


#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include "sensor/src-gen/Sensor.h"
#include "control/src-gen/Control.h"
#include "control/control_utils.h"

int main(int argc, char** argv)
{
	Control * control = (Control*) malloc(sizeof(Control));
	Sensor * sensor = (Sensor*) malloc(sizeof(Sensor));

	motor_t motL;
	motor_t motR;

	control_init(control);
	sensor_init(sensor);

	// set pointers to motor structs - interweave statemachines
	controlIfaceMotor_set_motL(control, &motL);
	controlIfaceMotor_set_motR(control, &motR);

	controlIfaceSensor_set_dist_p(control, &(sensor->ifaceSensor.val));

	sensor_enter(sensor);
	control_enter(control);

	// test
	control_runCycle(control);
	if(control_isStateActive(control, Control_main_region_pointer_error)) {
		return -1;
	}

	controlIfaceCtrl_raise_go(control);

	while(1) {
		if(sensor_isStateActive(sensor, Sensor_main_region_wait)) {
			sensorIfaceSensor_raise_measure(sensor);
		}
		sensor_runCycle(sensor);
		control_runCycle(control);

		if(sensorIfaceSensor_israised_done(sensor)) {
			printf("Sensor measured distance of %f\n", sensorIfaceStddev_get_mean(sensor));
			printf("LEFT\tRIGHT\n");
			printf("%d\t%d\n", motL.speed, motR.speed);
			printf("%d\t%d\t\n", motL.mode, motR.mode);
		}
		else if(sensorIfaceSensor_israised_error(sensor)) {
			puts("Sensor could not measure distance reliably.");
			printf("LEFT\tRIGHT\n");
			printf("%d\t%d\n", motL.speed, motR.speed);
			printf("%d\t%d\t\n", motL.mode, motR.mode);
		}

	}

	return 0;
}
