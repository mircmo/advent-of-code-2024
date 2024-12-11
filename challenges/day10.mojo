from common import Vec2d, direction_map, within_bounds
from collections import Set


fn count_complete_branches(
    field: List[String],
    current_pos: Vec2d,
    next_step: Int = 1,
) raises -> Int:
    if next_step == 10:
        return 1
    var branches = 0
    for dir in direction_map:
        var next_pos = current_pos + dir[]
        if within_bounds(field, next_pos) and field[next_pos.y][
            next_pos.x
        ] == str(next_step):
            branches += count_complete_branches(field, next_pos, next_step + 1)
    return branches


fn follow_route(
    field: List[String],
    current_pos: Vec2d,
    next_step: Int,
    inout ends: Set[String],
) raises:
    if next_step == 10:
        ends.add(str(current_pos))
        return
    for dir in direction_map:
        var next_pos = current_pos + dir[]
        if within_bounds(field, next_pos) and field[next_pos.y][
            next_pos.x
        ] == str(next_step):
            follow_route(field, next_pos, next_step + 1, ends)


fn main() raises:
    field = List[String]()
    with open("./day10.txt", "r") as data:
        field = data.read().splitlines()

    var total_p1 = 0
    var total_p2 = 0
    for y in range(len(field)):
        for x in range(len(field[y])):
            if field[y][x] != "0":
                continue

            var starting_position = Vec2d(x, y)
            var ends = Set[String]()
            follow_route(field, starting_position, 1, ends)
            total_p1 += len(ends)

            total_p2 += count_complete_branches(field, starting_position)

    print(total_p1)
    print(total_p2)
