// Written by @h023332
// Quick Fuzzing Loops for libpng, pngwriter, ImageMagick and others
// This .cpp targets a quick check to ImageMagick
// Compile with Instrumentation
// clang++ -fprofile-instr-generate -fcoverage-mapping -mllvm -runtime-counter-relocation -g -fsanitize=undefined -O0 -o ballistic-fuzz-sample-001 ballistic-fuzz-sample-001.cpp -std=c++11 `Magick++-config --cppflags --cxxflags --ldflags --libs`
//
//
// Compile with attached zsh script

#include <Magick++.h>
#include <ctime>
#include <sstream>
#include <iostream>
#include <fstream>
#include <sys/stat.h>
#include <cstdlib>
#include <random>

const int MAX_ITERATIONS = 6000000;
const int MAX_RETRIES = 5;

std::random_device rd;
std::mt19937 gen(rd());

void log(const std::string &message) {
    std::ofstream logFile("fuzz_log.txt", std::ios_base::app);
    logFile << message << std::endl;
}

int getRandomValue(int min, int max) {
    std::uniform_int_distribution<> dis(min, max);
    return dis(gen);
}

void applyManipulations(Magick::Image &image) {
    int numManipulations = getRandomValue(1, 5); // Up to 5 random manipulations per image
    for (int i = 0; i < numManipulations; i++) {
        int choice = getRandomValue(0, 4);
        switch (choice) {
            case 0:
                image.flip();
                break;
            case 1:
                image.flop();
                break;
            case 2:
                image.rotate(90.0);
                break;
            case 3:
                image.negate();
                break;
            case 4:
                image.blur(0.5, 2.0);
                break;
            default:
                break;
        }
    }
}

std::string getRandomImageType() {
    std::vector<std::string> imageTypes = {"png", "jpeg", "gif", "tiff", "bmp"};
    return imageTypes[getRandomValue(0, imageTypes.size() - 1)];
}

void ballistic(Magick::Image &image, int currentMaxIter, int currentDepositionSize) {
    int width = getRandomValue(50, 1500);  // Randomize both lower and upper bounds
    int height = getRandomValue(50, 1500);
    int bitDepth;
    int randomChoice = getRandomValue(0, 2);  // 3 choices: 0, 1, and 2
    switch (randomChoice) {
        case 0:
            bitDepth = 8;
            break;
        case 1:
            bitDepth = 16;
            break;
        case 2:
            bitDepth = 32;
            break;
    }

    Magick::Color particleColor(getRandomValue(0, 65535), getRandomValue(0, 65535), getRandomValue(0, 65535));
    image.strokeColor(particleColor);

    currentDepositionSize = std::min(currentDepositionSize, width - 10);
    image.draw(Magick::DrawableLine(width / 2.0 - currentDepositionSize / 2.0, height / 2.0, width / 2.0 + currentDepositionSize / 2.0, height / 2.0));

    for (int iii = 0; iii < currentMaxIter; iii++) {
        int rr = getRandomValue(0, width - 1);
        for (int rrr = getRandomValue(height - 1, 1); rrr > 0; rrr--) {
            if (image.pixelColor(rr, rrr) == particleColor) {
                if ((image.pixelColor(rr - 1, rrr) == particleColor) ||
                    (image.pixelColor(rr + 1, rrr) == particleColor) ||
                    (image.pixelColor(rr, rrr - 1) == particleColor)) {
                    image.pixelColor(rr, rrr, particleColor);
                    break;
                }
            }
        }
    }
}

int main(int argc, char **argv) {
    Magick::InitializeMagick(*argv);

    srand(time(NULL));
    const int NUM_IMAGES = 10;

    // Create directory for output images
    std::time_t t = std::time(nullptr);
    char dirNameCStr[100];
    strftime(dirNameCStr, sizeof(dirNameCStr), "fuzzing_%Y%m%d%H%M%S", std::localtime(&t));
    std::string dirName = dirNameCStr;
    mkdir(dirName.c_str(), 0777);

    for (int i = 0; i < NUM_IMAGES; i++) {
        int width = 300 + getRandomValue(0, 1200);
        int height = 300 + getRandomValue(0, 1200);
        int bitDepth = (getRandomValue(0, 1) == 0) ? 8 : 16;
        int depositionSize = 50 + getRandomValue(0, width / 2);  // Larger initial size
        int maxIter = MAX_ITERATIONS + getRandomValue(0, 4000);  // Increased iterations

        std::stringstream filename;
        filename << dirName << "/ballistic_" << i << ".png";

        int retries = MAX_RETRIES;
        while (retries--) {
            try {
                Magick::Image image(Magick::Geometry(width, height), Magick::Color(0, 0, 0));
                image.depth(bitDepth);
                        
                // Varying the Ballistic Deposition parameters
                ballistic(image, maxIter, depositionSize);

                if (image.type() == Magick::PaletteType && !image.isValid()) {
                    std::cerr << "Image is of PaletteType but lacks a valid palette. Skipping." << std::endl;
                } else {
                    std::stringstream logMsgBeforeWrite;
                    logMsgBeforeWrite << "Attempting to write image: " << filename.str() << " with dimensions: " << width << "x" << height << ", bit depth: " << bitDepth << ", deposition size: " << depositionSize << ", max iterations: " << maxIter;
                    log(logMsgBeforeWrite.str());
                    
                    image.write(filename.str());
                }

                std::stringstream logMsg;
                logMsg << "Generated image: " << filename.str() << " with dimensions: " << width << "x" << height << ", bit depth: " << bitDepth << ", deposition size: " << depositionSize << ", max iterations: " << maxIter;
                log(logMsg.str());
                std::cout << logMsg.str() << std::endl;
                        
                // If success, break out of the retry loop
                break;

            } catch (Magick::Exception &error) {
                std::cerr << "Caught ImageMagick exception: " << error.what() << std::endl;
                continue; // Retry with new random parameters
            } catch (std::exception &e) {
                std::cerr << "Caught standard exception: " << e.what() << std::endl;
                break;
            }
        }
    }

    return 0;
}
