#!/usr/bin/env python3

import re

pattern = (
	# Match framework paths, including nested frameworks and versions
	r'^/System/Library/(Frameworks|PrivateFrameworks)/([^/]+/)*[^/]+\.framework'
	r'(/Versions/[^/]+(/([^/]+/)*[^/]+)?)?$'
	# Match dylibs in /usr/lib, including Swift libraries and /usr/lib/dyld
	r'|^/usr/lib/(swift/)?[^/]+\.dylib$'
	r'|^/usr/lib/dyld$'
	# Match system libraries under /usr/lib/system
	r'|^/usr/lib/system/[^/]+\.dylib$'
	# Match segment names with memory addresses
	r'|^(?:__TEXT|__DATA_CONST|__AUTH_CONST|__DATA|__LINKEDIT|__AUTH|__DATA_DIRTY'
	r'|__SHARED_CACHE|__FONT_DATA|__CTF|__GLSLBUILTINS|__INFO_FILTER)\s'
	r'0x[A-Fa-f0-9]+ -> 0x[A-Fa-f0-9]+$'
	# Match memory mappings
	r'|^(mapping\s+)(EX|RW|RO)\s+\d+MB\s+0x[A-Fa-f0-9]+ -> 0x[A-Fa-f0-9]+$'
	# Match empty lines
	r'|^$'
	# New pattern component to match the test line structure
    r'|^/System/Volumes/Preboot/Cryptexes/OS/System/Library/dyld/dyld_shared_cache_[A-Za-z0-9_]+\.map$'
	
)

try:
	compiled_pattern = re.compile(pattern)
	print("The enhanced regex pattern is syntactically correct.")
except re.error as err:
	print(f"Syntax error in the enhanced regex pattern: {err}")
	
# Test the enhanced pattern with the previously problematic line
test_line = "/System/Volumes/Preboot/Cryptexes/OS/System/Library/dyld/dyld_shared_cache_arm64e.map"

if compiled_pattern.match(test_line):
	print(f"Valid line format: {test_line}")
else:
	print(f"Invalid line format: {test_line}")
	
