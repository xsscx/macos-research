import random
import sys

def fuzz(data):
    # Bit flipping
    if random.choice([True, False]):
        idx = random.randint(0, len(data) - 1)
        bit = 1 << random.randint(0, 7)
        data[idx] ^= bit
    
    # Random insertion
    if random.choice([True, False]):
        idx = random.randint(0, len(data) - 1)
        data.insert(idx, random.randint(0, 255))
    
    # Random deletion
    if random.choice([True, False]):
        idx = random.randint(0, len(data) - 1)
        del data[idx]
    
    return data

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python fuzzer.py <input_file> <output_file>")
        sys.exit(1)

    with open(sys.argv[1], 'rb') as f:
        data = list(f.read())
    
    fuzzed_data = fuzz(data)
    
    with open(sys.argv[2], 'wb') as f:
        f.write(bytes(fuzzed_data))
