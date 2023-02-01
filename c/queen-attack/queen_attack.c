#include "queen_attack.h"
#include <stdlib.h>

attack_status_t can_attack(position_t queen_1, position_t queen_2) {
    if (queen_1.row >= 8 || queen_1.column >= 8 || queen_2.row >= 8 || queen_2.column >= 8) {
        return INVALID_POSITION;
    }

    if (queen_1.row == queen_2.row && queen_1.column == queen_2.column) {
        return INVALID_POSITION;
    }

    if (queen_1.row == queen_2.row) {
        return CAN_ATTACK;
    }

    if (queen_1.column == queen_2.column) {
        return CAN_ATTACK;
    }

    int dx = queen_1.column - queen_2.column;
    int dy = queen_1.row - queen_2.row;
    if (abs(dx) == abs(dy)) {
        return CAN_ATTACK;
    }

    return CAN_NOT_ATTACK;
}