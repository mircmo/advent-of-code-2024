from collections import Set

@value
struct Direction:
    var horizontal: Int
    var vertical: Int

    fn __add__(self, rhs: Tuple[Int, Int]) -> Tuple[Int, Int]:
        (x, y) = rhs
        return (self.horizontal + x, self.vertical + y)

var direction_map = List(
    Direction(0, -1), # up
    Direction(1, 0),  # right
    Direction(0, 1),  # down 
    Direction(-1, 0), # left
)

fn main() raises:
    field = List[String]()
    with open("./day6.txt", "r") as data:
        field = data.read().splitlines()
    
    var current_pos = (-1, -1)
    var visited_positios = Set[String]()

    for y in range(len(field)):
        var x = field[y].find("^")
        if x >= 0:
            current_pos = (x, y)
            visited_positios.add(str(x) + "|" + str(y))
            break

    var current_direction_index = 0
    
    while True:
        var dir = direction_map[current_direction_index]
        (x, y) = dir + current_pos
        if x < 0 or x > (len(field[0]) - 1) or y < 0 or y > (len(field) - 1):
            print(len(visited_positios))
            return
        elif field[y][x] == "#":
            current_direction_index = (current_direction_index + 1) % len(direction_map)
        else:
            current_pos = (x, y)
            visited_positios.add(str(x) + "|" + str(y))
