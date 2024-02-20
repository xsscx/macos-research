# XNU Image Fuzzer 

Last Updated: February 20, 2024, 0000Z

This code is a stand-alone Image Fuzzer for XNU Research.

- This was built as a Cross Check for various Pixel functions
- Stand alone iOS App, command line with a default storyboard
- Xcode Project .. ready to compile...
- Got Questions? Open an Issue
- Works on iPad Pro - M2 Chip
- Works on iPhone 12 Pro, 14 Pro Max & 15 Pro Max
- arm64e code for Fuzzing, Learning or Education
 
## Background
I had been using Jackalope for Fuzzing and to confirm that it could find easy to identify Bugs.  Looking deeper I found AUF, OOB, NPTR and other issues that concealed Bugs. 

This Project is for anyone wanting to Learn & Educate on XNU Image Fuzzing. You can use Jackalope with the Example code provided in Imageio, and have your own Stand Alone XNU Image Fuzzer to expand your horizons.

Are you new to XNU? 

This Code is for you!

If you have Questions Open an Issue. This Code is meant to stimulate discussion on the Bugs that can be hit from the Remote, No-Auth position.

### Overview
This is a Stand Alone iOS Proof of Concept Fuzzer for the CreateCG Image context.
The Args passed on Launch are:
- Flowers.exr
- -1

This code provides the basis for anyone to take and begin their own exploration of the XNU Image & Video Handling Code, which offer a massive exploit surface opportunity to find Bugs that may not yet be known to Apple :-)

### XNU Image Fuzzer Pictures
-XNU Image Fuzzer Xcode Sample 1
<img src="https://xss.cx/2024/02/20/img/xnu-image-fuzzer-xcode-sample-screenshot-poc-1.png" alt="XNU Image Fuzzer Xcode View 1" style="height:1100px; width:1500px;"/>
- XNU Image Fuzzer Xcode Sample 2
<img src="https://xss.cx/2024/02/20/img/xnu-image-fuzzer-xcode-sample-screenshot-poc-2.png" alt="XNU Image Fuzzer Xcode View 2" style="height:1100px; width:1500px;"/>
- XNU Image Fuzzer Xcode Sample 3
<img src="https://xss.cx/2024/02/20/img/xnu-image-fuzzer-xcode-sample-screenshot-poc-3.png" alt="XNU Image Fuzzer Xcode View 3" style="height:1100px; width:1500px;"/>
- XNU Image Fuzzer iPhone 14 Pro Max View 1
<img src="https://xss.cx/2024/02/20/img/xnu-image-fuzzer-xcode-sample-screenshot-poc-4.png" alt="XNU Image Fuzzer iPhone 14 Pro Max View 1" style="height:500px; width:400px;"/>

Have Fun!!!
