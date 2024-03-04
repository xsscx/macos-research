#!/usr/bin/env python3

import re

pattern = re.compile(r"""
	# Match framework paths, including nested frameworks
	^/System/Library/(Frameworks|PrivateFrameworks)/([^/]+/)*[^/]+\.framework
	(/Versions/[^/]+(/([^/]+/)*[^/]+)?)?$
	
	# Match dylibs in /usr/lib, including Swift libraries and dyld
	| ^/usr/lib/(swift/)?[^/]+\.dylib$
	| ^/usr/lib/dyld$
	
	# Match system libraries under /usr/lib/system
	| ^/usr/lib/system/[^/]+\.dylib$
	
	# Match segment names with memory addresses, ensuring correct space handling
	| ^(?:__TEXT|__DATA_CONST|__AUTH_CONST|__DATA|__LINKEDIT|__AUTH|__DATA_DIRTY
	|__SHARED_CACHE|__FONT_DATA|__CTF|__GLSLBUILTINS|__INFO_FILTER)\s+0x[A-Fa-f0-9]+\s+->\s+0x[A-Fa-f0-9]+$
	
	# Match memory mappings, ensuring correct space handling
	| ^mapping\s+(EX|RW|RO)\s+\d+MB\s+0x[A-Fa-f0-9]+\s+->\s+0x[A-Fa-f0-9]+$
	
	# Match empty lines
	| ^$
""", re.VERBOSE)

test_lines = [
	"/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/LaunchServices",
	"/usr/lib/system/libsystem_blocks.dylib",
	"__TEXT 0x12345678 -> 0x90ABCDEF",
	"mapping RW 64MB 0x10000000 -> 0x14000000",
	"/usr/lib/dyld"
]

for line in test_lines:
	if pattern.match(line):
		print(f"Valid line format: {line}")
	else:
		print(f"Invalid line format: {line}")
		
