#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <ctime>
#include <cstdlib>
#include <iomanip>
#include <filesystem>
#include <sstream>

// Constants for Unicode range and number of files/lines for fuzzing
const int UNICODE_START = 0x0000;
const int UNICODE_END = 0x10FFFF;
const int NUM_FILES = 10;
const int LINES_PER_FILE = 1000;

// Check if code point is valid (excluding surrogate pairs and non-characters)
bool isValidUnicode(int codepoint) {
    return !(codepoint >= 0xD800 && codepoint <= 0xDFFF) && 
           !(codepoint >= 0xFDD0 && codepoint <= 0xFDEF) && 
           (codepoint & 0xFFFE) != 0xFFFE;
}

// Convert code point to actual Unicode character
std::string codePointToUTF8(int cp) {
    std::string out;
    if (cp <= 0x7f) {
        out += static_cast<char>(cp);
    } else if (cp <= 0x7ff) {
        out += static_cast<char>((cp >> 6) + 0xc0);
        out += static_cast<char>((cp & 0x3f) + 0x80);
    } else if (0xd800 <= cp && cp <= 0xdfff) {}  // Invalid range
    else if (cp <= 0xffff) {
        out += static_cast<char>((cp >> 12) + 0xe0);
        out += static_cast<char>(((cp >> 6) & 0x3f) + 0x80);
        out += static_cast<char>((cp & 0x3f) + 0x80);
    } else if (cp <= 0x10ffff) {
        out += static_cast<char>((cp >> 18) + 0xf0);
        out += static_cast<char>(((cp >> 12) & 0x3f) + 0x80);
        out += static_cast<char>(((cp >> 6) & 0x3f) + 0x80);
        out += static_cast<char>((cp & 0x3f) + 0x80);
    }
    return out;
}

// Generate random Unicode character
int getRandomUnicode() {
    int codepoint;
    do {
        codepoint = UNICODE_START + rand() % (UNICODE_END - UNICODE_START + 1);
    } while (!isValidUnicode(codepoint));
    return codepoint;
}

int main() {
    srand(time(NULL));

    // Create directory based on current date-time
    std::time_t t = std::time(nullptr);
    std::tm* tm = std::localtime(&t);
    std::ostringstream oss;
    oss << std::put_time(tm, "%Y-%m-%d_%H-%M-%S");
    std::filesystem::create_directory(oss.str());

    // Write all valid Unicode sequences to full-unicode.txt
    std::ofstream unicodeFile(oss.str() + "/full-unicode.txt");
    for (int i = UNICODE_START; i <= UNICODE_END; ++i) {
        if (isValidUnicode(i)) {
            unicodeFile << codePointToUTF8(i) << "\n";
        }
    }
    unicodeFile.close();

    // Generate random Unicode sequences for fuzzing
    for (int i = 0; i < NUM_FILES; ++i) {
        std::ofstream fuzzFile(oss.str() + "/unicode-" + std::to_string(i) + ".txt");
        for (int j = 0; j < LINES_PER_FILE; ++j) {
            fuzzFile << codePointToUTF8(getRandomUnicode()) << "\n";
        }
        fuzzFile.close();
    }

    return 0;
}

