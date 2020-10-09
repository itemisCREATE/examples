#ifndef SRC_DISPLAYHANDLER_H_
#define SRC_DISPLAYHANDLER_H_

#include <LiquidCrystal.h>
#include "../src-gen/DigitalWatch.h"

class DisplayHandler: public DigitalWatch::SCI_Display_OCB {
public:
	DisplayHandler();
	~DisplayHandler();

	void updateLCD(sc_integer first, sc_integer second, sc_integer third, sc_string text);
};

#endif /* SRC_DISPLAYHANDLER_H_ */

