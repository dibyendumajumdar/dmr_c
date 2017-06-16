#ifndef DMR_C_LLVM_H
#define DMR_C_LLVM_H

#include <dmr_c.h>
#include <llvm-c/Core.h>
#include <port.h>

#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

extern bool dmrC_llvmcompile(int argc, char **argv, LLVMModuleRef module,
			     const char *inputbuffer);

#ifdef __cplusplus
}
#endif

#endif
