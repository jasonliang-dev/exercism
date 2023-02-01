#include "binary.h"

int convert(const char *input) {
    int num = 0;
    while (input[0]) {
        if (input[0] == '0') {
            num = num << 1;
        } else if (input[0] == '1') {
            num = (num << 1) + 1;
        } else {
            return INVALID;
        }
        input++;
    }

    return num;
}