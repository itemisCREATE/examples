/*
 * cm_hmi.h
 *
 *  Created on: 13.04.2016
 *      Author: terfloth
 */

#ifndef CM_HMI_H_
#define CM_HMI_H_

typedef enum { //
	ON_OFF, //
	COFFEE, //
	ESPRESSO, //
	CAPPUCINO, //
	LATTE_MACCHIATO, //
	MILK, //
	QUIT, //
	NONE //
} UserEvents; //

extern UserEvents getUserInput();

extern void show(char *text);

extern void showPrepare(UserEvents event);
extern void showDone(UserEvents event);

#endif /* CM_HMI_H_ */
