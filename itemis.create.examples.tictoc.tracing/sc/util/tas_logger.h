/*
 * tas_logger.h
 *
 *  Created on: 31.03.2020
 *      Author: terfloth
 */

#ifndef TAS_LOGGER_H_
#define TAS_LOGGER_H_

#include "../base/sc_rxc.h"

#ifdef __cplusplus
extern "C" {
#endif


typedef struct tas_logger tas_logger;

struct tas_logger {
	sc_boolean enabled;
	sc_single_subscription_observer_sc_string send_logger;
	sc_single_subscription_observer_sc_string receive_logger;
};

extern void tas_logger_init(tas_logger *self);


#ifdef __cplusplus
}
#endif


#endif /* TAS_LOGGER_H_ */
