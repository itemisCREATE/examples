#ifdef __IN_ECLIPSE__
//This is a automatic generated file
//Please do not modify this file
//If you touch this file your change will be overwritten during the next build
//This file has been generated on 2016-06-20 12:47:24

#include "Arduino.h"
#include "Arduino.h"
#include <avr/sleep.h>
#include "src-gen/LightCtrl.h"
#include "src-gen/LightCtrlRequired.h"
#include "scutil/sc_timer_service.h"
void lightCtrl_setTimer(LightCtrl* handle, const sc_eventid evid, const sc_integer time_ms, const sc_boolean periodic);
void lightCtrl_unsetTimer(LightCtrl* handle, const sc_eventid evid) ;
void lightCtrlIface_setLight(const LightCtrl* handle, const sc_boolean lightOn) ;
void setup() ;
void loop() ;

#include "ArduinoFSM.ino"


#endif
