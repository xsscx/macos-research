#elif defined(TARGET_ARM)
#if defined(__APPLE__)
	typedef ucontext_t arm_ucontext;

	#define UCONTEXT_REG_PC(ctx) (((ucontext_t*)(ctx))->uc_mcontext->__ss.__pc)
	#define UCONTEXT_REG_SP(ctx) (((ucontext_t*)(ctx))->uc_mcontext->__ss.__sp)
	#define UCONTEXT_REG_LR(ctx) (((ucontext_t*)(ctx))->uc_mcontext->__ss.__lr)
	#define UCONTEXT_REG_R0(ctx) (((ucontext_t*)(ctx))->uc_mcontext->__ss.__r[0])
	#define UCONTEXT_REG_R1(ctx) (((ucontext_t*)(ctx))->uc_mcontext->__ss.__r[1])
	#define UCONTEXT_REG_R2(ctx) (((ucontext_t*)(ctx))->uc_mcontext->__ss.__r[2])
	#define UCONTEXT_REG_R3(ctx) (((ucontext_t*)(ctx))->uc_mcontext->__ss.__r[3])
	#define UCONTEXT_REG_R4(ctx) (((ucontext_t*)(ctx))->uc_mcontext->__ss.__r[4])
	#define UCONTEXT_REG_R5(ctx) (((ucontext_t*)(ctx))->uc_mcontext->__ss.__r[5])
	#define UCONTEXT_REG_R6(ctx) (((ucontext_t*)(ctx))->uc_mcontext->__ss.__r[6])
	#define UCONTEXT_REG_R7(ctx) (((ucontext_t*)(ctx))->uc_mcontext->__ss.__r[7])
	#define UCONTEXT_REG_R8(ctx) (((ucontext_t*)(ctx))->uc_mcontext->__ss.__r[8])
	#define UCONTEXT_REG_R9(ctx) (((ucontext_t*)(ctx))->uc_mcontext->__ss.__r[9])
	#define UCONTEXT_REG_R10(ctx) (((ucontext_t*)(ctx))->uc_mcontext->__ss.__r[10])
	#define UCONTEXT_REG_R11(ctx) (((ucontext_t*)(ctx))->uc_mcontext->__ss.__r[11])
	#define UCONTEXT_REG_R12(ctx) (((ucontext_t*)(ctx))->uc_mcontext->__ss.__r[12])
	#define UCONTEXT_REG_CPSR(ctx) (((ucontext_t*)(ctx))->uc_mcontext->__ss.__cpsr)
	#define UCONTEXT_REG_VFPREGS(ctx) (double*)(((ucontext_t*)(ctx))->uc_mcontext->__fs.__r)
