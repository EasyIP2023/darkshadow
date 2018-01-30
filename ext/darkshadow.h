#ifndef DARKSHADOW_H
#define DARKSHADOW_H

#include "ruby.h"

/* Global var used to specify module and classes */
VALUE reap;

#ifdef DEBUG
# define DEBUG_PRINT(x) do {\
    ((RTEST(ruby_debug) && RTEST(ruby_verbose))?\
    (fprintf(stderr, "%s\n", x),fflush(stderr)) : 0)\
} while (0)
#else
# define DEBUG_PRINT(x) do {} while (0)
#endif

/* darkshadow.c */
void Init_darkshadow(void);

/* sniffer.c */
VALUE sniff;
void Init_sniffer(void);

#endif /* DARKSHADOW_H */
