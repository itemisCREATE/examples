/**
 *  \file       main.c
 *  \brief      Example application.
 */

/* -------------------------- Development history -------------------------- */
/*
 *  2016.03.17  LeFr  v1.0.00  Initial version
 *  2019.21.08  LeFr  v1.0.00  Adapted to Yakindu example
 *  2019.22.08  DaBa  v1.0.00  Setup Trace facility
 */

/* -------------------------------- Authors -------------------------------- */
/*
 *  LeFr  Leandro Francucci lf@vortexmakes.com
 *  DaBa  Dario Baliña      db@vortexmakes.com
 */

/* --------------------------------- Notes --------------------------------- */
/* ----------------------------- Include files ----------------------------- */
#include "rkh.h"
#include "Blinky.h"
#include "bsp.h"

/* ----------------------------- Local macros ------------------------------ */
#define QSTO_SIZE           4

/* ------------------------------- Constants ------------------------------- */
/* ---------------------------- Local data types --------------------------- */
/* ---------------------------- Global variables --------------------------- */
/* ---------------------------- Local variables ---------------------------- */
static RKH_EVT_T *qsto[QSTO_SIZE];

/* ----------------------- Local function prototypes ----------------------- */
/* ---------------------------- Local functions ---------------------------- */
static void
setupTraceFilters(void)
{
    RKH_FILTER_ON_GROUP(RKH_TRC_ALL_GROUPS);
    RKH_FILTER_ON_EVENT(RKH_TRC_ALL_EVENTS);
    RKH_FILTER_OFF_EVENT(RKH_TE_TMR_TOUT);
    RKH_FILTER_OFF_EVENT(RKH_TE_SM_STATE);
    //RKH_FILTER_OFF_EVENT(RKH_TE_SMA_FIFO);
    //RKH_FILTER_OFF_EVENT(RKH_TE_SMA_LIFO);
    //RKH_FILTER_OFF_EVENT(RKH_TE_SM_TS_STATE);
    RKH_FILTER_OFF_EVENT(RKH_TE_SM_DCH);
    RKH_FILTER_OFF_SMA(blinky);
    RKH_FILTER_OFF_ALL_SIGNALS();
}

/* ---------------------------- Global functions --------------------------- */
int
main(int argc, char *argv[])
{
    bsp_init(argc, argv);

    rkh_fwk_init();

    setupTraceFilters();

    RKH_TRC_OPEN();

    RKH_SMA_ACTIVATE(blinky, qsto, QSTO_SIZE, 0, 0);
    rkh_fwk_enter();

    RKH_TRC_CLOSE();
    return 0;
}

/* ------------------------------ End of file ------------------------------ */
