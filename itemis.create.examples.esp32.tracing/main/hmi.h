/*
 * hmi.h
 *
 *  Created on: 07.04.2020
 *      Author: terfloth
 */

#ifndef HMI_H_
#define HMI_H_

#include "sc/sm/blink.h"
#include "sc/util/ted_logger.h"
#include "sc/util/ted_udp_stream.h"

extern void hmi_init(Blink* machine, ted_logger* logger, ted_udp_stream* udp_trace);

extern void hmi_proceed();

extern void hmi_help();


#endif /* SC_HMI_H_ */
