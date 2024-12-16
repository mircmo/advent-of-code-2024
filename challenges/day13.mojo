from python import Python, PythonObject


fn main() raises:
    re = Python.import_module("re")
    # np = Python.import_module("numpy")
    var pattern = re.compile(
        r"(?:Button A\: X\+(\d+), Y\+(\d+)\n)(?:Button B\: X\+(\d+),"
        r" Y\+(\d+)\n)Prize: X=(\d+), Y=(\d+)"
    )

    var total = 0
    with open("./day13.txt", "r") as data:
        for rmatch in pattern.finditer(data.read()):
            for i in range(100):
                for j in range(100):
                    var x1 = int(str(rmatch.group(1)))
                    var y1 = int(str(rmatch.group(2)))
                    var x2 = int(str(rmatch.group(3)))
                    var y2 = int(str(rmatch.group(4)))
                    var prize_x = int(str(rmatch.group(5)))
                    var prize_y = int(str(rmatch.group(6)))

                    if (
                        x1 * i + x2 * j == prize_x
                        and y1 * i + y2 * j == prize_y
                    ):
                        total += 3 * i + j

            # Since this is just a linear equation, I just wanted to solve it as one, using numpy
            # This worked for the example input, but I think there are some problems with converting from floats to ints
            # and stuff like that. I tried to fix them, but it didn't work for the whole input.
            # So I just stuck with the most primitive approach above...
            # But for part two, I would need the solution below, but it doesn't work

            # equations = np.array(
            #     [PythonObject([x1, x2]), PythonObject([y1, y2])]
            # )
            # solutions = np.array([prize_x, prize_y])

            # res = np.linalg.solve(equations, solutions)
            # # print(res)
            # if not np.allclose(res, np.rint(res)):
            #     continue
            # res = res.astype(np.int32).tolist()

            # if not res:
            #     continue
            # var a = int(res[0])
            # var b = int(res[1])
            # if a > 100 or b > 100:
            #     continue
            # total += 3 * a + b

    print(total)
