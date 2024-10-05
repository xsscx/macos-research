# LLDB reproduction for a heap-buffer-overflow using SockFuzzer 
PoC clusterfuzz-testcase-minimized-net_fuzzer-5484532464222208 with xnu-7195.141.2
------------
```
lldb -- ./net_fuzzer ~/Downloads/clusterfuzz-testcase-minimized-net_fuzzer-5484532464222208
```
lldb
-----
```
(lldb) settings set -- target.run-args  "/Users/xss/Downloads/clusterfuzz-testcase-minimized-net_fuzzer-5484532464222208"
(lldb) r
Process 44876 launched: '/Users/xss/test/SockFuzzer/build/net_fuzzer' (x86_64)
net_fuzzer(44876,0x7ff84cff4340) malloc: nano zone abandoned due to inability to reserve vm space.
INFO: found LLVMFuzzerCustomMutator (0x100010da0). Disabling -len_control by default.
INFO: Running with entropic power schedule (0xFF, 100).
INFO: Seed: 1098174639
INFO: Loaded 2 modules   (127776 inline 8-bit counters): 113111 [0x102185b00, 0x1021a14d7), 14665 [0x100208000, 0x10020b949),
INFO: Loaded 2 PC tables (127776 PCs): 113111 [0x1021a14d8,0x10235b248), 14665 [0x10020b950,0x100244de0),
/Users/xss/test/SockFuzzer/build/net_fuzzer: Running 1 inputs 1 time(s) each.
Running: /Users/xss/Downloads/clusterfuzz-testcase-minimized-net_fuzzer-5484532464222208
mbinit: done [1 MB total pool size, (0/0) split]
dlil_init: All the created dlil kernel threads have been scheduled at least once. Proceeding.
ifnet_attach: All kernel threads created for interface lo0 have been scheduled at least once. Proceeding.
lo0: attached
lo0: attached v2 protocol 2 (count = 1)
ifnet_attach: All kernel threads created for interface stf0 have been scheduled at least once. Proceeding.
stf0: attached
=================================================================
==44876==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x615000004a04 at pc 0x000101e43095 bp 0x7ff7bfefc980 sp 0x7ff7bfefc978
READ of size 4 at 0x615000004a04 thread T0
    #0 0x101e43094 in tcp_ctlinput tcp_subr.c:2340
    #1 0x101d29b55 in icmp_input ip_icmp.c:605
    #2 0x101d2fe46 in ip_proto_dispatch_in ip_input.c:731
    #3 0x101d33915 in ip_input ip_input.c
    #4 0x102058fee in ip_input_wrapper backend.c:158
    #5 0x1000102d0 in DoIp4Packet net_fuzzer.cc:603
    #6 0x100010a1e in DoIpInput net_fuzzer.cc:630
    #7 0x1000138e0 in TestOneProtoInput(Session const&) net_fuzzer.cc:754
    #8 0x10001166d in LLVMFuzzerTestOneInput net_fuzzer.cc:665
    #9 0x10017018a in fuzzer::Fuzzer::ExecuteCallback(unsigned char const*, unsigned long) FuzzerLoop.cpp:599
    #10 0x1001479c4 in fuzzer::RunOneTest(fuzzer::Fuzzer*, char const*, unsigned long) FuzzerDriver.cpp:323
    #11 0x10014cafe in fuzzer::FuzzerDriver(int*, char***, int (*)(unsigned char const*, unsigned long)) FuzzerDriver.cpp:856
    #12 0x10018a969 in main FuzzerMain.cpp:20
    #13 0x7ff8095c741e in start+0x76e (dyld:x86_64+0xfffffffffff6e41e) (BuildId: afa3518c143e3060bbe8624d4ca4106332000000200000000100000000030d00)

0x615000004a04 is located 4 bytes to the right of 256-byte region [0x615000004900,0x615000004a00)
allocated by thread T0 here:
    #0 0x1029014b3 in wrap_posix_memalign+0xb3 (libclang_rt.asan_osx_dynamic.dylib:x86_64h+0x494b3) (BuildId: 756bb7515781379f84412f22c4274ffd2400000010000000000a0a0000030d00)
    #1 0x1020603c5 in mbuf_create mbuf.c:71
    #2 0x102058f00 in get_mbuf_data backend.c:130
    #3 0x100010237 in DoIp4Packet net_fuzzer.cc:598
    #4 0x100010a1e in DoIpInput net_fuzzer.cc:630
    #5 0x1000138e0 in TestOneProtoInput(Session const&) net_fuzzer.cc:754
    #6 0x10001166d in LLVMFuzzerTestOneInput net_fuzzer.cc:665
    #7 0x10017018a in fuzzer::Fuzzer::ExecuteCallback(unsigned char const*, unsigned long) FuzzerLoop.cpp:599
    #8 0x1001479c4 in fuzzer::RunOneTest(fuzzer::Fuzzer*, char const*, unsigned long) FuzzerDriver.cpp:323
    #9 0x10014cafe in fuzzer::FuzzerDriver(int*, char***, int (*)(unsigned char const*, unsigned long)) FuzzerDriver.cpp:856
    #10 0x10018a969 in main FuzzerMain.cpp:20
    #11 0x7ff8095c741e in start+0x76e (dyld:x86_64+0xfffffffffff6e41e) (BuildId: afa3518c143e3060bbe8624d4ca4106332000000200000000100000000030d00)

SUMMARY: AddressSanitizer: heap-buffer-overflow tcp_subr.c:2340 in tcp_ctlinput
Shadow bytes around the buggy address:
  0x1c2a000008f0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
  0x1c2a00000900: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x1c2a00000910: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x1c2a00000920: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x1c2a00000930: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
=>0x1c2a00000940:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x1c2a00000950: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x1c2a00000960: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x1c2a00000970: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x1c2a00000980: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x1c2a00000990: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07
  Heap left redzone:       fa
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Container overflow:      fc
  Array cookie:            ac
  Intra object redzone:    bb
  ASan internal:           fe
  Left alloca redzone:     ca
  Right alloca redzone:    cb
==44876==ABORTING
(lldb) bt
* thread #1, queue = 'com.apple.main-thread', stop reason = Heap buffer overflow
  * frame #0: 0x000000010290bb40 libclang_rt.asan_osx_dynamic.dylib`__asan::AsanDie()
    frame #1: 0x000000010292607f libclang_rt.asan_osx_dynamic.dylib`__sanitizer::Die() + 175
    frame #2: 0x0000000102909da7 libclang_rt.asan_osx_dynamic.dylib`__asan::ScopedInErrorReport::~ScopedInErrorReport() + 1191
    frame #3: 0x000000010290904c libclang_rt.asan_osx_dynamic.dylib`__asan::ReportGenericError(unsigned long, unsigned long, unsigned long, unsigned long, bool, unsigned long, unsigned int, bool) + 1772
    frame #4: 0x000000010290a2c8 libclang_rt.asan_osx_dynamic.dylib`__asan_report_load4 + 40
    frame #5: 0x0000000101e43095 libxnu.dylib`tcp_ctlinput(cmd=8, sa=0x00007ff7bfefca20, vip=0x00006150000049cc, ifp=0x000061f000002a88) at tcp_subr.c:2340:17 [opt]
    frame #6: 0x0000000101d29b56 libxnu.dylib`icmp_input(m=0x0000615000004900, hlen=<unavailable>) at ip_icmp.c:605:4 [opt]
    frame #7: 0x0000000101d2fe47 libxnu.dylib`ip_proto_dispatch_in(m=0x0000615000004900, hlen=<unavailable>, proto=<unavailable>, inject_ipfref=<unavailable>) at ip_input.c:731:3 [opt]
    frame #8: 0x0000000101d33916 libxnu.dylib`ip_input(m=<unavailable>) at ip_input.c:0 [opt]
    frame #9: 0x0000000102058fef libxnu.dylib`ip_input_wrapper(m=<unavailable>) at backend.c:158:3 [opt]
    frame #10: 0x00000001000102d1 net_fuzzer`::DoIp4Packet(packet=0x00006040000162d0) at net_fuzzer.cc:603:3
    frame #11: 0x0000000100010a1f net_fuzzer`::DoIpInput(packet=0x000060300001bb50) at net_fuzzer.cc:630:7
    frame #12: 0x00000001000138e1 net_fuzzer`TestOneProtoInput(session=0x00007ff7bfefe820) at net_fuzzer.cc:754:9
    frame #13: 0x000000010001166e net_fuzzer`::LLVMFuzzerTestOneInput(data="\n\x84\U00000001\n\x81\U00000001\U0000001a\U0000007f\n\U00000017\b\b\U00000010\U00000004\U00000018", size=214) at net_fuzzer.cc:665:1
    frame #14: 0x000000010017018b net_fuzzer`fuzzer::Fuzzer::ExecuteCallback(this=0x0000618000000480, Data="\n\x84\U00000001\n\x81\U00000001\U0000001a\U0000007f\n\U00000017\b\b\U00000010\U00000004\U00000018", Size=214) at FuzzerLoop.cpp:599:15
    frame #15: 0x00000001001479c5 net_fuzzer`fuzzer::RunOneTest(F=0x0000618000000480, InputFilePath="/Users/xss/Downloads/clusterfuzz-testcase-minimized-net_fuzzer-5484532464222208", MaxLen=0) at FuzzerDriver.cpp:323:6
    frame #16: 0x000000010014caff net_fuzzer`fuzzer::FuzzerDriver(argc=0x00007ff7bfeff358, argv=0x00007ff7bfeff350, Callback=(net_fuzzer`::LLVMFuzzerTestOneInput(const uint8_t *, size_t) at net_fuzzer.cc:665))(unsigned char const*, unsigned long)) at FuzzerDriver.cpp:856:9
    frame #17: 0x000000010018a96a net_fuzzer`main(argc=2, argv=0x00007ff7bfeff618) at FuzzerMain.cpp:20:10
    frame #18: 0x00007ff8095c741f dyld`start + 1903
(lldb) fr se 5
warning: libxnu.dylib was compiled with optimization - stepping may behave oddly; variables may not be available.
frame #5: 0x0000000101e43095 libxnu.dylib`tcp_ctlinput(cmd=8, sa=0x00007ff7bfefca20, vip=0x00006150000049cc, ifp=0x000061f000002a88) at tcp_subr.c:2340:17 [opt]
   2337		icp = (struct icmp *)(void *)
   2338		    ((caddr_t)ip - offsetof(struct icmp, icmp_ip));
   2339		th = (struct tcphdr *)(void *)((caddr_t)ip + (IP_VHL_HL(ip->ip_vhl) << 2));
-> 2340		icmp_tcp_seq = ntohl(th->th_seq);
   2341
   2342		inp = in_pcblookup_hash(&tcbinfo, faddr, th->th_dport,
   2343		    ip->ip_src, th->th_sport, 0, NULL);
(lldb)

(lldb) thread info -s
thread #1: tid = 0xb9523, 0x000000010290bb40 libclang_rt.asan_osx_dynamic.dylib`__asan::AsanDie(), queue = 'com.apple.main-thread', stop reason = Heap buffer overflow

{
  "access_size": 4,
  "access_type": 0,
  "address": 106996225296900,
  "description": "heap-buffer-overflow",
  "instrumentation_class": "AddressSanitizer",
  "pc": 4326699157,
  "stop_type": "fatal_error"
}
(lldb) fr se 6
frame #6: 0x0000000101d29b56 libxnu.dylib`icmp_input(m=0x0000615000004900, hlen=<unavailable>) at ip_icmp.c:605:4 [opt]
   602
   603 				lck_mtx_unlock(inet_domain_mutex);
   604
-> 605 				(*ctlfunc)(code, (struct sockaddr *)&icmpsrc,
   606 				    (void *)&icp->icmp_ip, m->m_pkthdr.rcvif);
   607
   608 				lck_mtx_lock(inet_domain_mutex);
(lldb) fr se 7
frame #7: 0x0000000101d2fe47 libxnu.dylib`ip_proto_dispatch_in(m=0x0000615000004900, hlen=<unavailable>, proto=<unavailable>, inject_ipfref=<unavailable>) at ip_input.c:731:3 [opt]
   728 			m_freem(m);
   729 		} else if (!(ip_protox[ip->ip_p]->pr_flags & PR_PROTOLOCK)) {
   730 			lck_mtx_lock(inet_domain_mutex);
-> 731 			pr_input(m, hlen);
   732 			lck_mtx_unlock(inet_domain_mutex);
   733 		} else {
   734 			pr_input(m, hlen);
(lldb) fr se 8
frame #8: 0x0000000101d33916 libxnu.dylib`ip_input(m=<unavailable>) at ip_input.c:0 [opt]
   1739	 * try to reassemble.  Process options.  Pass to next level.
   1740	 */
   1741	void
-> 1742	ip_input(struct mbuf *m)
   1743	{
   1744		struct ip *ip;
   1745		unsigned int hlen;
Note: this address is compiler-generated code in function ip_input that has no source code associated with it.
(lldb) fr se 9
frame #9: 0x0000000102058fef libxnu.dylib`ip_input_wrapper(m=<unavailable>) at backend.c:158:3 [opt]
   155 	}
   156
   157 	__attribute__((visibility("default"))) void ip_input_wrapper(void* m) {
-> 158 	  ip_input((mbuf_t)m);
   159 	}
   160
   161 	__attribute__((visibility("default"))) void ip6_input_wrapper(void* m) {
(lldb) fr se 10
frame #10: 0x00000001000102d1 net_fuzzer`::DoIp4Packet(packet=0x00006040000162d0) at net_fuzzer.cc:603:3
   600 	    return;
   601 	  }
   602
-> 603 	  ip_input_wrapper(mbuf_data);
   604 	}
   605
   606 	void DoIp6Packet(const Ip6Packet &packet)
```

The XNU above is xnu-7195.141.2. Below, we can see the most recent XNU 8792.81.2 with the Fix:
```
	/* Check if we can safely get the sport, dport and the sequence number from the tcp header. */
	if (m == NULL ||
	    (m->m_len < off + (sizeof(unsigned short) + sizeof(unsigned short) + sizeof(tcp_seq)))) {
		/* Insufficient length */
		return;
	}

	th = (struct tcphdr*)(void*)(mtod(m, uint8_t*) + off);
	icmp_tcp_seq = ntohl(th->th_seq);

	inp = in_pcblookup_hash(&tcbinfo, faddr, th->th_dport,
	    ip->ip_src, th->th_sport, 0, NULL);

	if (inp == NULL ||
	    inp->inp_socket == NULL) {
#if SKYWALK
		if (cmd == PRC_MSGSIZE) {
			prctl_ev_val.val = ntohs(icp->icmp_nextmtu);
		}
		prctl_ev_val.tcp_seq_number = icmp_tcp_seq;

		sock_laddr.sin.sin_family = AF_INET;
		sock_laddr.sin.sin_len = sizeof(sock_laddr.sin);
		sock_laddr.sin.sin_addr = ip->ip_src;

		protoctl_event_enqueue_nwk_wq_entry(ifp,
		    (struct sockaddr *)&sock_laddr, sa,
		    th->th_sport, th->th_dport, IPPROTO_TCP,
		    cmd, &prctl_ev_val);
#endif /* SKYWALK */
		return;
	}
```
