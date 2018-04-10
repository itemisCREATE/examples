#ifndef SCR_CMHMI_HPP_
#define SCR_CMHMI_HPP_

#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <iostream>

	typedef enum {
		ON_OFF,
		COFFEE,
		ESPRESSO,
		CAPPUCINO,
		LATTE_MACCHIATO,
		MILK,
		NONE
	} UserEvents;
class CM_HMI {
public:
	CM_HMI();
	virtual ~CM_HMI();


	UserEvents provideUserEvent();
	void scanUserInput();
	void show(char* text);
	void showPrepare(UserEvents event);
	void showDone(UserEvents event);

private:
	UserEvents lastEvent;
	std::string choice_texts[7];
};

#endif /* SCR_CMHMI_HPP_ */
