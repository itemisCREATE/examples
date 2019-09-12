/*
 * TrafficLightOCBs.cpp
 *
 *  Created on: 12.09.2019
 *      Author: administrator
 */

#include "TrafficLightOCBs.h"
#include "Arduino.h"
#include "arduinoPins.h"


TrafficLightOCBs::~TrafficLightOCBs() {
}

void TrafficLightOCBs::synchronize(){
	//synchronize red traffic light
	if(arduino->getSCI_TrafficLight()->get_red() == true)
		digitalWrite(led_red_pin, HIGH);
	else
		digitalWrite(led_red_pin, LOW);

	//synchronize yellow traffic light
	if(arduino->getSCI_TrafficLight()->get_yellow() == true)
		digitalWrite(led_yellow_pin, HIGH);
	else
		digitalWrite(led_yellow_pin, LOW);

	//synchronize green traffic light
	if(arduino->getSCI_TrafficLight()->get_green() == true)
		digitalWrite(led_green_pin, HIGH);
	else
		digitalWrite(led_green_pin, LOW);

	//synchronize red pedestrian traffic light
	if(arduino->getSCI_Pedestrian()->get_red() == true)
		digitalWrite(ped_led_red_pin, HIGH);
	else
		digitalWrite(ped_led_red_pin, LOW);

	//synchronize green pedestrian traffic light
	if(arduino->getSCI_Pedestrian()->get_green() == true)
		digitalWrite(ped_led_green_pin, HIGH);
	else
		digitalWrite(ped_led_green_pin, LOW);

	//synchronize pedestrian waiting light
	if(arduino->getSCI_Pedestrian()->get_request() == true)
		digitalWrite(ped_led_request_pin, HIGH);
	else
		digitalWrite(ped_led_request_pin, LOW);
}
