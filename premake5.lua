local libLocations = {
	windows	= "src/lib/public",
	macosx	= "src/lib/public/osx32",
	linux	= "src/lib/public/linux32"
}

local osDefinition = {
	windows	= { "WIN32" },
	macosx	= { "POSIX", "_POSIX", "LINUX", "_LINUX", "GNUC", "OSX" },
	linux	= { "POSIX", "_POSIX", "LINUX", "_LINUX", "GNUC" }
}

libdirs(libLocations[os.get()])
defines(osDefinition[os.get()])
