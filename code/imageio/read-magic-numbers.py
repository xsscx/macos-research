import os
import logging

# Setup basic logging
logging.basicConfig(level=logging.INFO, format='%(levelname)s: %(message)s')

def get_file_type(magic_bytes, file_content=None):
    """
    Match the magic bytes or content of a file to known file types or specific patterns.
    
    :param magic_bytes: The magic bytes read from a file, as a bytes object.
    :param file_content: Text content read from a file, for formats that require content inspection.
    :return: A string describing the file type, if recognized.
    """
    # Dictionary of file signatures with corresponding file types
    # Place your binary file signatures here
    file_signatures = {
        # Common image formats
        b'\x89PNG\r\n\x1a\n': 'PNG Image',
        b'\xff\xd8\xff\xe0': 'JPEG Image (JFIF format)',
        b'\xff\xd8\xff\xe1': 'JPEG Image (EXIF format)',
        b'\xff\xd8\xff\xe2': 'JPEG Image with ICC Profile',
        b'GIF87a': 'GIF Image (87a format)',
        b'GIF89a': 'GIF Image (89a format)',
        b'BM': 'BMP Image',
        b'II*\x00': 'TIFF Image (little endian)',
        b'MM\x00*': 'TIFF Image (big endian)',
        b'\x00\x00\x01\x00': 'Windows Icon',
        b'\x00\x00\x02\x00': 'Windows Cursor',
        b'8BPS': 'Adobe Photoshop Image',
        b'acsp': 'Standard ICC Profile',
        # APPL specific formats (hypothetical examples)
        b'\x00\x00\x01\xf8': 'APPL Scene Format',
        b'\x00\x00\x02\xec': 'APPL Scene Format (duplicate removed)',
        b'\x00\x00\x00\x14': 'APPL QT Format',
        # Hoyt exploit and fuzzed formats
        b'\x00\x00\x1d\x24': 'HOYT ICC Buffer Overflow Profile',
        b'\x38\x63\x59\x1b': 'HOYT Exploit Format',
        b'\x52\x00\x01\x46': 'HOYT Exploit Format (additional formats consolidated)',
        b'\x1a\x0a\x00\x00': 'HOYT Exploit Format',
        b'\xff\xe0\x46\xae': 'HOYT Exploit Format',
        b'\x52\x5e\x8d\x5c': 'HOYT Exploit Format',
        b'\x01\x49\x46\x46': 'HOYT xIFF Fuzzed Format',
        b'\x52\x49\x46\xb9': 'HOYT xIFF Fuzzed Format',
        b'\x10\x74\xbc\x25': 'HOYT xIFF Fuzzed Format',
        b'\x52\x49\x46\x25': 'HOYT xIFF Fuzzed Format',
        b'\x52\xab\x2a\x46': 'HOYT xIFF Fuzzed Format',
        # Additional common image formats (duplicates and similar entries merged)
        b'\x52\x49\x46\x46': 'RIFF Container (Potential WebP/AVI/WAV)',
        # HEIF and HEIC, based on the 'ftyp' box
        b'\x00\x00\x00\x18\x66\x74\x79\x70\x68\x65\x69\x63': 'HEIC Image Format',
        b'\x00\x00\x00\x18\x66\x74\x79\x70\x6D\x69\x66\x31': 'HEIF Image Format',
        b'\x54\x52\x55\x45\x56\x49\x53\x49\x4F\x4E\x2D\x58\x46\x49\x4C\x45\x2E\x00': 'TGA Image Footer',
        b'FORM': 'IFF File',
        # Custom signatures for non-standard ICC-related formats
        b'\x23\xc9\xae\x19': 'Custom ICC-Related Format',
        b'\x49\xc9\xae\x19': 'Custom ICC-Related Format (duplicate entries removed)',
        b'\x41\xc9\xae\x19': 'Custom ICC-Related Format',
        b'\x4d\xc9\xae\x19': 'Custom ICC-Related Format',
        b'\x44\xc9\xae\x19': 'Custom ICC-Related Format',
        b'\x50\xc9\xae\x19': 'Custom ICC-Related Format',
        b'\x69\xc9\xae\x19': 'Custom ICC-Related Format',
        b'\xab\xc9\xae\x19': 'Custom ICC-Related Format',
        b'\xab\x4b\xae\x19': 'Custom ICC-Related Format',
        b'\x49\x49\xae\x19': 'Custom ICC-Related Format',
    }
    
    # Check binary signatures
    for signature, filetype in file_signatures.items():
        if magic_bytes.startswith(signature):
            return filetype
    
    # Check for specific text-based identifiers if applicable
    if file_content:
        # Add checks for specific text patterns here
        # Example text-based check:
        if '<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB"' in file_content:
            return 'Xcode Interface Builder Cocoa Touch Storyboard'
        # Additional checks can be added here
    
    return 'Unknown file type'

def read_file(file_path, num_bytes=16):
    """
    Read the specified number of bytes from the start of a file for binary signatures,
    and a portion of text for formats requiring content inspection.
    
    :param file_path: Path to the file.
    :param num_bytes: Number of bytes to read for identifying the file type.
    :return: Tuple of (magic_bytes, file_content) where file_content may be None.
    """
    try:
        # Read binary magic bytes
        with open(file_path, 'rb') as file:
            magic_bytes = file.read(num_bytes)
        
        # Attempt to read additional text content for certain formats
        try:
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as file:
                # Read the first chunk of the file as text
                file_content = file.read(1024)  # Adjust size as needed for your checks
        except Exception as e:
            logging.error(f'Error reading text content from file {file_path}: {e}')
            file_content = None
        
        return magic_bytes, file_content
    except Exception as e:
        logging.error(f'Error reading file {file_path}: {e}')
        return None, None

def list_file_types(directory, num_bytes=16):
    """
    List the file types and sizes of all files in a specified directory, sorted by file name,
    including content-based checks for specific formats.
    
    :param directory: Directory to scan for files.
    :param num_bytes: Number of bytes to read for the magic number from each file.
    """
    filenames = sorted(f for f in os.listdir(directory) if os.path.isfile(os.path.join(directory, f)))
    
    for filename in filenames:
        file_path = os.path.join(directory, filename)
        file_size = os.path.getsize(file_path)
        magic_bytes, file_content = read_file(file_path, num_bytes)
        
        if magic_bytes or file_content:
            file_type = get_file_type(magic_bytes, file_content)
            hex_magic = ' '.join(f'{byte:02x}' for byte in magic_bytes) if magic_bytes else 'N/A'
            print(f'{filename} (Size: {file_size} bytes): {hex_magic} ({file_type})')
        else:
            print(f'{filename} (Size: {file_size} bytes): Unable to determine file type.')

# Example usage
directory_path = '/Users/xss/tmp/Jackalope-main/out/samples'  # Update this to the directory you want to scan
list_file_types(directory_path)
