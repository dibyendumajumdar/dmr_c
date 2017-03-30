#ifndef DMR_C_LLVM_H
#define DMR_C_LLVM_H

#include <llvm-c/Core.h>
#include <port.h>
#include <dmr_c.h>

extern LLVMModuleRef dmrC_llvmcompile(int argc, char **argv, LLVMContextRef context, const char *modulename, const char *inputbuffer);

#endif
