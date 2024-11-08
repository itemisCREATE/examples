/** Generated by itemis CREATE code generator. */

#ifndef SC_TYPES_H_
#define SC_TYPES_H_

#ifdef __STDC_VERSION__
	#if __STDC_VERSION__ >= 199901L 
		#define HAS_C99_BOOLS
	#endif
#else
	#ifdef __cplusplus
		#define HAS_C99_BOOLS
	#endif
#endif

#ifdef __cplusplus
extern "C"
{
#endif 

#include <stdint.h>
#ifdef HAS_C99_BOOLS
#include <stdbool.h>
#endif

#define sc_string		char*
 
#ifdef HAS_C99_BOOLS
typedef bool			sc_boolean;
#else
typedef uint8_t			sc_boolean;
#endif

typedef int_fast16_t	sc_short;
typedef uint_fast16_t	sc_ushort;
typedef int32_t			sc_integer;
typedef uint32_t		sc_uinteger;

typedef int32_t       sc_time;

typedef double			sc_real;

typedef void*			sc_eventid;

typedef intptr_t		sc_intptr_t;

#ifdef __cplusplus
}
#endif

#ifndef sc_null
	#ifdef __cplusplus
		#if __cplusplus >= 201103L || (defined(_MSC_VER) && _MSC_VER >= 1900)
	  		#define sc_null nullptr
		#else
			#define sc_null 0
		#endif
	#else
		#define sc_null ((void *)0)
	#endif
#endif

#ifdef HAS_C99_BOOLS
#define bool_true true
#define bool_false false
#else
#define bool_true 1
#define bool_false 0
#endif

#endif /* SC_TYPES_H_ */
