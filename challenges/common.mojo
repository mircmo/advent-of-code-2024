@value
@register_passable("trivial")
struct Vec2d(Stringable, EqualityComparable):
    var x: Int
    var y: Int

    fn __init__(inout self, value: Int):
        self.x = value
        self.y = value

    fn __add__(self, rhs: Self) -> Self:
        return Self(self.x + rhs.x, self.y + rhs.y)

    fn __sub__(self, rhs: Self) -> Self:
        return Self(self.x - rhs.x, self.y - rhs.y)

    fn __str__(self) -> String:
        return str(self.x) + "|" + str(self.y)

    fn __eq__(self, rhs: Self) -> Bool:
        return self.x == rhs.x and self.y == rhs.y

    fn __ne__(self, rhs: Self) -> Bool:
        return self.x != rhs.x or self.y != rhs.y

    fn __mul__(self, rhs: Self) -> Self:
        return Self(self.x * rhs.x, self.y * rhs.y)

    fn __floordiv__(self, rhs: Self) -> Self:
        return Self(self.x // rhs.x, self.y // rhs.y)

    fn __mod__(self, rhs: Self) -> Self:
        return Self(self.x % rhs.x, self.y % rhs.y)


fn within_bounds(field: List[String], pos: Vec2d) -> Bool:
    if pos.y < 0 or pos.y >= len(field):
        return False
    return pos.x >= 0 and pos.x < len(field[pos.y])


alias direction_map = List(
    Vec2d(0, -1),  # up
    Vec2d(1, 0),  # right
    Vec2d(0, 1),  # down
    Vec2d(-1, 0),  # left
)
