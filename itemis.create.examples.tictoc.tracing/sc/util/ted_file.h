/*
 * ted_file.h
 *
 *  Created on: 30.03.2020
 *      Author: terfloth
 */

#ifndef TED_FILE_H_
#define TED_FILE_H_

#include <stdio.h>
#include "../base/sc_rxc.h"

#ifdef __cplusplus
extern "C" {
#endif


typedef struct ted_file_writer ted_file_writer;

struct ted_file_writer {
	FILE* tracefile;
	sc_single_subscription_observer_sc_string message_writer;
};

extern void ted_file_writer_init(ted_file_writer *self, char* filename);

#ifdef __cplusplus
}
#endif

#endif /* TED_FILE_H_ */
