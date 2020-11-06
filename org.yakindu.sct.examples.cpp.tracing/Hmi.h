/*
 * Hmi.h
 *
 *  Created on: 05.11.2020
 *      Author: aterfloth
 */

#ifndef HMI_H_
#define HMI_H_

#include "sc/Tictoc.h"

class Hmi {
public:
	Hmi(Tictoc &machine);
	virtual ~Hmi();

	void proceed();
	void help();

protected:
	Tictoc &machine;
	char buf[20];

private:
	void increaseDelay();
	void decreaseDelay();
};

#endif /* HMI_H_ */
