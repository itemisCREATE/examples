
#include "sc_yet.h"
#include "sc_types.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>


static void create_message(char* buf, struct yet_message * msg);
static void create_init_message(char* buf, char* key, char* value);
static void create_update_message(char* buf, unsigned long timestamp, char* key, char* value);

static unsigned int get_msg_len(yet_message* msg);
static unsigned int get_msg_len_init(char* key, char* value);
static unsigned int get_msg_len_update(unsigned long timestamp, char* key, char* value);
static unsigned int get_char_count_ulong(unsigned long data);

static int read_message(char* text, yet_message* msg);
static int read_timestamp(char* text, char** endptr, yet_message * msg);
static int read_key(char* text, char** endptr, yet_message * msg);
static int read_value(char* text, struct yet_message * msg);

void yet_send(struct yet_message * msg)
{
	int len = get_msg_len(msg);
	char buf[len];
	create_message(buf, msg);
	yet_write(buf, len-1);
}

void create_init_message(char* buf, char* key, char* value)
{
	sprintf(buf, "%c%s,%s\n", YET_MESSAGE_INIT_BEGIN, key, value);
}

void create_update_message(char* buf, unsigned long timestamp, char* key, char* value)
{
	if(value != NULL) {
		sprintf(buf, "%c%lu,%s,%s\n", YET_MESSAGE_UPDATE_BEGIN, timestamp, key, value);
	} else {
		sprintf(buf, "%c%lu,%s\n", YET_MESSAGE_UPDATE_BEGIN, timestamp, key);
	}
}

void create_message(char* buf, struct yet_message * msg)
{
	if(msg->type == INIT) {
		create_init_message(buf, msg->key, msg->value);
	} else if(msg->type == UPDATE) {
		create_update_message(buf, msg->timestamp, msg->key, msg->value);
	}
}

unsigned int get_msg_len_init(char* key, char* value)
{
	unsigned int count = 4; // Start char '%', a comma, a newline character and a null terminator
	count += strlen(key);
	count += strlen(value);
	return count;
}

unsigned int get_msg_len_update(unsigned long timestamp, char* key, char* value)
{
	unsigned int count = 4; // Start char '#', a comma, a newline character and a null terminator
	count += get_char_count_ulong(timestamp);
	count += strlen(key);
	if (value != NULL) {
		count += strlen(value) + 1; //For needed additional comma separator
	}
	return count;
}

unsigned int get_msg_len(yet_message* msg)
{
	if(msg->type == INIT) {
		return get_msg_len_init(msg->key, msg->value);
	} else if(msg->type == UPDATE) {
		return get_msg_len_update(msg->timestamp, msg->key, msg->value);
	}
	return 0;
}

unsigned int get_char_count_ulong(unsigned long data)
{
	return (int)log10((double)data) + 1;
}

int read_message(char* text, yet_message* msg)
{
	char* endptr = NULL;
	char begin;
	int e;

	if(text == NULL || msg == NULL) {
		return YET_ERR_NULLPTR;
	}

	begin = *text;
	if(begin != YET_MESSAGE_INIT_BEGIN && begin != YET_MESSAGE_UPDATE_BEGIN) {
		return (YET_ERR_INVALID_MSG | YET_ERR_INVALID_BEGIN);
	}

	text++;
	if(begin == YET_MESSAGE_UPDATE_BEGIN) {
		msg->type = UPDATE;
		e = read_timestamp(text, &endptr, msg);
		if(e != 0) {
			return (YET_ERR_INVALID_MSG | e);
		}
		text = endptr + 1;
	} else {
		msg->type = INIT;
	}

	e = read_key(text, &endptr, msg);
	if(e != 0) {
		return (YET_ERR_INVALID_MSG | e);
	}

	text = endptr;
	if(begin == YET_MESSAGE_INIT_BEGIN && *text == '\0') {
		return (YET_ERR_INVALID_MSG | YET_ERR_MISSING_VALUE);
	}

	if(*text == YET_MESSAGE_SEPARATOR) {
		*text = '\0';
		e = read_value(text + 1, msg);
	} else {
		msg->value = NULL;
	}
	if(*text == '\n') {
		*text = '\0';
	}
	if(e != 0) {
		return (YET_ERR_INVALID_MSG | e);
	}
	return 0;
}

int read_timestamp(char* text, char** endptr, yet_message * msg)
{
	msg->timestamp = strtoul(text, endptr, 10);
	/*
	 * strtoul saves the address of the first character that is not a digit
	 * in endptr. If endptr == text, something went wrong / no digits were found.
	 */
	if(*endptr != text) {
		return 0;
	}

	return YET_ERR_INVALID_TIMESTAMP;
}

int read_key(char* text, char** endptr, yet_message * msg)
{
	if(text == 0 || *text == '\0') {
		return YET_ERR_INVALID_KEY;
	}
	int i = 0;
	msg->key = text;
	while(text[i] != YET_MESSAGE_SEPARATOR && text[i] != '\0' && text[i] != '\n') {
		i++;
	}
	if(i != 0) {
		*endptr = text + i;
		return 0;
	}
	return YET_ERR_INVALID_KEY;
}

int read_value(char* text, struct yet_message * msg)
{
	if(text == 0 || *text == '\0' || (*text == '\n' && *(text+1) == '\0')) {
		return YET_ERR_INVALID_VALUE;
	}
	int i = 0;
	msg->value = text;
	while(text[i] != '\0') {
		i++;
	}
	if(text[i-1] == '\n') {
		// Remove message delimiting newline character
		text[i-1] = '\0';
	}
	if(i != 0) {
		return 0;
	}
	return YET_ERR_INVALID_VALUE;
}

void yet_accept_message(yet_scope *scope, char *text)
{
	struct yet_message msg;
	read_message(text, &msg);
	yet_scope_dispatch(scope, &msg, msg.key);
}

void yet_scope_dispatch(yet_scope* scope, yet_message* msg, char *fqn)
{
	char *next;
	if(scope->name != 0) {
		next = strchr(fqn, '.');
		if(next == fqn || next == 0) {
			return;
		}
		unsigned int prefix_len = next - fqn;
		if(strncmp(scope->name, fqn, prefix_len) != 0) {
			return;
		}
		next++;
	} else {
		next = fqn;
	}
	
	if(scope->num_child_scopes > 0) {
		for(int i = 0; i < scope->num_child_scopes; i++) {
			yet_scope_dispatch(scope->child_scopes[i], msg, next);
		}
	} else if(scope->handler != 0) {
		scope->handler(scope, msg, next);
	}
}

char* yet_create_scoped_message(yet_scope* scope, char* msg, char* dst)
{
	if(scope->parent_scope != 0) {
		dst = yet_create_scoped_message(scope->parent_scope, 0, dst);
	}
	if(scope->name != 0 && strlen(scope->name) > 0) {
		int name_len = strlen(scope->name);
		strncpy(dst, scope->name, name_len);
		dst += name_len;
		*dst = '.';
		dst++;
	}
	if(msg != 0) {
		strcpy(dst, msg);
		dst += strlen(msg);
		*dst = 0;
	}
	return dst;
}

void yet_init_scope(yet_scope* scope, yet_scope* parent_scope, char *name, yet_handler handler, void* instance)
{
	scope->parent_scope = parent_scope;
	scope->name = name;
	scope->handler = handler;
	scope->instance = instance;
}
