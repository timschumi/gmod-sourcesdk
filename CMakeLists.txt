cmake_minimum_required(VERSION 3.12)


# Common library directories
if(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
	set(SOURCESDK_LIBLOCATION "${CMAKE_CURRENT_SOURCE_DIR}/src/lib/public")
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
	set(SOURCESDK_LIBLOCATION "${CMAKE_CURRENT_SOURCE_DIR}/src/lib/public/osx32")
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
	set(SOURCESDK_LIBLOCATION "${CMAKE_CURRENT_SOURCE_DIR}/src/lib/public/linux32")
endif()


# Common flags
if(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
	set(SOURCESDK_DEFINES "WIN32" "_DLL_EXT=dll")
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
	set(SOURCESDK_DEFINES "POSIX" "_POSIX" "GNUC" "OSX" "_DLL_EXT=dylib" "NO_MALLOC_OVERRIDE")
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
	set(SOURCESDK_DEFINES "POSIX" "_POSIX" "LINUX" "_LINUX" "GNUC" "_DLL_EXT=so" "NO_MALLOC_OVERRIDE")
endif()


# Prepare list of tier1 sources
set(SOURCESDK_TIER1 "bitbuf" "byteswap" "characterset" "checksum_crc" "checksum_md5" "checksum_sha1" "commandbuffer" "convar"
                    "datamanger" "diff" "generichash" "ilocalize" "interface" "KeyValues" "kvpacker" "lzmaDecoder" "mempool"
                    "memstack" "NetAdr" "newbitbuf" "rangecheckedvar" "reliabletimer" "snappy-sinksource" "snappy-stubs-internal"
                    "snappy" "sparsematrix" "splitstring" "stringpool" "strtools" "tier1" "tokenreader" "uniqueid" "utlbinaryblock"
                    "utlbuffer" "utlstring" "utlsymbol")

if(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
	list(APPEND SOURCESDK_TIER1 "processor_detect")
else()
	list(APPEND SOURCESDK_TIER1 "processor_detect_linux" "qsort_s")
endif()

list(TRANSFORM SOURCESDK_TIER1 PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/src/tier1/")
list(TRANSFORM SOURCESDK_TIER1 APPEND ".cpp")


# tier0
add_library(sdk-tier0 INTERFACE)
target_include_directories(sdk-tier0 INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/src/common")
target_include_directories(sdk-tier0 INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/src/public")
target_include_directories(sdk-tier0 INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/src/public/tier0")
target_link_directories(sdk-tier0 INTERFACE "${SOURCESDK_LIBLOCATION}")
target_link_libraries(sdk-tier0 INTERFACE "tier0")
target_compile_definitions(sdk-tier0 INTERFACE ${SOURCESDK_DEFINES})


# tier1
add_library(sdk-tier1 INTERFACE)
target_include_directories(sdk-tier1 INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/src/common")
target_include_directories(sdk-tier1 INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/src/public")
target_include_directories(sdk-tier1 INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/src/public/tier1")
target_link_libraries(sdk-tier1 INTERFACE "vstdlib")
target_compile_definitions(sdk-tier1 INTERFACE ${SOURCESDK_DEFINES})
target_sources(sdk-tier1 INTERFACE ${SOURCESDK_TIER1})

if(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
	target_link_libraries(sdk-tier1 INTERFACE "ws2_32" "rpcrt4")
endif()

if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
	target_compile_options(sdk-tier1 INTERFRACE "-std=gnu++11")
endif()


# tier2
add_library(sdk-tier2 INTERFACE)
target_include_directories(sdk-tier2 INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/src/common")
target_include_directories(sdk-tier2 INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/src/public")
target_include_directories(sdk-tier2 INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/src/public/tier2")
target_link_directories(sdk-tier2 INTERFACE "${SOURCESDK_LIBLOCATION}")
target_link_libraries(sdk-tier2 INTERFACE "tier2")
target_compile_definitions(sdk-tier2 INTERFACE ${SOURCESDK_DEFINES})


# tier3
add_library(sdk-tier3 INTERFACE)
target_include_directories(sdk-tier3 INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/src/common")
target_include_directories(sdk-tier3 INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/src/public")
target_include_directories(sdk-tier3 INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/src/public/tier3")
target_link_directories(sdk-tier3 INTERFACE "${SOURCESDK_LIBLOCATION}")
target_link_libraries(sdk-tier3 INTERFACE "tier3")
target_compile_definitions(sdk-tier3 INTERFACE ${SOURCESDK_DEFINES})
