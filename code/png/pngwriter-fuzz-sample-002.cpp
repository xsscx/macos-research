// Written by @h02332 
// Quick Fuzzing Test for pngwriter on verious platforms
//
// Compile on macOS:
// clang++ -g -o r2 r2.cpp /usr/local/lib/libPNGwriter.a  -I/opt/homebrew/include/ -I/opt/homebrew/Cellar/freetype/2.13.2/include/freetype2/ -lpng -lz -lfreetype -L/opt/homebrew/lib -L/usr/local/lib/ -I/usr/local/include/
//

#include <pngwriter.h>
#include <math.h>
#include <fstream>
#include <random>

#define PI 3.141592653589793238462643383279

std::random_device rd;
std::mt19937 gen(rd());

// Function to get random values between min and max (inclusive).
double randomValue(double min, double max) {
    std::uniform_real_distribution<> dis(min, max);
    return dis(gen);
}

// Introduce random noise to the image to enhance fuzzing.
void introduceNoise(pngwriter &img, double probability) {
    for(int i = 1; i <= img.getwidth(); i++) {
        for(int j = 1; j <= img.getheight(); j++) {
            if(randomValue(0, 1) < probability) {
                img.plot(i, j, randomValue(0, 1), randomValue(0, 1), randomValue(0, 1));
            }
        }
    }
}

void branch(pngwriter * img, int startx, int starty, double length, double angle, int reclevel, double kl, double kth) {
    int endx = (int) (startx + length * cos(angle));
    int endy = (int) (starty + length * sin(angle));
    
    // Introducing random color variations for more fuzzing
    img->line(startx, starty, endx, endy, randomValue(0, 1), randomValue(0, 1), randomValue(0, 1));

    if (reclevel > 0) {
        int temp = reclevel - 1;
        branch(img, endx, endy, length * kl, angle + kth + randomValue(-0.2, 0.2), temp, kl, kth); // Randomize angle a bit
        branch(img, endx, endy, length * kl, angle - kth + randomValue(-0.2, 0.2), temp, kl, kth);
    }
}

int main() {
    int width, height, recur_max, length0;
    double angle0, kl, kth;

    std::ifstream params("params.txt");
    if (!params.is_open()) {
        printf("Error opening file. Initializing with random parameters.\n");

        width = randomValue(300, 1000);
        height = randomValue(300, 1000);
        recur_max = randomValue(3, 10);
        length0 = randomValue(50, 200);
        angle0 = randomValue(0, 360);
        kl = randomValue(0.5, 0.9);
        kth = randomValue(10, 45);
    } else {
        params >> width >> height >> recur_max >> length0 >> angle0 >> kl >> kth;
        params.close();
    }

    printf("Width: %d\n", width);
    printf("Height: %d\n", height);
    printf("Max recursion: %d\n", recur_max);
    printf("Initial length: %d\n", length0);
    printf("Initial angle: %.2f\n", angle0);
    printf("Length constant: %.2f\n", kl);
    printf("Angle constant: %.2f\n", kth);

    angle0 *= PI / 180.0;
    kth *= PI / 180.0;

    pngwriter img(width, height, 0, "out.png");
    branch(&img, 30, (int)(height/2.0), length0, angle0, recur_max, kl, kth);

    // Introducing noise with 5% probability for each pixel
    introduceNoise(img, 0.05);
    
    img.close();

    printf("Image saved to out.png\n");
    return 0;
}

