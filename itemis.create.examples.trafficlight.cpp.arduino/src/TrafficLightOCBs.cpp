
#include "TrafficLightOCBs.h"
#include "Arduino.h"
#include "arduinoPins.h"


TrafficLightOCBs::~TrafficLightOCBs() {
}

void TrafficLightOCBs::synchronize(){
	//synchronize red traffic light
	if(arduino->trafficLight()->getRed() == true)
		digitalWrite(led_red_pin, HIGH);
	else
		digitalWrite(led_red_pin, LOW);

	//synchronize yellow traffic light
	if(arduino->trafficLight()->getYellow() == true)
		digitalWrite(led_yellow_pin, HIGH);
	else
		digitalWrite(led_yellow_pin, LOW);

	//synchronize green traffic light
	if(arduino->trafficLight()->getGreen() == true)
		digitalWrite(led_green_pin, HIGH);
	else
		digitalWrite(led_green_pin, LOW);

	//synchronize red pedestrian traffic light
	if(arduino->pedestrian()->getRed() == true)
		digitalWrite(ped_led_red_pin, HIGH);
	else
		digitalWrite(ped_led_red_pin, LOW);

	//synchronize green pedestrian traffic light
	if(arduino->pedestrian()->getGreen() == true)
		digitalWrite(ped_led_green_pin, HIGH);
	else
		digitalWrite(ped_led_green_pin, LOW);

	//synchronize pedestrian waiting light
	if(arduino->pedestrian()->getRequest() == true)
		digitalWrite(ped_led_request_pin, HIGH);
	else
		digitalWrite(ped_led_request_pin, LOW);
}
