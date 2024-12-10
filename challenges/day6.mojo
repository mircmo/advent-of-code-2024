from collections import Set
from common import Vec2d, direction_map, within_bounds

fn main() raises:
    field = List[String]()
    with open("./day6.txt", "r") as data:
        field = data.read().splitlines()
    
    var current_pos = Vec2d(-1, -1)
    var visited_positios = Set[String]()

    for y in range(len(field)):
        var x = field[y].find("^")
        if x >= 0:
            current_pos = Vec2d(x, y)
            visited_positios.add(str(x) + "|" + str(y))
            break

    var current_direction_index = 0
    
    while True:
        var dir = direction_map[current_direction_index]
        var next_pos = current_pos + dir
        if not within_bounds(field, next_pos):
            print(len(visited_positios))
            return
        elif field[next_pos.y][next_pos.x] == "#":
            current_direction_index = (current_direction_index + 1) % len(direction_map)
        else:
            current_pos = next_pos
            visited_positios.add(str(next_pos))
