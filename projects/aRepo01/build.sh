#!/bin/bash -eu

# Build your project's libraries
make clean
make CC="$CC" CXX="$CXX" CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS"

# Compile each fuzzing harness
# $CC, $CXX, $CFLAGS, $CXXFLAGS are provided by oss-fuzz
# $LIB_FUZZING_ENGINE links the fuzzing engine
# $OUT is where fuzzer binaries should be placed

$CC $CFLAGS -I. -c harness.c -o harness.o
$CXX $CXXFLAGS $LIB_FUZZING_ENGINE harness.o \
    -L. -lyourlib -o $OUT/harness_fuzzer

# Include seed corpus and dictionaries if available
if [ -d "seeds" ]; then
    cp seeds/* $OUT/ 2>/dev/null || true
fi
