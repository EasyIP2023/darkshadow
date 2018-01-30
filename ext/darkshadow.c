#include "darkshadow.h"

void rb_darkshadow_print(VALUE self, char *s) {
  printf("%s\n", s);
}

void Init_darkshadow(void) {
  DEBUG_PRINT("Init_darkshadow");
  reap = rb_define_module("Reap");
  rb_define_module_function(reap, "d_print", rb_darkshadow_print, 1);
  Init_sniffer();
}
