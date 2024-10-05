### Project Zero Bug 2440 
The was a use-after-free vulnerability in libIPTelephony.dylib inside the SIP message decoder (SipMessageDecoder::decode() function). 

I made some changes to the code and uploaded baseline.cpp 
- https://github.com/xsscx/macos-research/blob/main/code/sipparser/baseline.cpp

- I've made further changes to the Code and written a Test Harness to find more Bugs
- I'll Update the Code and include the Fuzzing Functions in .cpp
- I've found it easier to use LLDB and set Breakpoint and inject to the specific function or args

Google Project Zero wrote code that I've modified for Fuzzing.

- These are all Zero Page Crashes
- Apple has already resolved the Issues, apparently
- Note that Zero Page Crashes on a Destructor typically are just NULL and Noise.
- Whereas _any_ Crash for a Constructor is probably a Product Defect and/or Security Vulnerability

REPRODUCTION
---------
Compile:
make

Run:
fuzz.sh

##### SipMessageHeader Class Functions and Destructors:
Destructor: SipMessageHeader::~SipMessageHeader()
Constructor: SipMessageHeader::SipMessageHeader(const SipMessageHeader&)
Assignment Operator: SipMessageHeader::operator=(const SipMessageHeader&)
##### SipContentType Destructor:
Destructor: SipContentType::~SipContentType()
##### SipContentLength Destructor:
Destructor: SipContentLength::~SipContentLength()
##### SipMultiStringHeader Functions and Destructors:
Destructor: SipMultiStringHeader::~SipMultiStringHeader()
Constructor: SipMultiStringHeader::SipMultiStringHeader(const SipMultiStringHeader&)
Assignment Operator: SipMultiStringHeader::operator=(const SipMultiStringHeader&)
Function: SipMultiStringHeader::encodeValue(ImsOutStream&) const
##### SipSingleStringHeader Destructor:
Destructor: SipSingleStringHeader::~SipSingleStringHeader()
##### libIPTelephony.dylib Functions:
Function: libIPTelephony.dylibims::nextToken(...)
Destructor: libIPTelephony.dylib ImsResult::~ImsResult() + 0x1f
Function: libIPTelephony.dylib SipMessageEncodingMap::copyHeadersFromRequestToResponse(const SipRequest&, SipResponse*, bool) const
Function: SipMessageEncodingMap::decodeHeader(...) const
##### SipTimerContainer Function:
Function: SipTimerContainer::cancelAllTimers()
##### SipTcpConnection Destructor:
Destructor: SipTcpConnection::~SipTcpConnection()
