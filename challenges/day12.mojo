from common import Vec2d, direction_map, within_bounds
from collections import Set


fn fence_region(
    field: List[String],
    current_pos: Vec2d,
    region: String,
    inout visited_positions: List[Vec2d],
) raises -> Int:
    visited_positions.append(current_pos)
    var total = 0

    for dir in direction_map:
        var next_pos = current_pos + dir[]
        if (
            not within_bounds(field, next_pos)
            or field[next_pos.y][next_pos.x] != region
        ):
            # border to different region or map boundry
            total += 1
        elif next_pos not in visited_positions:
            total += fence_region(field, next_pos, region, visited_positions)
    return total


fn main() raises:
    field = List[String]()
    with open("./day12.txt", "r") as data:
        field = data.read().splitlines()

    var total_p1 = 0
    var visited_positions = List[Vec2d]()
    for y in range(len(field)):
        for x in range(len(field[y])):
            var starting_position = Vec2d(x, y)
            if starting_position not in visited_positions:
                var before = len(visited_positions)
                var fences = fence_region(
                    field, starting_position, field[y][x], visited_positions
                )
                total_p1 += fences * (len(visited_positions) - before)

    print(total_p1)
