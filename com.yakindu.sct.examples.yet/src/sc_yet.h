#ifndef SC_YET_H
#define SC_YET_H

#include "sc_types.h"

#ifdef __cplusplus
extern "C" {
#endif

#define YET_MESSAGE_INIT_BEGIN '%'
#define YET_MESSAGE_UPDATE_BEGIN '#'
#define YET_MESSAGE_SEPARATOR ','
#define YET_ERR_INVALID_MSG 1
#define YET_ERR_INVALID_BEGIN 2
#define YET_ERR_INVALID_TIMESTAMP 4
#define YET_ERR_INVALID_KEY 8
#define YET_ERR_INVALID_VALUE 16
#define YET_ERR_MISSING_VALUE 32
#define YET_ERR_NULLPTR 64

enum yet_message_type {
	INIT,
	UPDATE
};

typedef struct yet_message yet_message;

struct yet_message {
	enum yet_message_type type;
	unsigned long timestamp;
	char* key;
	char* value;
};

typedef struct yet_scope yet_scope;

/**
 * When a scope is matched, its handler is called.
 * The handler should return 0 on success.
 */
typedef uint8_t (*yet_handler)(yet_scope* scope, yet_message *msg, char *fqn);

struct yet_scope {
	yet_scope *parent_scope;
	yet_scope **child_scopes;
	sc_integer num_child_scopes;
	sc_string name;
	yet_handler handler;
	void* instance;
};


/*
 * Functions that need to be implemented by clients
 */

/*! 
 * Function to write YET messages somewhere, e.g. via serial.
 */
void yet_write(char* buf, int len);

/*! Function to retrieve the current timestamp, ideally in milliseconds. */
unsigned long get_current_timestamp();

/*
 * This function is called by tracing state machines.
 */
void yet_send(struct yet_message * msg);

/*!
 * If a message was received, call this function to process it.
 */
void yet_accept_message(yet_scope *scope, char *text);

void yet_scope_dispatch(yet_scope* scope, yet_message* msg, char *fqn);

char* yet_create_scoped_message(yet_scope* scope, char* msg, char* dst);

void yet_init_scope(yet_scope* scope, yet_scope* parent_scope, char *name, yet_handler handler, void* instance);

#ifdef __cplusplus
}
#endif

#endif
