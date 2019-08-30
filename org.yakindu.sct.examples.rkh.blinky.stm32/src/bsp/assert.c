/**
 *  \file       assert.c
 *  \brief      RKH assert function for STM32
 *
 *  \ingroup    bsp
 */

/* -------------------------- Development history -------------------------- */
/*
 *  2017.04.14  DaBa  v2.4.05  Initial version
 */

/* -------------------------------- Authors -------------------------------- */
/*
 *  DaBa  Dario Baliña       db@vortexmakes.com
 */
/* --------------------------------- Notes --------------------------------- */
/* ----------------------------- Include files ----------------------------- */
#include <stdio.h>

#include "rkh.h"

RKH_THIS_MODULE

/* ----------------------------- Local macros ------------------------------ */
#ifdef DEBUG
#define reset_now()		__asm volatile	("	bkpt 0x00FF\n" )
#else
#define reset_now()		NVIC_SystemReset()
#endif

/* ------------------------------- Constants ------------------------------- */
/* ---------------------------- Local data types --------------------------- */
/* ---------------------------- Global variables --------------------------- */
/* ---------------------------- Local variables ---------------------------- */
/* ----------------------- Local function prototypes ----------------------- */
/* ---------------------------- Local functions ---------------------------- */
/* ---------------------------- Global functions --------------------------- */
void
rkh_assert(RKHROM char * const file, int line)
{
    fprintf(stderr,    "RKH_ASSERT: [%d] line from %s "
            "file\n", line, file);
    RKH_DIS_INTERRUPT();
    RKH_TR_FWK_ASSERT((RKHROM char *)file, __LINE__);
    rkh_fwk_exit();
	reset_now();
}

/* ------------------------------ File footer ------------------------------ */
