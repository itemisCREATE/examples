/**
 *  \file       hook.c
 *  \brief      RKH hooks functions for STM32
 *
 *  \ingroup    bsp
 */

/* -------------------------- Development history -------------------------- */
/*
 *  2019.01.31  DaBa  v2.4.05  Initial version
 */

/* -------------------------------- Authors -------------------------------- */
/*
 *  DaBa  Dario Baliña     db@vortexmakes.com
 */
/* --------------------------------- Notes --------------------------------- */
/* ----------------------------- Include files ----------------------------- */
#include "bsp.h"
#include "rkh.h"
#include "cubemx.h"

RKH_THIS_MODULE

/* ----------------------------- Local macros ------------------------------ */
/* ------------------------------- Constants ------------------------------- */
#define BSP_TICK_RATE_MS    (1000/RKH_CFG_FWK_TICK_RATE_HZ)

/* ---------------------------- Local data types --------------------------- */
/* ---------------------------- Global variables --------------------------- */
/* ---------------------------- Local variables ---------------------------- */
#if defined(RKH_CFG_SMA_TRC_SNDR_EN)
static rui8_t rkhtick;
#endif

static ruint tickCounter;

/* ----------------------- Local function prototypes ----------------------- */
static void SystickHook(void);

/* ---------------------------- Local functions ---------------------------- */
static void
SystickHook(void)
{
    if(tickCounter && (--tickCounter == 0))
    {
        tickCounter = BSP_TICK_RATE_MS;
        RKH_TIM_TICK(&rkhtick);
    }
}

/* ---------------------------- Global functions --------------------------- */
void
rkh_hook_start(void)
{    
    tickCounter = BSP_TICK_RATE_MS;
    Systick_setCallback(SystickHook);
    RKH_TR_FWK_ACTOR(&rkhtick, "rkhtick");
}

void
rkh_hook_exit(void)
{
    RKH_TRC_FLUSH();
}

void
rkh_hook_timetick(void)
{
    bsp_timeTick();
}

void
rkh_hook_idle(void)             /* called within critical section */
{
	RKH_ENA_INTERRUPT();
    RKH_TRC_FLUSH();
}

/* ------------------------------ File footer ------------------------------ */
