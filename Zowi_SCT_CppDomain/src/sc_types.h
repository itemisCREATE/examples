
#ifndef SC_TYPES_H_
#define SC_TYPES_H_

/* As <cstdint> is not available on all platforms we choose to include <stdint.h>. You can switch to <cstdint> by commenting and uncommenting the lines below.*/
// #include <cstdint>
#include <stdint.h>

#ifndef sc_string
#define sc_string      char*
#endif

typedef int_fast16_t   sc_short;
typedef uint_fast16_t  sc_ushort;
typedef int32_t        sc_integer;
typedef int16_t		   sc_errorCode;
typedef double         sc_real;
typedef bool           sc_boolean;

typedef intptr_t       sc_eventid;

#ifndef null
#define null 0
#endif

/* Error codes and mask can be used to check unimplemented operation callbacks. They can be activated in the API feature within the .sgen file.*/
#ifndef OCB_INIT_ERROR_MASK
#define OCB_INIT_ERROR_MASK 0b1000000100000000
#endif

#ifndef OCB_DEFAULT_INIT_ERROR
#define OCB_DEFAULT_INIT_ERROR (OCB_INIT_ERROR_MASK | 0b00000001)
#endif

#ifndef OCB_NAMED_INIT_ERROR
#define OCB_NAMED_INIT_ERROR (OCB_INIT_ERROR_MASK | 0b00000010)
#endif

#ifndef OCB_INTERNAL_INIT_ERROR
#define OCB_INTERNAL_INIT_ERROR (OCB_INIT_ERROR_MASK | 0b00000100)
#endif			

#endif /* SC_TYPES_H_ */
