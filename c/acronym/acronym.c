#include "acronym.h"
#include <stdlib.h>
#include <ctype.h>

#define bool int
#define true 1
#define false 0

static bool is_wordchar(char c) {
    if ('a' <= c && c <= 'z') {
        return true;
    }

    if ('A' <= c && c <= 'Z') {
        return true;
    }

    if (c == '\'') {
        return true;
    }

    return false;
}

char *abbreviate(const char *phrase) {
    if (phrase == NULL) {
        return NULL;
    }

    char *buf = malloc(2048);
    char *end = buf;

    while (phrase[0]) {
        while (!is_wordchar(phrase[0])) {
            phrase++;
        }
    
        end[0] = toupper(phrase[0]);
        end++;
    
        while (is_wordchar(phrase[0])) {
            phrase++;
        }
    }

    if (end == buf) {
        free(buf);
        return NULL;
    }

    return buf;
}