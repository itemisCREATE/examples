/*
 * tdt_logger.h
 *
 *  Created on: 31.03.2020
 *      Author: terfloth
 */

#ifndef TDT_LOGGER_H_
#define TDT_LOGGER_H_

#include "../base/sc_rxc.h"

#ifdef __cplusplus
extern "C" {
#endif


typedef struct tdt_logger tdt_logger;

struct tdt_logger {
	sc_boolean enabled;
	sc_single_subscription_observer_sc_string send_logger;
	sc_single_subscription_observer_sc_string receive_logger;
};

extern void tdt_logger_init(tdt_logger *self);


#ifdef __cplusplus
}
#endif


#endif /* TDT_LOGGER_H_ */
