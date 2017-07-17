local libLocations = {
	windows	= "src/lib/public",
	macosx	= "src/lib/public/osx32",
	linux	= "src/lib/public/linux32"
}

local osDefinition = {
	windows	= { "WIN32", "_DLL_EXT=dll" },
	macosx	= { "POSIX", "_POSIX", "GNUC", "OSX", "_DLL_EXT=dylib", "NO_MALLOC_OVERRIDE" },
	linux	= { "POSIX", "_POSIX", "LINUX", "_LINUX", "GNUC", "_DLL_EXT=so", "NO_MALLOC_OVERRIDE" }
}

libdirs(libLocations[os.get()])
defines(osDefinition[os.get()])
