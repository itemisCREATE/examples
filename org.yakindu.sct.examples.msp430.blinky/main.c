#include <msp430.h> 
#include "src-gen/BlinkyStateMachine.h"
#include "src/sc_timer_service.h"

BlinkyStateMachine blinky;

//! As we make use of time triggers (after & every) we make use of a generic timer implementation and need a defined number of timers.
#define MAX_TIMERS 4

//! We allocate the desired array of timers.
static sc_timer_t timers[MAX_TIMERS];

//! The timers are managed by a timer service. */
static sc_timer_service_t timer_service;

//! callback implementation for the setting up time events
extern void blinkyStateMachine_set_timer(BlinkyStateMachine* handle, const sc_eventid evid, const sc_integer time_ms, const sc_boolean periodic)
{
    sc_timer_start(&timer_service, handle, evid, time_ms, periodic);
}

//! callback implementation for canceling time events.
extern void blinkyStateMachine_unset_timer(BlinkyStateMachine* handle, const sc_eventid evid)
{
    sc_timer_cancel(&timer_service, evid);
}

//! defining operations
extern void blinkyStateMachineInternal_init(const BlinkyStateMachine* handle)
{
    WDTCTL = WDT_MDLY_32;
    IE1 |= WDTIE;
    P1DIR |= BIT0;
}

extern void blinkyStateMachineInternal_redOn(const BlinkyStateMachine* handle)
{
    P1OUT |= BIT0;
}

extern void blinkyStateMachineInternal_redOff(const BlinkyStateMachine* handle)
{
    P1OUT &= ~BIT0;
}

void main(void) {
    WDTCTL = WDTPW | WDTHOLD;   // Stop watchdog timer

    // Init timer and state machine
    sc_timer_service_init(&timer_service, timers, MAX_TIMERS,
                (sc_raise_time_event_fp) &blinkyStateMachine_raise_time_event);
    blinkyStateMachine_init(&blinky);
    blinkyStateMachine_enter(&blinky);

    while (1)
    {
        // call state machine every 32 ms
        blinkyStateMachine_run_cycle(&blinky);
        __bis_SR_register(LPM0_bits + GIE);
        sc_timer_service_proceed(&timer_service, 32);
    }
}

// WDT ISR
#pragma vector=WDT_VECTOR
__interrupt void watchdog_timer(void)
{
    __bic_SR_register_on_exit(LPM0_bits + GIE);
}
