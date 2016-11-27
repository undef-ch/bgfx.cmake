# bgfx.cmake - bgfx building in cmake
# Written in 2016 by Joshua Brookover <josh@jalb.me>

# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty.

# You should have received a copy of the CC0 Public Domain Dedication along with
# this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

if( TARGET nvtt )
	return()
endif()

#include( ${BGFX_CMAKE_DIR}/cmake/bx.cmake )

file( GLOB SQUISH_SOURCES ${BGFX_DIR}/3rdparty/nvtt/*.cpp ${BGFX_DIR}/3rdparty/nvtt/bc6h/*.cpp ${BGFX_DIR}/3rdparty/nvtt/bc7/*.cpp ${BGFX_DIR}/3rdparty/nvtt/nvcore/*.cpp ${BGFX_DIR}/3rdparty/nvtt/nvmath/*.cpp ${BGFX_DIR}/3rdparty/nvtt/*.h )
add_library( nvtt STATIC ${SQUISH_SOURCES} )
#MESSAGE("GUGUGGUS" ${BX_DIR})
target_include_directories( nvtt PRIVATE ${BX_DIR}/include )
target_include_directories( nvtt PUBLIC ${BGFX_DIR}/3rdparty/ ${BGFX_DIR}/3rdparty/nvtt )
set_target_properties( nvtt PROPERTIES FOLDER "bgfx/3rdparty" )
