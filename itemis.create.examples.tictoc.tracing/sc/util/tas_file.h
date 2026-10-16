/*
 * tas_file.h
 *
 *  Created on: 30.03.2020
 *      Author: terfloth
 */

#ifndef TAS_FILE_H_
#define TAS_FILE_H_

#include <stdio.h>
#include "../base/sc_rxc.h"

#ifdef __cplusplus
extern "C" {
#endif


typedef struct tas_file_writer tas_file_writer;

struct tas_file_writer {
	FILE* tracefile;
	sc_single_subscription_observer_sc_string message_writer;
};

extern void tas_file_writer_init(tas_file_writer *self, char* filename);

#ifdef __cplusplus
}
#endif

#endif /* TAS_FILE_H_ */
