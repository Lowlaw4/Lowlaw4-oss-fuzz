//source: https://appsec.guide/docs/fuzzing/techniques/writing-harnesses/

#include <stdint.h>
#include <stdlib.h>

double divide(uint32_t numerator, uint32_t denominator) {
    // Bug: No check if denominator is zero
    return numerator / denominator;
}
