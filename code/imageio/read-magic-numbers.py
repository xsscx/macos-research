#!/usr/bin/env python3

#!/usr/bin/env python3

import os

def get_file_type(magic_bytes):
	"""
	Match the magic bytes of a file to known file types or specific patterns.
	
	:param magic_bytes: The magic bytes read from a file, as a bytes object.
	:return: A string describing the file type, if recognized.
	"""
	file_signatures = {
		b'\x89PNG\r\n\x1a\n': 'PNG Image',
		b'\xff\xd8\xff\xe0': 'JPEG Image',  # Standard JPEG
		b'\xff\xd8\xff\xe1': 'JPEG Image with Exif',  # JPEG with Exif
		b'\xff\xd8\xff\xe2': 'JPEG Image with ICC Profile',  # JPEG with ICC Profile
		b'\x00\x00\x01\xf8': 'APPL Scene Format',  # Apple Scene Format
		b'\x00\x00\x02\xec': 'APPL Scene Format',  # Apple Scene Format
		b'\x00\x00\x00\x14': 'APPL QT Format',  # Apple QT Format
		b'\x00\x00\x1d\x24': 'HOYT ICC Buffer Overflow Profile',  # Hoyt ICC Exploit Format
		b'\x00\x00\x1d\x24': 'HOYT Exploit Format',  # Hoyt Exploit Format
		b'\x38\x63\x59\x1b': 'HOYT Exploit Format',  # Hoyt Exploit Format
		b'\x52\x00\x01\x46': 'HOYT Exploit Format',  # Hoyt Exploit Format
		b'\x1a\x0a\x00\x00': 'HOYT Exploit Format',  # Hoyt Exploit Format
		b'\xff\xe0\x46\xae': 'HOYT Exploit Format',  # Hoyt Exploit Format
		b'\x52\x5e\x8d\x5c': 'HOYT Exploit Format',  # Hoyt Exploit Format
		b'\x01\x49\x46\x46': 'HOYT xIFF Fuzzed Format',  # Hoyt xIFF Exploit Format
		b'\x52\x49\x46\xb9': 'HOYT xIFF Fuzzed Format',  # Hoyt xIFF Exploit Format
		b'\x10\x74\xbc\x25': 'HOYT xIFF Fuzzed Format',  # Hoyt xIFF Exploit Format
		b'\x52\x49\x46\x25': 'HOYT xIFF Fuzzed Format',  # Hoyt xIFF Exploit Format
		b'\x52\x49\x46\xb9': 'HOYT xIFF Fuzzed Format',  # Hoyt xIFF Exploit Format
		b'\x52\xab\x2a\x46': 'HOYT xIFF Fuzzed Format',  # Hoyt xIFF Exploit Format
		b'GIF87a': 'GIF Image',
		b'GIF89a': 'GIF Image',
		b'BM': 'BMP Image',
		b'II*\x00': 'TIFF Image',
		b'MM\x00*': 'TIFF Image',
		b'\x52\x49\x46\x46': 'RIFF Image',
		b'8BPS': 'Adobe Photoshop Image',
		b'\x00\x00\x01\x00': 'ICO Image',
		b'acsp': 'Standard ICC Profile',
		# Custom signatures for non-standard ICC-related formats
		b'\x23\xc9\xae\x19': 'Custom ICC-Related Format',
		b'\x49\xc9\xae\x19': 'Custom ICC-Related Format',
		b'\x41\xc9\xae\x19': 'Custom ICC-Related Format',
		b'\x4d\xc9\xae\x19': 'Custom ICC-Related Format',
		b'\x44\xc9\xae\x19': 'Custom ICC-Related Format',
		b'\x4d\xc9\xae\x19': 'Custom ICC-Related Format',
		b'\x50\xc9\xae\x19': 'Custom ICC-Related Format',
		b'\x69\xc9\xae\x19': 'Custom ICC-Related Format',
		b'\x49\xc9\xae\x19': 'Custom ICC-Related Format',
		b'\xab\xc9\xae\x19': 'Custom ICC-Related Format',
		b'\xab\x4b\xae\x19': 'Custom ICC-Related Format',
		b'\x49\x49\xae\x19': 'Custom ICC-Related Format',
		b'\x00\x00\x1d\x24': 'HOYT ICC Buffer Overflow Profile',  # Hoyt ICC Exploit Format
		b'\x00\x00\x1d\x24': 'HOYT Exploit Format',  # Hoyt Exploit Format
		b'\x38\x63\x59\x1b': 'HOYT Exploit Format',  # Hoyt Exploit Format
		b'\x52\x00\x01\x46': 'HOYT Exploit Format',  # Hoyt Exploit Format
		b'\x1a\x0a\x00\x00': 'HOYT Exploit Format',  # Hoyt Exploit Format
		b'\xff\xe0\x46\xae': 'HOYT Exploit Format',  # Hoyt Exploit Format
		b'\x52\x5e\x8d\x5c': 'HOYT Exploit Format',  # Hoyt Exploit Format
		b'\x01\x49\x46\x46': 'HOYT xIFF Fuzzed Format',  # Hoyt xIFF Exploit Format
		b'\x52\x49\x46\xb9': 'HOYT xIFF Fuzzed Format',  # Hoyt xIFF Exploit Format
		b'\x10\x74\xbc\x25': 'HOYT xIFF Fuzzed Format',  # Hoyt xIFF Exploit Format
		b'\x52\x49\x46\x25': 'HOYT xIFF Fuzzed Format',  # Hoyt xIFF Exploit Format
		b'\x52\x49\x46\xb9': 'HOYT xIFF Fuzzed Format',  # Hoyt xIFF Exploit Format
		b'\x52\xab\x2a\x46': 'HOYT xIFF Fuzzed Format',  # Hoyt xIFF Exploit Format
		
	}
	for signature, filetype in file_signatures.items():
		if magic_bytes.startswith(signature):
			return filetype
	return 'Unknown file type'

def read_magic_bytes(file_path, num_bytes=16):
	"""
	Read the first few bytes from a file to get its magic bytes (file signature).
	
	:param file_path: Path to the file.
	:param num_bytes: Number of bytes to read for the magic number.
	:return: A bytes object containing the magic bytes.
	"""
	try:
		with open(file_path, 'rb') as file:
			magic = file.read(num_bytes)
		return magic
	except Exception as e:
		print(f'Error reading file: {e}')
		return None
	
def list_file_types(directory, num_bytes=16):
	"""
	List the file types of all files in the specified directory based on their magic bytes, sorted by file name.
	
	:param directory: Directory to scan for files.
	:param num_bytes: Number of bytes to read from the start of each file.
	"""
	filenames = [f for f in os.listdir(directory) if os.path.isfile(os.path.join(directory, f))]
	filenames.sort()  # Sort the filenames alphabetically
	
	for filename in filenames:
		file_path = os.path.join(directory, filename)
		magic_bytes = read_magic_bytes(file_path, num_bytes)
		if magic_bytes:
			file_type = get_file_type(magic_bytes)
			hex_magic = ' '.join(f'{byte:02x}' for byte in magic_bytes)
			print(f'{filename}: {hex_magic} ({file_type})')
			
# Example usage:
directory_path = '/Users/xss/tmp/Jackalope-main/out/samples'  # Change this to the directory you want to scan
list_file_types(directory_path)
