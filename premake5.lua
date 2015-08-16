local libLocations = {
	windows	= "src/lib/public",
	macosx	= "src/lib/public/osx32",
	linux	= "src/lib/public/linux32"
}

libdirs(libLocations[os.get()])
