include(CMakeFindDependencyMacro)
find_dependency(ZLIB)
if("SCHANNEL" STREQUAL "OPENSSL")
    find_dependency(OpenSSL)
endif()
include("${CMAKE_CURRENT_LIST_DIR}/unofficial-libmariadb-targets.cmake")
