/*
 * yet_logger.h
 *
 *  Created on: 31.03.2020
 *      Author: terfloth
 */

#ifndef YET_LOGGER_H_
#define YET_LOGGER_H_

#include "../base/sc_rxc.h"

#ifdef __cplusplus
extern "C" {
#endif


typedef struct yet_logger yet_logger;

struct yet_logger {
	sc_boolean enabled;
	sc_observer send_logger;
	sc_observer receive_logger;
};

extern void yet_logger_init(yet_logger *self);


#ifdef __cplusplus
}
#endif


#endif /* YET_LOGGER_H_ */
