# commpage64
Dumps the content of a 64-bit comm page (macOS).

### Sample Session
```
./commpage64
[*] COMM_PAGE_SIGNATURE: commpage 64-bit
[*] COMM_PAGE_VERSION: 3
[*] COMM_PAGE_NCPUS: 8
[*] COMM_PAGE_CACHE_LINESIZE: 128
[*] COMM_PAGE_SCHED_GEN: 0
[*] COMM_PAGE_MEMORY_PRESSURE: 0
[*] COMM_PAGE_SPIN_COUNT: 0
[*] COMM_PAGE_KDEBUG_ENABLE: 0
[*] COMM_PAGE_ATM_DIAGNOSTIC_CONFIG: 0
[*] COMM_PAGE_BOOTTIME_USEC: 1
[*] COMM_PAGE_ACTIVE_CPUS: 8
[*] COMM_PAGE_PHYSICAL_CPUS: 8
[*] COMM_PAGE_LOGICAL_CPUS: 8
[*] COMM_PAGE_MEMORY_SIZE: 17179869184
[*] COMM_PAGE_CPUFAMILY: 0
[*] COMM_PAGE_CPU_CAPABILITIES64:
	MMX: false
	SSE: false
	SSE2: false
	SSE3: true
	Cache32: false
	Cache64: false
	Cache128: true
	FastThreadLocalStorage: true
	SupplementalSSE3: true
	64Bit: true
	SSE4_1: true
	SSE4_2: true
	AES: true
	InOrderPipeline: true
	Slow: true
	UP: false
	NumCPUs: 8
	AVX1_0: true
	RDRAND: true
	F16C: true
	ENFSTRG: false
	FMA: true
	AVX2_0: false
	BMI1: false
	BMI2: true
	RTM: true
	HLE: true
	ADX: false
	RDSEED: false
	MPX: true
	SGX: true
[*] Done dumping comm page.
```
