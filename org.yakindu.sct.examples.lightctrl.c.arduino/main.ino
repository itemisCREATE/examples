#include "Arduino.h"
#include <avr/sleep.h>

#include "src-gen/LightCtrl.h"
#include "src-gen/LightCtrlRequired.h"
#include "scutil/sc_timer_service.h"

#define BUTTON_PIN 3
#define LED_PIN 6

#define MAX_TIMERS 20 //number of timers our timer service can use
#define CYCLE_PERIOD 10 //number of milliseconds that pass between each statechart cycle

static unsigned long cycle_count = 0L; //number of passed cycles
static unsigned long last_cycle_time = 0L; //timestamp of last cycle

static LightCtrl lightctrl;

static sc_timer_service_t timer_service;

static sc_timer_t timers[MAX_TIMERS];

//! callback implementation for the setting up time events
void lightCtrl_setTimer(LightCtrl* handle, const sc_eventid evid, const sc_integer time_ms, const sc_boolean periodic){
	sc_timer_start(&timer_service, (void*) handle, evid, time_ms, periodic);
}

//! callback implementation for canceling time events.
void lightCtrl_unsetTimer(LightCtrl* handle, const sc_eventid evid) {
	sc_timer_cancel(&timer_service, evid);
}

void lightCtrlIface_setLight(const LightCtrl* handle, const sc_boolean lightOn) {
	if(lightOn)
		digitalWrite(LED_PIN, HIGH);
	else
		digitalWrite(LED_PIN, LOW);
}

//The setup function is called once at startup of the sketch
void setup()
{
	pinMode(BUTTON_PIN, INPUT);
	pinMode(LED_PIN, OUTPUT);

	sc_timer_service_init(
			&timer_service,
			timers,
			MAX_TIMERS,
			(sc_raise_time_event_fp) &lightCtrl_raiseTimeEvent
			);

	lightCtrl_init(&lightctrl); //initialize statechart

	lightCtrl_enter(&lightctrl); //enter the statechart
}

// The loop function is called in an endless loop
void loop()
{
	unsigned long current_millies = millis();

	if(digitalRead(BUTTON_PIN))
		lightCtrlIface_raise_button(&lightctrl);

	if ( cycle_count == 0L || (current_millies >= last_cycle_time + CYCLE_PERIOD) ) {

			sc_timer_service_proceed(&timer_service, current_millies - last_cycle_time);

			lightCtrl_runCycle(&lightctrl);

			last_cycle_time = current_millies;
			cycle_count++;
		}
}
