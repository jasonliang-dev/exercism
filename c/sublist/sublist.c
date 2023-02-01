#include "sublist.h"
#include <string.h>

#define bool int
#define true 1
#define false 0

static bool list_contains(int *lhs, size_t lhs_len, int *rhs, size_t rhs_len) {
    if (rhs_len == 0) {
        return true;
    }

    for (size_t i = 0; i < lhs_len - rhs_len + 1; i++) {
        if (lhs[i] == rhs[0]) {
            for (size_t j = 1; j < rhs_len; j++) {
                if (lhs[i + j] != rhs[j]) {
                    goto next;
                }
            }

            return true;

            next:;
        }
    }

    return false;
}

comparison_result_t check_lists(int *list_to_compare, int *base_list,
                                size_t list_to_compare_element_count,
                                size_t base_list_element_count) {
    if (list_to_compare_element_count == base_list_element_count) {
        return memcmp(list_to_compare, base_list, sizeof(int) * base_list_element_count) == 0 ? EQUAL : UNEQUAL;
    }

    if (list_to_compare_element_count > base_list_element_count) {
        return list_contains(list_to_compare, list_to_compare_element_count, base_list, base_list_element_count) ? SUPERLIST : UNEQUAL;
    }

    if (base_list_element_count > list_to_compare_element_count) {
        return list_contains(base_list, base_list_element_count, list_to_compare, list_to_compare_element_count) ? SUBLIST : UNEQUAL;
    }

    return UNEQUAL;
}