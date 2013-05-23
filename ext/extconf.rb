require 'mkmf'
require 'rbconfig'

is_windows = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/)

def crash(str)
  printf(" extconf failure: %s\n", str)
  exit 1
end

if is_windows
  $CFLAGS+=" -GX "    # allow exceptions
else
  $libs = append_library($libs, "stdc++")
end

inc, lib = dir_config('leap')
p inc, lib

if [nil, nil] != [inc, lib]
  $LDFLAGS << " -L#{lib} -lLeap"
  $CFLAGS << " -Wall -g -I#{inc}"
else
  crash "Please use --with-leap-lib and --with-leap-include to give the path to the lib and includes paths"
end

create_makefile("leap/motion")
