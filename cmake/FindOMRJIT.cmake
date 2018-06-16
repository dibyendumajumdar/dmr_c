find_path(NJ_INCLUDE_DIR nj_api.h
  PATHS
  c:/Software/omr/include/nj
  ~/omr/include/nj
  ~/software/omr/include/nj
  NO_DEFAULT_PATH
)

find_library(NJ_LIBRARY
  NAMES njapi 
  PATHS
  c:/Software/omr/lib
  ~/omr/lib
  ~/software/omr/lib
)

find_library(JITBUILDER_LIBRARY
  NAMES jitbuilder 
  PATHS
  c:/Software/omr/lib
  ~/omr/lib
  ~/software/omr/lib
)


set( NJ_INCLUDE_DIRS "${NJ_INCLUDE_DIR}" )
set( NJ_LIBRARIES "${NJ_LIBRARY};${JITBUILDER_LIBRARY}" )
