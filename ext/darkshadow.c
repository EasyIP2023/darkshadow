#include "darkshadow.h"

void Init_darkshadow(void) {
  DEBUG_PRINT("Init_darkshadow");
  reap = rb_define_module("Reap");
  Init_sniffer();
}
