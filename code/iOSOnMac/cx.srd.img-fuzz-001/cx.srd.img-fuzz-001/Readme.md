# iOS PoC Image Fuzzer

Last Updated: February 18, 2024, 0000Z

This code is a stand-alone Image Fuzzer for XNU Research.

- This was built as a Cross Check for various Pixel functions
- Stand alone iOS App, command line with a default storyboard
- Xcode Project .. ready to compile...

## Trophy Case
- CVE-2023-46602 https://nvd.nist.gov/vuln/detail/CVE-2023-46602
- CVE-2023-46603 https://nvd.nist.gov/vuln/detail/CVE-2023-46603
- CVE-2023-46866 https://nvd.nist.gov/vuln/detail/CVE-2023-46866
- CVE-2023-46867 https://nvd.nist.gov/vuln/detail/CVE-2023-46867
- CVE-2023-47249 https://nvd.nist.gov/vuln/detail/CVE-2023-47249
- CVE-2023-48736 https://nvd.nist.gov/vuln/detail/CVE-2023-48736
- libAppleEXR - Abort()  https://github.com/xsscx/macos-research/blob/main/code/imageio/crashes/libAppleEXR-discussion-analysis.md
## References
- https://github.com/InternationalColorConsortium/DemoIccMAX/pull/53
- https://github.com/InternationalColorConsortium/DemoIccMAX/issues/54
- https://github.com/InternationalColorConsortium/DemoIccMAX/issues/58
- https://raw.githubusercontent.com/xsscx/macos-research/main/code/imageio/crashes/crash-function-YCCAtoRGBA-libappleexr-sample-001.txt

## Thanks
```
Argyll CMS change log
Version 3.0.3
-------------

* Changed ICC profile serialization of pure ASCII text tags
  emit a warning rather than error if they are fed non-ASCII utf8 input.

* Made icc code a little more robust against bad profiles.
  (Thanks to David Hoyt).

Version 3.0.2  23 October 2023
```
## Background
I had been using Jackalope for Fuzzing and to confirm that it could find easy to identify Bugs.  Looking deeper I found AUF, OOB, NPTR and other issues that concealed Bugs.

This code provides the basis for anyone to take and begin their own exploration of the XNU Image & Video Handling Code, whihc offer a massicve opportunity to find Bugs that may not yet be known to Apple :-)

Have Fun!!!
