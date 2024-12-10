@value
struct Vec2d(Stringable):
    var x: Int
    var y: Int

    fn __add__(self, rhs: Self) -> Self:
        return Self(self.x + rhs.x, self.y + rhs.y)

    fn __sub__(self, rhs: Self) -> Self:
        return Self(self.x - rhs.x, self.y - rhs.y)

    fn __str__(self) -> String:
        return str(self.x) + "|" + str(self.y)

def within_bounds(field: List[String], pos: Vec2d) -> Bool:
    if pos.y < 0 or pos.y >= len(field):
        return False
    return pos.x >= 0 and pos.x < len(field[pos.y])

alias direction_map = List(
    Vec2d(0, -1), # up
    Vec2d(1, 0),  # right
    Vec2d(0, 1),  # down 
    Vec2d(-1, 0), # left
)