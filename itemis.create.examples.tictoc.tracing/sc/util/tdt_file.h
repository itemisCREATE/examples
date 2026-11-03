/*
 * tdt_file.h
 *
 *  Created on: 30.03.2020
 *      Author: terfloth
 */

#ifndef TDT_FILE_H_
#define TDT_FILE_H_

#include <stdio.h>
#include "../base/sc_rxc.h"

#ifdef __cplusplus
extern "C" {
#endif


typedef struct tdt_file_writer tdt_file_writer;

struct tdt_file_writer {
	FILE* tracefile;
	sc_single_subscription_observer_sc_string message_writer;
};

extern void tdt_file_writer_init(tdt_file_writer *self, char* filename);

#ifdef __cplusplus
}
#endif

#endif /* TDT_FILE_H_ */
