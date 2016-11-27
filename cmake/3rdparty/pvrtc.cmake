# bgfx.cmake - bgfx building in cmake
# Written in 2016 by Joshua Brookover <josh@jalb.me>

# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty.

# You should have received a copy of the CC0 Public Domain Dedication along with
# this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

if( TARGET pvrtc )
	return()
endif()

file( GLOB ETC_SOURCES ${BGFX_DIR}/3rdparty/pvrtc/*.cpp ${BGFX_DIR}/3rdparty/pvrtc/*.h )

add_library( pvrtc STATIC ${ETC_SOURCES} )
target_include_directories( pvrtc PUBLIC ${BGFX_DIR}/3rdparty/ )
#target_include_directories( edtaa3 PRIVATE ${BX_DIR}/include )
set_target_properties( pvrtc PROPERTIES FOLDER "bgfx/3rdparty" )
