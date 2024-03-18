#ifndef ZOWI_ZOWIPINOUT_H_
#define ZOWI_ZOWIPINOUT_H_

#include "pins_arduino.h"

//---------------------------------------------------------
//-- Configuration of pins where the servos are attached
/*
         ---------------
        |               |
        |     O   O     |
        |               |
 YR ==> |               | <== YL
         ---------------
            ||     ||
            ||     ||
            ||     ||
 RR ==>   -----   ------  <== RL
          -----   ------
*/

#define PIN_YL 2 //servo[0]
#define PIN_YR 3 //servo[1]
#define PIN_RL 4 //servo[2]
#define PIN_RR 5 //servo[3]
//---------------------------------------------------------

//---Zowi Buttons
#define PIN_SecondButton 6
#define PIN_ThirdButton 7


#endif /* ZOWI_ZOWIPINOUT_H_ */
