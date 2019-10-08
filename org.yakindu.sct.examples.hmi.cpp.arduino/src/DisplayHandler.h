#ifndef SRC_DISPLAYHANDLER_H_
#define SRC_DISPLAYHANDLER_H_

#include <LiquidCrystal.h>
#include "../src-gen/ArduinoHMI.h"

class DisplayHandler: public ArduinoHMI::DefaultSCI_OCB {
public:
	DisplayHandler();
	~DisplayHandler();

	void displayLCDString(sc_string value, sc_integer length, sc_integer position);
	void displayLCDInteger(sc_integer value, sc_integer position);
	void clearLCDRow(sc_integer position);
};

#endif /* SRC_DISPLAYHANDLER_H_ */

