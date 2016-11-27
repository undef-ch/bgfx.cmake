# bgfx.cmake - bgfx building in cmake
# Written in 2016 by Joshua Brookover <josh@jalb.me>

# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty.

# You should have received a copy of the CC0 Public Domain Dedication along with
# this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

#include( CMakeParseArguments )

include( ${BGFX_CMAKE_DIR}/cmake/3rdparty/squish.cmake )
include( ${BGFX_CMAKE_DIR}/cmake/3rdparty/iqa.cmake )
include( ${BGFX_CMAKE_DIR}/cmake/3rdparty/nvtt.cmake )
include( ${BGFX_CMAKE_DIR}/cmake/3rdparty/etc1.cmake )
include( ${BGFX_CMAKE_DIR}/cmake/3rdparty/etc2.cmake )
include( ${BGFX_CMAKE_DIR}/cmake/3rdparty/edtaa3.cmake )
include( ${BGFX_CMAKE_DIR}/cmake/3rdparty/pvrtc.cmake )

#PROJECT (texturec CXX)
add_executable(texturec ${BGFX_DIR}/tools/texturec/texturec.cpp ${BGFX_DIR}/src/image.cpp)
#target_compile_definitions( texturec PRIVATE "-D_CRT_SECURE_NO_WARNINGS" )
target_include_directories( texturec PRIVATE ${BGFX_DIR}/src)
set_target_properties( texturec PROPERTIES FOLDER "bgfx/tools" )
target_link_libraries( texturec bx iqa squish nvtt etc1 etc2 edtaa3 pvrtc)
add_dependencies( tools texturec )
