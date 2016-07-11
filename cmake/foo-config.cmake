# This cmake config accepts any case in find_package(...), but
# sets variables using the upper-case syntax.

message(STATUS "[foo-config.cmake] Found package 'foo' in '${CMAKE_CURRENT_LIST_DIR}'.")

# List of variables derived from https://cmake.org/cmake/help/v3.0/command/find_package.html
message(STATUS "[foo-config.cmake] Variables set by cmake:")
foreach(prefix foo FOO)
  foreach(var
    ${prefix}_FOUND
    ${prefix}_DIR
    ${prefix}_FIND_REQUIRED
    ${prefix}_FIND_QUIETLY
    ${prefix}_FIND_VERSION
    ${prefix}_FIND_VERSION_MAJOR
    ${prefix}_FIND_VERSION_MINOR
    ${prefix}_FIND_VERSION_PATCH
    ${prefix}_FIND_VERSION_TWEAK
    ${prefix}_FIND_VERSION_COUNT
    ${prefix}_FIND_VERSION_EXACT
    ${prefix}_FIND_COMPONENTS
  )
    if(DEFINED ${var})
      message(STATUS "[foo-config.cmake]  - ${var}=${${var}}")
    endif()
  endforeach()
  foreach(comp ${prefix}_FIND_COMPONENTS)
    set(var ${prefix}_FIND_REQUIRED_${comp})
    if(DEFINED ${var})
      message(STATUS "[foo-config.cmake]  - ${var}=${${var}}")
    endif()
  endforeach()
endforeach()

set(FOO_INCLUDE_DIRS "/path/to/package/foo/include")

message(STATUS "[foo-config.cmake] Set the following variables:")
foreach(var FOO_INCLUDE_DIRS)
  message(STATUS "[foo-config.cmake]  - ${var}=${${var}}")
endforeach()

