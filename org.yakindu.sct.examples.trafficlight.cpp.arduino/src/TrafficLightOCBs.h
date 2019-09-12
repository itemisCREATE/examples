/*
 * TrafficLightOCBs.h
 *
 *  Created on: 12.09.2019
 *      Author: administrator
 */

#ifndef TRAFFICLIGHTOCBS_H_
#define TRAFFICLIGHTOCBS_H_

#include "../src-gen/TrafficLightCtrl.h"

class TrafficLightOCBs : public TrafficLightCtrl::DefaultSCI_OCB {
public:
	TrafficLightOCBs(TrafficLightCtrl* machine) : arduino(machine){}
	virtual ~TrafficLightOCBs();

	void synchronize();

private:
	TrafficLightCtrl* arduino;
};

#endif /* TRAFFICLIGHTOCBS_H_ */
