from common import Vec2d, direction_map, within_bounds
from collections import Set


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

    var total = 0
    for y in range(len(field)):
        for x in range(len(field[y])):
            if field[y][x] != "0":
                continue

            var starting_position = Vec2d(x, y)
            var ends = Set[String]()
            follow_route(field, starting_position, 1, ends)
            total += len(ends)

    print(total)
