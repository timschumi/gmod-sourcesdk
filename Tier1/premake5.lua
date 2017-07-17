include ".."

includedirs "../src/common"
includedirs "../src/public"
includedirs "../src/public/tier1"

vpaths { Tier1 = "../src/tier1/*.cpp" }

links "vstdlib"

files {
	"../src/tier1/bitbuf.cpp",
	"../src/tier1/byteswap.cpp",
	"../src/tier1/characterset.cpp",
	"../src/tier1/checksum_crc.cpp",
	"../src/tier1/checksum_md5.cpp",
	"../src/tier1/checksum_sha1.cpp",
	"../src/tier1/commandbuffer.cpp",
	"../src/tier1/convar.cpp",
	"../src/tier1/datamanager.cpp",
	"../src/tier1/diff.cpp",
	"../src/tier1/generichash.cpp",
	"../src/tier1/ilocalize.cpp",
	"../src/tier1/interface.cpp",
	"../src/tier1/KeyValues.cpp",
	"../src/tier1/kvpacker.cpp",
	"../src/tier1/lzmaDecoder.cpp",
	"../src/tier1/mempool.cpp",
	"../src/tier1/memstack.cpp",
	"../src/tier1/NetAdr.cpp",
	"../src/tier1/newbitbuf.cpp",
	"../src/tier1/rangecheckedvar.cpp",
	"../src/tier1/reliabletimer.cpp",
	"../src/tier1/snappy-sinksource.cpp",
	"../src/tier1/snappy-stubs-internal.cpp",
	"../src/tier1/snappy.cpp",
	"../src/tier1/sparsematrix.cpp",
	"../src/tier1/splitstring.cpp",
	"../src/tier1/stringpool.cpp",
	"../src/tier1/strtools.cpp",
	"../src/tier1/tier1.cpp",
	"../src/tier1/tokenreader.cpp",
	"../src/tier1/uniqueid.cpp",
	"../src/tier1/utlbinaryblock.cpp",
	"../src/tier1/utlbuffer.cpp",
	"../src/tier1/utlbufferutil.cpp",
	"../src/tier1/utlstring.cpp",
	"../src/tier1/utlsymbol.cpp"
}

filter "system:windows"
	links { "Ws2_32", "Rpcrt4" }
	files "../src/tier1/processor_detect.cpp"
filter "system:linux"
	buildoptions "-std=gnu++11"
filter "system:not windows"
	files {
		"../src/tier1/processor_detect_linux.cpp",
		"../src/tier1/qsort_s.cpp"
	}
filter {}
