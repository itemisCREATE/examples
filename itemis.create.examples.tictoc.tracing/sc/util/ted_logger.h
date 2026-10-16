/*
 * ted_logger.h
 *
 *  Created on: 31.03.2020
 *      Author: terfloth
 */

#ifndef TED_LOGGER_H_
#define TED_LOGGER_H_

#include "../base/sc_rxc.h"

#ifdef __cplusplus
extern "C" {
#endif


typedef struct ted_logger ted_logger;

struct ted_logger {
	sc_boolean enabled;
	sc_single_subscription_observer_sc_string send_logger;
	sc_single_subscription_observer_sc_string receive_logger;
};

extern void ted_logger_init(ted_logger *self);


#ifdef __cplusplus
}
#endif


#endif /* TED_LOGGER_H_ */
