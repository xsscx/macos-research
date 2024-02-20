# XNU Image Fuzzer

Last Updated: February 18, 2024, 0000Z

This code is a stand-alone Image Fuzzer for XNU Research.

- This was built as a Cross Check for various Pixel functions
- Stand alone iOS App, command line with a default storyboard
- Xcode Project .. ready to compile...

## Background
I had been using Jackalope for Fuzzing and to confirm that it could find easy to identify Bugs.  Looking deeper I found AUF, OOB, NPTR and other issues that concealed Bugs.

### Overview
This is a Stand Alone iOS Proof of Concept Fuzzer for the CreateCG Image context.
The Args passed on Launch are:
- Flowers.exr
- -1

This code provides the basis for anyone to take and begin their own exploration of the XNU Image & Video Handling Code, which offer a massive exploit surface opportunity to find Bugs that may not yet be known to Apple :-)

### XNU Image Fuzzer Pictures
- Xcode Sample 1
<img src="https://xss.cx/2024/02/20/img/xnu-image-fuzzer-xcode-sample-screenshot-poc-1.png" alt="XNU Image Fuzzer PoC" style="height:1100px; width:1500px;"/>
- Xcode Sample 2
<img src="https://xss.cx/2024/02/20/img/xnu-image-fuzzer-xcode-sample-screenshot-poc-2.png" alt="XNU Image Fuzzer PoC" style="height:1100px; width:1500px;"/>

Have Fun!!!
