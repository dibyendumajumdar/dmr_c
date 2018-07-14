find_path(NJ_INCLUDE_DIR nj_api.h
  PATHS
  c:/Software/omr/include/nj
  ~/Software/omr/include/nj
  NO_DEFAULT_PATH
)

find_library(JITBUILDER_LIBRARY
  NAMES nj libnj libnj.dylib
  #NAMES jitbuilder libjitbuilder libjitbuilder.dylib
  PATHS
  c:/Software/omr/lib
  ~/Software/omr/lib
)

set( NJ_INCLUDE_DIRS "${NJ_INCLUDE_DIR}" )
set( NJ_LIBRARIES "${JITBUILDER_LIBRARY}" )
