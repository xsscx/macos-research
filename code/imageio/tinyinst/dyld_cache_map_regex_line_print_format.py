#!/usr/bin/env python3

import re

pattern = (
	r'^/System/Library/(Frameworks|PrivateFrameworks)/([^/]+/)*[^/]+\.framework'
	r'(/Versions/[^/]+(/([^/]+/)*[^/]+)?)?$'
	# Match dylibs in /usr/lib, including Swift libraries and /usr/lib/dyld
	r'|^/usr/lib/(swift/)?[^/]+\.dylib$'
	r'|^/usr/lib/dyld$'
	# Match system libraries under /usr/lib/system
	r'|^/usr/lib/system/[^/]+\.dylib$'
	# Correctly matched segment names with memory addresses
	r'|^(?:__TEXT|__DATA_CONST|__AUTH_CONST|__DATA|__LINKEDIT|__AUTH|__DATA_DIRTY'
	r'|__SHARED_CACHE|__FONT_DATA|__CTF|__GLSLBUILTINS|__INFO_FILTER) 0x[A-Fa-f0-9]+ -> 0x[A-Fa-f0-9]+$'
	# Match memory mappings
	r'|^(mapping\s+)(EX|RW|RO) \d+MB 0x[A-Fa-f0-9]+ -> 0x[A-Fa-f0-9]+$'
	# Match empty lines
	r'|^$'
)

for line in pattern:
	if not re.compile(pattern):
		print(f"Invalid line format: {line}")
	else:
		print(f"Valid line format: {line}")

try:
	compiled_pattern = re.compile(pattern)
	print("The regex pattern is syntactically correct.")
except re.error as err:
	print(f"Syntax error in the regex pattern: {err}")
	

	
