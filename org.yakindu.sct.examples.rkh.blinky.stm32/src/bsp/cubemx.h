/**
 *  \file       cubemx.h
 *  \brief      CubeMx modules includes
 * 
 *  \ingroup    bsp
 */

/* -------------------------- Development history -------------------------- */
/* -------------------------------- Authors -------------------------------- */
/*
 *  DaBa  Dario Baliña       db@vortexmakes.com
 */

/* --------------------------------- Module -------------------------------- */
#ifndef __CUBEMX_H__
#define __CUBEMX_H__

#include "stm32f4xx_it.h"

#include "main.h"
#include "gpio.h"
#include "usart.h"
#include "dma.h"

#include "rkhtype.h"

void SystemClock_Config(void);
void Systick_setCallback(SystickCb cb);

#endif
