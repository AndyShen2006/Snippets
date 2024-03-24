#include "Base64-FFI_stub.h"

void haskell_init(int *argc, char ***argv) {
  // int argc = 1
  // char *argv[] = {"GHC Runtime", NULL}; // argv must end with NULL.
  hs_init(argc, argv);
}

void haskell_exit() { hs_exit(); }