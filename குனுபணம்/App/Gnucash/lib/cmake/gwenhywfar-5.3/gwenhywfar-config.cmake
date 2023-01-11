
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
        message( WARNING "${_name} required component \"${comp}\" not found")
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

set_and_check(prefix "/c/gcdev64/gnucash/releases/inst")
set_and_check(exec_prefix "${prefix}")
set_and_check(includedir "${prefix}/include")
set_and_check(GWENHYWFAR_INCLUDE_DIRS "${includedir}/gwenhywfar5")
if(WIN32)
    set_and_check(GWENHYWFAR_LIBRARIES "${exec_prefix}/lib/libgwenhywfar.dll.a")
else()
    set_and_check(GWENHYWFAR_LIBRARIES "${exec_prefix}/lib/libgwenhywfar.so.79")
endif()

set(GWENHYWFAR_FOUND TRUE)

# find components
# Only for backwards compatibility. It is recommended to use
# find_package(gwengui-cpp) or
# find_package(gwengui-qt4)

list(FIND GWENHYWFAR_FIND_COMPONENTS "cpp" FIND_GWEN_COMPONENT_CPP)
if ( NOT ${FIND_GWEN_COMPONENT_CPP} EQUAL -1 )
  find_package(gwengui-cpp "5.3.0" EXACT)
  if (gwengui-cpp_FOUND)
    set( GWENHYWFAR_INCLUDE_DIRS ${GWENHYWFAR_INCLUDE_DIRS} ${GWENGUI_CPP_INCLUDE_DIRS} )
    set( GWENHYWFAR_LIBRARIES ${GWENHYWFAR_LIBRARIES} ${GWENGUI_CPP_LIBRARIES} )
    set( GWENHYWFAR_cpp_FOUND true )
  endif()
endif()

list(FIND GWENHYWFAR_FIND_COMPONENTS "qt4" FIND_GWEN_COMPONENT_QT4)
if ( NOT ${FIND_GWEN_COMPONENT_QT4} EQUAL -1 )
  find_package(gwengui-qt4 "5.3.0" EXACT)
  if ( gwengui-qt4_FOUND )
    set( GWENHYWFAR_INCLUDE_DIRS ${GWENHYWFAR_INCLUDE_DIRS} ${gwengui-qt4_INCLUDE_DIRS} )
    set( GWENHYWFAR_LIBRARIES ${GWENHYWFAR_LIBRARIES} ${gwengui-qt4_LIBRARIES} )
    set( GWENHYWFAR_qt4_FOUND true )
  endif()
endif()

list(FIND GWENHYWFAR_FIND_COMPONENTS "qt5" FIND_GWEN_COMPONENT_QT4)
if ( NOT ${FIND_GWEN_COMPONENT_QT5} EQUAL -1 )
  find_package(gwengui-qt5 "5.3.0" EXACT)
  if ( gwengui-qt5_FOUND )
    set( GWENHYWFAR_INCLUDE_DIRS ${GWENHYWFAR_INCLUDE_DIRS} ${gwengui-qt5_INCLUDE_DIRS} )
    set( GWENHYWFAR_LIBRARIES ${GWENHYWFAR_LIBRARIES} ${gwengui-qt5_LIBRARIES} )
    set( GWENHYWFAR_qt5_FOUND true )
  endif()
endif()

check_required_components(GWENHYWFAR)

# The target is available since gwenhywfar 4.15.3
if(GWENHYWFAR_FOUND AND NOT TARGET gwenhywfar::core)
  add_library(gwenhywfar::core UNKNOWN IMPORTED)
  set_target_properties(gwenhywfar::core PROPERTIES
    IMPORTED_LOCATION "${GWENHYWFAR_LIBRARIES}"
    INTERFACE_INCLUDE_DIRECTORIES "${GWENHYWFAR_INCLUDE_DIRS}"
  )
endif()

mark_as_advanced( GWENHYWFAR_INCLUDE_DIRS GWENHYWFAR_LIBRARIES )
