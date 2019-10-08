/*
 * DisplayHandler.cpp
 *
 *  Created on: 07.10.2019
 *      Author: administrator
 */

#include "DisplayHandler.h"

LiquidCrystal lcd(8, 9, 4, 5, 6, 7);


DisplayHandler::DisplayHandler() {
	lcd.begin(16, 2);
}

DisplayHandler::~DisplayHandler() {
}

void DisplayHandler::displayLCDString(sc_string value, sc_integer length, sc_integer position) {
	lcd.setCursor(0, position);
	lcd.print(value);
	while(length < 16) {
		lcd.setCursor(length, position);
		lcd.print(" ");
		length++;
	}
}

void DisplayHandler::displayLCDInteger(sc_integer value,
		sc_integer position) {
	lcd.setCursor(0, position);
	lcd.print(value);
}

void DisplayHandler::clearLCDRow(sc_integer position) {
	int length = 0;
	lcd.setCursor(0, position);
	while (length < 16) {
		lcd.setCursor(length, position);
		lcd.print(" ");
		length++;
	}
}

