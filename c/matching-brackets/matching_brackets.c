#include "matching_brackets.h"

bool is_paired(const char *input) {
    char stack[128] = {0};
    char *top = stack;

    while (input[0]) {
        switch (input[0]) {
        case '[':
        case '{':
        case '(':
            top[0] = input[0];
            top++;
            break;
        #define POP_IF(rhs, lhs) \
            case rhs: \
            if (top == stack || top[-1] != lhs) { \
                return false; \
            } \
            top--; \
            break
        POP_IF(']', '[');
        POP_IF('}', '{');
        POP_IF(')', '(');
        }
        input++;
    }

    return top == stack;
}