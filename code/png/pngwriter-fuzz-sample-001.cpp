// Written by @h02332 for quick Fuzzing for Library Checks across Platforms, this code below is for macOS
// Compile:
// clang++ -std=c++11 -fsanitize=address,undefined -g pngwriter-fuzz-test-1.cpp -o pngwriter-fuzz-test-1 -I/opt/homebrew/Cellar/freetype/2.13.1/include/freetype2/ -I/opt/homebrew/include/ -I/usr/local/include -L/opt/homebrew/lib -L/usr/local/lib -lpng -lpngwriter -lfreetype -ltiff
//

#include <pngwriter.h>
#include <random>
#include <ctime>
#include <sstream>
#include <iostream>
#include <fstream>
#include <sys/stat.h>
#include <cstdlib>

const int MAX_ITERATIONS = 60000000;
std::random_device rd;
std::mt19937 gen(rd());

void log(const std::string &message, std::ofstream &logFile) {
    logFile << message << std::endl;
}

void ballistic(pngwriter &out, int maxIter, int depositionSize) {
    unsigned long int number_particles = 20;

    int width = out.getwidth();
    int height = out.getheight();
    int rrr, iii;

    bool end = 0;

    out.line(width / 2.0 - depositionSize / 2.0, 1, width / 2.0 + depositionSize / 2.0, 1, 65535, 0, 0);

    for (iii = 0; iii < maxIter; iii++) {
        int rr = 1 + (random() % width);
        for (rrr = height; rrr > 0; rrr--) {
            if (out.read(rr, rrr, 1) == 65535) {
                end = 1;
                break;
            }

            if ((out.read(rr - 1, rrr, 1) == 65535) || (out.read(rr + 1, rrr, 1) == 65535) || (out.read(rr, rrr - 1, 1) == 65535)) {
                out.plot(rr, rrr, 65535, 0, 0);
                number_particles++;
                break;
            }
        }

        if (end) {
            break;
        }
    }
}

std::string generateRandomImageName(const std::string &dirName, int uniqueValue) {
    std::stringstream ss;
    ss << dirName << "/ballistic_" << uniqueValue << ".png";
    return ss.str();
}

void createAndSaveRandomImage(const std::string &dirName, std::ofstream &logFile) {
    std::uniform_int_distribution<> sizeDist(300, 1500);
    std::uniform_int_distribution<> bitDist(0, 1);
    std::uniform_int_distribution<> depositionSizeDist(10, sizeDist(gen) / 2);
    std::uniform_int_distribution<> iterDist(0, MAX_ITERATIONS);

    int width = sizeDist(gen);
    int height = sizeDist(gen);
    int bitDepth = bitDist(gen) == 0 ? 8 : 16;
    int depositionSize = depositionSizeDist(gen);
    int maxIter = iterDist(gen);

    std::string filename = generateRandomImageName(dirName, width*height + bitDepth);

    pngwriter out(width, height, 0, filename.c_str());

    if (bitDepth == 8) {
        out.scale_k(1.0 / 256.0);
    }

    ballistic(out, maxIter, depositionSize);
    out.close();

    std::stringstream logMsg;
    logMsg << "Generated image: " << filename << " with dimensions: " << width << "x" << height << ", bit depth: " << bitDepth << ", deposition size: " << depositionSize << ", max iterations: " << maxIter;
    log(logMsg.str(), logFile);
    std::cout << logMsg.str() << std::endl;
}

int main() {
    srand(time(NULL));
    const int NUM_IMAGES = 5;

    // Create directory for output images
    std::time_t t = std::time(nullptr);
    char dirNameCStr[100];
    strftime(dirNameCStr, sizeof(dirNameCStr), "fuzzing_%Y%m%d%H%M%S", std::localtime(&t));
    std::string dirName = dirNameCStr;
    mkdir(dirName.c_str(), 0777);

    std::ofstream logFile("fuzz_log.txt", std::ios_base::app);

    for (int i = 0; i < NUM_IMAGES; i++) {
        createAndSaveRandomImage(dirName, logFile);
    }

    return 0;
}
