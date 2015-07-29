
if (WithSharedPCRE2)
  find_package(PCRE2 REQUIRED)
  message("PCRE2 include dir: ${PCRE2_INCLUDE_DIR}")
  message("PCRE2 libraries: ${PCRE2_LIBRARIES}")
  include_directories(${PCRE2_INCLUDE_DIR})
  link_directories(${PCRE2_ROOT_DIR}/lib)
  list(APPEND LIB_LIST ${PCRE2_LIBRARIES})
else (WithSharedPCRE2)
  set (PCRE2_BUILD_PCRE2GREP OFF)
  set (PCRE2_BUILD_TESTS OFF)
  set (PCRE2_MATCH_LIMIT 150000)
  add_subdirectory(deps/pcre2)
  message("Enabling Static PCRE2")
  list(APPEND LIB_LIST pcre2posix)
endif (WithSharedPCRE2)

add_definitions(-DWITH_PCRE2)
include(deps/lrexlib.cmake)
