from collections import Set, Dict
from common import Vec2d, within_bounds


fn main() raises:
    field = List[String]()
    with open("./day8.txt", "r") as data:
        field = data.read().splitlines()

    var towers = Dict[String, List[Vec2d]]()
    var antinode_positios_p1 = Set[String]()
    var antinode_positios_p2 = Set[String]()

    for y in range(len(field)):
        for x in range(len(field[y])):
            if (char := field[y][x]) != ".":
                var entry = towers.setdefault(char, List[Vec2d]())
                entry[].append(Vec2d(x, y))

    for entry in towers.items():
        var positions = entry[].value
        for i in range(len(positions) - 1):
            var pos_a = positions[i]
            for pos_b in positions[i + 1 :]:
                var diff = pos_a - pos_b[]
                anti_n1 = pos_a + diff
                anti_n2 = pos_b[] - diff
                if within_bounds(field, anti_n1):
                    antinode_positios_p1.add(str(anti_n1))
                if within_bounds(field, anti_n2):
                    antinode_positios_p1.add(str(anti_n2))

                # part two
                next_pos = pos_a
                while within_bounds(field, next_pos):
                    antinode_positios_p2.add(str(next_pos))
                    next_pos = next_pos + diff
                next_pos = pos_b[]
                while within_bounds(field, next_pos):
                    antinode_positios_p2.add(str(next_pos))
                    next_pos = next_pos - diff

    print(len(antinode_positios_p1))
    print(len(antinode_positios_p2))
