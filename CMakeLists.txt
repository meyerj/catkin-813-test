cmake_minimum_required(VERSION 2.8.3)
project(catkin_813_test)

function(test_find_package package)
  message(STATUS "[CMakeLists.txt] Calling `find_package(${package} ${ARGN})`")
  find_package(${package} ${ARGN} HINTS ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

  string(TOUPPER "${package}" package_upper)
  string(TOLOWER "${package}" package_lower)

  message(STATUS "[CMakeLists.txt] After `find_package(${package} ${ARGN})`:")
  foreach(prefix ${package_upper} ${package_lower})
    foreach(suffix FOUND DIR CONFIG CONSIDERED_CONFIGS INCLUDE_DIRS)
      set(var ${prefix}_${suffix})
      if(DEFINED ${var})
        message(STATUS "[CMakeLists.txt]  - ${var}=${${var}}")
      else()
        message(STATUS "[CMakeLists.txt]  - ${var} is not defined.")
      endif()
    endforeach()
  endforeach()

  message(STATUS "")
endfunction()  

# find package foo using upper-case name
test_find_package(FOO REQUIRED)

# find package foo using lower-case name
test_find_package(foo REQUIRED)

