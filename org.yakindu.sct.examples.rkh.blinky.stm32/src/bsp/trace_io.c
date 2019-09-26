/**
 *  \file       trace_io.c
 *  \brief      Trace Serial support for STM32
 *
 *  \ingroup    bsp
 */

/* -------------------------- Development history -------------------------- */
/* -------------------------------- Authors -------------------------------- */
/*
 *  DaBa  Dario Baliña     db@vortexmakes.com
 */

/* --------------------------------- Notes --------------------------------- */
/* ----------------------------- Include files ----------------------------- */
#include "rkh.h"
#include "bsp.h"
#include "cubemx.h"

#if RKH_CFG_TRC_EN == 1

/* ----------------------------- Local macros ------------------------------ */
/* ------------------------------- Constants ------------------------------- */
#define TRC_COM_PORT        &huart2    /* CubeMX allocated handler */
#define TRC_UART_Init()     MX_USART2_UART_Init()  /* CubeMX peripheral init */
#define BSP_TS_RATE_HZ      (1000/RKH_CFG_FWK_TICK_RATE_HZ)

/* ---------------------------- Local data types --------------------------- */
/* ---------------------------- Global variables --------------------------- */
/* ---------------------------- Local variables ---------------------------- */
/* ----------------------- Local function prototypes ----------------------- */
/* ---------------------------- Local functions ---------------------------- */
/* ---------------------------- Global functions --------------------------- */
void
rkh_trc_open(void)
{
    rkh_trc_init();

    TRC_UART_Init();

    RKH_TRC_SEND_CFG(BSP_TS_RATE_HZ);
}



void
rkh_trc_close(void)
{
}

void
rkh_trc_flush(void)
{
    rui8_t *blk;
    TRCQTY_T nbytes;
    RKH_SR_ALLOC();

    FOREVER
    {
        nbytes = 128;

        RKH_ENTER_CRITICAL_();
        blk = rkh_trc_get_block(&nbytes);
        RKH_EXIT_CRITICAL_();

        if ((blk != (rui8_t *)0))
        {
        	while(HAL_UART_GetState(TRC_COM_PORT) != HAL_UART_STATE_READY);

            HAL_UART_Transmit_DMA(TRC_COM_PORT, blk, nbytes);
        }
        else
        {
            break;
        }
    }
}
#endif

/* ------------------------------ File footer ------------------------------ */
