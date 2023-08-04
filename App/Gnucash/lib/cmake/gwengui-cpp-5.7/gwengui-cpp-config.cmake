
# Macros cmake's CONFIGURE_PACKAGE_CONFIG_FILE() would create

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
find_dependency(gwenhywfar "5.7.4")

set_and_check(prefix "/c/gcdev64/gnucash/releases/inst")
set_and_check(exec_prefix "${prefix}")
set_and_check(includedir "${prefix}/include")
set_and_check(GWENGUI_CPP_INCLUDE_DIRS "${includedir}/gwenhywfar5")
if(WIN32)
    set_and_check(GWENGUI_CPP_LIBRARIES "${exec_prefix}/lib/libgwengui-cpp.dll.a")
elseif(APPLE)
    set_and_check(GWENGUI_CPP_LIBRARIES "${exec_prefix}/lib/libgwengui-cpp.dylib")
else()
    set_and_check(GWENGUI_CPP_LIBRARIES "${exec_prefix}/lib/libgwengui-cpp.so")
endif()
set(GWENGUI_CPP_FOUND true)

if(GWENGUI_CPP_FOUND AND NOT TARGET gwenhywfar::gui-cpp)
  add_library(gwenhywfar::gui-cpp UNKNOWN IMPORTED)
  set_target_properties(gwenhywfar::gui-cpp PROPERTIES
    IMPORTED_LOCATION "${GWENGUI_CPP_LIBRARIES}"
    INTERFACE_INCLUDE_DIRECTORIES "${GWENGUI_CPP_INCLUDE_DIRS}"
    INTERFACE_LINK_LIBRARIES gwenhywfar::core
  )
endif()

set(GWENGUI_CPP_LIBRARIES ${GWENGUI_CPP_LIBRARIES} ${GWENHYWFAR_LIBRARIES})
mark_as_advanced( GWENGUI_CPP_INCLUDE_DIRS GWENGUI_CPP_LIBRARIES )
