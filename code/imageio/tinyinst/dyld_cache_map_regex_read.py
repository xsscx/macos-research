#!/usr/bin/env python3

import re

def inspect_dyld_map(file_path):
	# Define regex patterns for matching lines of interest
	framework_pattern = re.compile(r'^/System/Library/(Frameworks|PrivateFrameworks)/([^/]+/)*[^/]+\.framework')
	dylib_pattern = re.compile(r'^/usr/lib/(swift/)?[^/]+\.dylib$')
	segment_pattern = re.compile(r'^\s*(__TEXT|__DATA_CONST|__AUTH_CONST|__DATA|__LINKEDIT|__AUTH|__DATA_DIRTY|__SHARED_CACHE|__FONT_DATA|__CTF|__GLSLBUILTINS|__INFO_FILTER)\s+0x[A-Fa-f0-9]+\s+->\s+0x[A-Fa-f0-9]+')
	
	with open(file_path, 'r') as file:
		for line in file:
			if framework_pattern.match(line):
				print(f"Framework found: {line.strip()}")
			elif dylib_pattern.match(line):
				print(f"Dylib found: {line.strip()}")
			elif segment_pattern.match(line):
				print(f"Segment found: {line.strip()}")
				
if __name__ == "__main__":
	dyld_map_file_path = "/System/Volumes/Preboot/Cryptexes/OS/System/Library/dyld/dyld_shared_cache_arm64e.map"
	inspect_dyld_map(dyld_map_file_path)
	
