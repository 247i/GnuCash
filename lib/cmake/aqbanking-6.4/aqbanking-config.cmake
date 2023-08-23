
macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

include(CMakeFindDependencyMacro)
find_dependency(gwenhywfar "5.5.1.1")

set_and_check(prefix "/c/gcdev64/gnucash/releases/inst")
set_and_check(exec_prefix "${prefix}")
set_and_check(includedir "${prefix}/include")
set_and_check(AQBANKING_INCLUDE_DIRS "${includedir}/aqbanking6")
if(WIN32)
    set_and_check(AQBANKING_LIBRARIES "${exec_prefix}/lib/libaqbanking.dll.a")
elseif(APPLE)
    set_and_check(AQBANKING_LIBRARIES "${exec_prefix}/lib/libaqbanking.44.dylib")
else()
    set_and_check(AQBANKING_LIBRARIES "${exec_prefix}/lib/libaqbanking.so.44")
endif()
set(AQBANKING_FOUND true)

# The target is available since aqbanking 5.6.5
if(AQBANKING_FOUND AND NOT TARGET aqbanking::aqbanking)
  add_library(aqbanking::aqbanking UNKNOWN IMPORTED)
  set_target_properties(aqbanking::aqbanking PROPERTIES
    IMPORTED_LOCATION "${AQBANKING_LIBRARIES}"
    INTERFACE_INCLUDE_DIRECTORIES "${AQBANKING_INCLUDE_DIRS}"
    INTERFACE_LINK_LIBRARIES gwenhywfar::core
  )
endif()

set(AQBANKING_LIBRARIES ${AQBANKING_LIBRARIES} ${GWENHYWFAR_LIBRARIES})
mark_as_advanced( AQBANKING_INCLUDE_DIRS AQBANKING_LIBRARIES )
