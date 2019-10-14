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

void DisplayHandler::updateLCD(sc_integer first, sc_integer second, sc_integer third, sc_string text) {
	lcd.setCursor(0,0);
	lcd.print(text);
	lcd.print("              ");
	lcd.setCursor(0,1);
	if(first < 10) {
		lcd.print("0");
	}
	lcd.print(first);
	lcd.print(":");
	if(second < 10) {
		lcd.print("0");
	}
	lcd.print(second);
	lcd.print(":");
	if(third < 10) {
		lcd.print("0");
	}
	lcd.print(third);
	lcd.print("              ");
}


