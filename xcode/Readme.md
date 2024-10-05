# Xcode JSON PoC Crasher for DVTFilePathEventWatcher FB9604572

1-Click File Open to Xcode Crash. 
--------
- Did not meet the bar for servicing as a Security Issue, not a surprise == Its just a Null Byte Crash
- Download cx.xss.json-001.zip, unzip and open in Xcode, Recursive DoS with Program Exit. Harmless junk

This PoC is re-gaining traction.... lol.  28 AUGUST 2023

Enjoy!

Reproduction, Download and unzip. Its just JSON Junk, nothing malicious, no external HTTP Connections... 1-Click File Open to Xcode Crash. 

```
Process:               Xcode [23122]
Path:                  /Applications/Xcode.app/Contents/MacOS/Xcode
Identifier:            com.apple.dt.Xcode
Version:               13.0 (19234)
Build Info:            IDEFrameworks-19234000000000000~16 (13A233)
App Item ID:           497799835
App External ID:       844005016
Code Type:             X86-64 (Native)
Parent Process:        ??? [1]
Responsible:           Xcode [23122]
User ID:               501

Date/Time:             2021-09-27 12:10:45.308 -0400
OS Version:            macOS 11.6 (20G165)
Report Version:        12
Bridge OS Version:     5.5 (18P4759a)

Time Awake Since Boot: 37000 seconds
Time Since Wake:       120 seconds

System Integrity Protection: disabled

Crashed Thread:        17  Dispatch queue: DVTFilePathEventWatcher - event queue

Exception Type:        EXC_BAD_ACCESS (SIGBUS)
Exception Codes:       KERN_PROTECTION_FAILURE at 0x0000700006d21fd0
Exception Note:        EXC_CORPSE_NOTIFY

Termination Signal:    Bus error: 10
Termination Reason:    Namespace SIGNAL, Code 0xa
Terminating Process:   exc handler [23122]

VM Regions Near 0x700006d21fd0:
    Stack                    700006c9f000-700006d21000 [  520K] rw-/rwx SM=SHM  thread 16
--> STACK GUARD              700006d21000-700006d22000 [    4K] ---/rwx SM=NUL  stack guard for thread 17
    Stack                    700006d22000-700006da4000 [  520K] rw-/rwx SM=SHM  thread 17
```
