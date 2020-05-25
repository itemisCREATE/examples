/*
 * yet_file.h
 *
 *  Created on: 30.03.2020
 *      Author: terfloth
 */

#ifndef YET_FILE_H_
#define YET_FILE_H_

#include <stdio.h>
#include "../base/sc_rxc.h"

#ifdef __cplusplus
extern "C" {
#endif


typedef struct yet_file_writer yet_file_writer;

struct yet_file_writer {
	FILE* tracefile;
	sc_observer message_writer;
};

extern void yet_file_writer_init(yet_file_writer *self, char* filename);

#ifdef __cplusplus
}
#endif

#endif /* YET_FILE_H_ */
