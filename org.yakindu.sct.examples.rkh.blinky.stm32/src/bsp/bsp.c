/**
 *  \file       bsp.c
 *  \brief      BSP implementation for STM32
 *
 *  \ingroup    bsp
 */

/* -------------------------- Development history -------------------------- */
/*
 *  2019.01.31  DaBa  v0.0.01  Initial version
 */

/* -------------------------------- Authors -------------------------------- */
/*
 *  DaBa  Dario Baliña       db@vortexmakes.com
 */

/* --------------------------------- Notes --------------------------------- */
/* ----------------------------- Include files ----------------------------- */
#include <stdio.h>
#include <string.h>
#include "rkh.h"
#include "cubemx.h"
#include "bsp.h"

#include "signals.h"

RKH_THIS_MODULE

/* ----------------------------- Local macros ------------------------------ */
/* ------------------------------- Constants ------------------------------- */
/* ---------------------------- Local data types --------------------------- */
/* ---------------------------- Global variables --------------------------- */
/* ---------------------------- Local variables ---------------------------- */
static RKH_TS_T tstamp;

/* ----------------------- Local function prototypes ----------------------- */
/* ---------------------------- Local functions ---------------------------- */
/* ---------------------------- Global functions --------------------------- */
void
bsp_init(int argc, char *argv[])
{
    (void)argc;
    (void)argv;

    HAL_Init();

    SystemClock_Config();
    MX_GPIO_Init();
    MX_DMA_Init();
}

void
bsp_timeTick(void)
{
    ++tstamp;
}

RKH_TS_T
rkh_trc_getts(void)
{
    return tstamp;
}

void bsp_ledOn(void)
{
    HAL_GPIO_WritePin(LD5_GPIO_Port, LD5_Pin, 1);
}

void
bsp_ledOff(void)
{
    HAL_GPIO_WritePin(LD5_GPIO_Port, LD5_Pin, 0);
}

/* ------------------------------ File footer ------------------------------ */
