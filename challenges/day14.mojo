from python import Python
from common import Vec2d, direction_map, within_bounds


fn main() raises:
    with open("./day14.txt", "r") as data:
        var lines = data.read().splitlines()

        re = Python.import_module("re")
        var pattern = re.compile(r"([\-]?\d+)")

        var robot_positions = List[Vec2d]()
        var duration = 100
        var bounds = Vec2d(101, 103)

        for line in lines:
            var matches = re.findall(pattern, line[])

            var x = int(str(matches[0]))
            var y = int(str(matches[1]))
            var vx = int(str(matches[2]))
            var vy = int(str(matches[3]))

            var start_pos = Vec2d(x, y)
            var velocity = Vec2d(vx, vy)

            var unbound_end_pos = start_pos + (velocity * duration)

            robot_positions.append(unbound_end_pos % bounds)

        var quadrant_bounds = bounds // 2
        var quadrants = List(List(0, 0), List(0, 0))

        for y in range(bounds.y):
            # var line: String = ""
            for x in range(bounds.x):
                var pos = Vec2d(x, y)
                var quadrant_index_vertical = -1
                if pos.y < quadrant_bounds.y:
                    quadrant_index_vertical = 0
                elif pos.y > quadrant_bounds.y:
                    quadrant_index_vertical = 1

                if quadrant_index_vertical < 0:
                    continue

                robot_count = robot_positions.count(pos)

                if pos.x < quadrant_bounds.x:
                    quadrants[quadrant_index_vertical][0] += robot_count
                elif pos.x > quadrant_bounds.x:
                    quadrants[quadrant_index_vertical][1] += robot_count

                # if robot_count > 0:
                #     line += str(robot_count)
                # else:
                #     line += "."
            # print(line)
        total = 1
        for q in quadrants[0] + quadrants[1]:
            total *= q[]

        print(total)
