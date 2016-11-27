# bgfx.cmake - bgfx building in cmake
# Written in 2016 by Joshua Brookover <josh@jalb.me>

# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty.

# You should have received a copy of the CC0 Public Domain Dedication along with
# this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

if( TARGET squish )
	return()
endif()

file( GLOB SQUISH_SOURCES ${BGFX_DIR}/3rdparty/libsquish/*.cpp ${BGFX_DIR}/3rdparty/libsquish/*.h )

add_library( squish STATIC ${SQUISH_SOURCES} )
target_include_directories( squish PUBLIC ${BGFX_DIR}/3rdparty/ )
set_target_properties( squish PROPERTIES FOLDER "bgfx/3rdparty" )
