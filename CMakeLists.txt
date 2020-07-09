cmake_minimum_required(VERSION 3.12)

set(SOURCESDK_DEFINES
	"RAD_TELEMETRY_DISABLED"
	"NO_STRING_T"
	"VECTOR"
	"VERSION_SAFE_STEAM_API_INTERFACES"
	"PROTECTED_THINGS_ENABLE"
)

if(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
	list(APPEND SOURCESDK_DEFINES "_DLL_EXT=.dll" "WIN32" "COMPILER_MSVC")
	# TODO: disablewarnings("4324")

	if(${CMAKE_SYSTEM_PROCESSOR} MATCHES "x86")
		list(APPEND SOURCESDK_DEFINES "COMPILER_MSVC32")
		set(SOURCESDK_LIBDIRS "${CMAKE_CURRENT_SOURCE_DIR}/lib/public")
	endif()

	if(${CMAKE_SYSTEM_PROCESSOR} MATCHES "x64")
		list(APPEND SOURCESDK_DEFINES "COMPILER_MSVC64" "PLATFORM_64BITS" "WIN64" "_WIN64")
		set(SOURCESDK_LIBDIRS "${CMAKE_CURRENT_SOURCE_DIR}/lib/public/x64")
	endif()

	if(${CMAKE_BUILD_TYPE} MATCHES "Debug")
		# TODO: linkoptions("/NODEFAULTLIB:\"libcmt\"")
	endif()
endif()

if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
	# TODO: Linux disablewarnings
	# - "unused-local-typedefs"
	# - "unused-parameter"
	# - "strict-aliasing"
	# - "unknown-pragmas"
	# - "undef"
	# - "ignored-attributes"
	# - "invalid-offsetof"

	list(APPEND SOURCESDK_DEFINES
		"_DLL_EXT=.so"
		"COMPILER_GCC"
		"POSIX"
		"_POSIX"
		"LINUX"
		"_LINUX"
		"GNUC"
		"SWDS"
	)

	if(${CMAKE_SYSTEM_PROCESSOR} MATCHES "x86")
		set(SOURCESDK_LIBDIRS "${CMAKE_CURRENT_SOURCE_DIR}/lib/public/linux32")
	endif()

	if(${CMAKE_SYSTEM_PROCESSOR} MATCHES "x64")
		list(APPEND SOURCESDK_DEFINES "PLATFORM_64BITS")
		set(SOURCESDK_LIBDIRS "${CMAKE_CURRENT_SOURCE_DIR}/lib/public/linux64")
	endif()
endif()

if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
	# TODO: Darwin disablewarnings
	# - "unused-local-typedefs"
	# - "unused-parameter"
	# - "unused-private-field"
	# - "overloaded-virtual"
	# - "unknown-pragmas"
	# - "unused-variable"
	# - "unknown-warning-option"
	# - "undef"
	# - "expansion-to-defined"
	# - "invalid-offsetof"

	list(APPEND SOURCESDK_DEFINES
		"_DLL_EXT=.dylib"
		"COMPILER_GCC"
		"POSIX"
		"_POSIX"
		"OSX"
		"_OSX"
		"GNUC"
		"_DARWIN_UNLIMITED_SELECT"
		"FD_SETSIZE=10240"
		"OVERRIDE_V_DEFINES"
		"SWDS"
	)

	if(${CMAKE_SYSTEM_PROCESSOR} MATCHES "x86")
		set(SOURCESDK_LIBDIRS "${CMAKE_CURRENT_SOURCE_DIR}/lib/public/osx32")
	endif()

	if(${CMAKE_SYSTEM_PROCESSOR} MATCHES "x64")
		list(APPEND SOURCESDK_DEFINES "PLATFORM_64BITS")
		set(SOURCESDK_LIBDIRS "${CMAKE_CURRENT_SOURCE_DIR}/lib/public/osx64")
	endif()
endif()

include("cmake_sdk-common.txt")
include("cmake_sdk-tier0.txt")
# TODO: include("tier1")
# TODO: include("tier2")
# TODO: include("tier3")
# TODO: include("mathlib")
# TODO: include("raytrace")
# TODO: include("bitmap")
# TODO: include("vtf")
# TODO: include("steam_api")
# TODO: include("utils/lzma/C")

