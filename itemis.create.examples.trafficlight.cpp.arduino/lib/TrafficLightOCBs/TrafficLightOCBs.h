
#ifndef TRAFFICLIGHTOCBS_H_
#define TRAFFICLIGHTOCBS_H_

#include <TrafficLightCtrl.h>

class TrafficLightOCBs : public TrafficLightCtrl::OperationCallback {
public:
	TrafficLightOCBs(TrafficLightCtrl* machine) : arduino(machine){}
	virtual ~TrafficLightOCBs();

	void synchronize();

private:
	TrafficLightCtrl* arduino;
};

#endif /* TRAFFICLIGHTOCBS_H_ */
