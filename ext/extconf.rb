require 'mkmf'

darkshadow_dir        = with_config("darkshadow-dir", "/usr/local")
darkshadow_includedir = with_config("darkshadow-includedir", darkshadow_dir + "/include")
darkshadow_libdir     = with_config("darkshadow-libdir", darkshadow_dir + "/lib")

$CFLAGS  = "-I #{darkshadow_includedir}"
$LDFLAGS = "-L #{darkshadow_libdir}"

create_makefile("darkshadow") if have_header("darkshadow.h")
