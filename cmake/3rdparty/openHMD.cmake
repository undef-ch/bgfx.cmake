# bgfx.cmake - bgfx building in cmake
# Written in 2016 by Joshua Brookover <josh@jalb.me>

# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty.

# You should have received a copy of the CC0 Public Domain Dedication along with
# this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

if( TARGET openHMD )
	return()
endif()

###################################

find_library(HIDAPI_LIBRARY
	NAMES hidapi hidapi-libusb)

find_path(HIDAPI_INCLUDE_DIR
	NAMES hidapi.h
	PATH_SUFFIXES
	hidapi)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(HIDAPI
	DEFAULT_MSG
	HIDAPI_LIBRARY
	HIDAPI_INCLUDE_DIR)

if(HIDAPI_FOUND)
	set(HIDAPI_LIBRARIES "${HIDAPI_LIBRARY}")

	set(HIDAPI_INCLUDE_DIRS "${HIDAPI_INCLUDE_DIR}")
endif()

mark_as_advanced(HIDAPI_INCLUDE_DIR HIDAPI_LIBRARY)

###############################

file( GLOB OPENHMD_SOURCES ${BGFX_DIR}/3rdparty/openHMD/src/*.c ${BGFX_DIR}/3rdparty/openHMD/src/drv_dummy/*.c ${BGFX_DIR}/3rdparty/openHMD/src/drv_oculus_rift/*.c )

add_library( openHMD STATIC ${OPENHMD_SOURCES} )
target_compile_definitions( openHMD PRIVATE "-DDRIVER_OCULUS_RIFT")
target_include_directories( openHMD PUBLIC ${BGFX_DIR}/3rdparty/openHMD/include ${HIDAPI_INCLUDE_DIR})
target_link_libraries( openHMD PUBLIC ${HIDAPI_LIBRARY})
set_target_properties( openHMD PROPERTIES FOLDER "bgfx/3rdparty" )
set_target_properties( openHMD PROPERTIES LINKER_LANGUAGE CXX )
