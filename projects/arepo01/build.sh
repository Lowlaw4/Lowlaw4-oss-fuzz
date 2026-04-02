#!/bin/bash -eu


# Compile source files with fuzzing instrumentation
$CC $CFLAGS -c $SRC/arepo01/division.c -o division.o
$CC $CFLAGS -c $SRC/harness.c -o harness.o

# Link with libFuzzer
$CXX $CXXFLAGS $LIB_FUZZING_ENGINE \
    division.o harness.o -o $OUT/division_fuzzer

# Optional: include seed corpus if you have one
if [ -d "seeds" ]; then
    cp seeds/* $OUT/ 2>/dev/null || true
fi
