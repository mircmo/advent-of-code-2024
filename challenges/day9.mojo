from collections import Optional


fn main() raises:
    var total = 0
    with open("./day9.txt", "r") as data:
        var line = data.read()
        var out_str = List[String]()
        for i in range(len(line)):
            var num = int(line[i])
            for _ in range(num):
                if i % 2 == 0:
                    out_str.append(str(i // 2))
                else:
                    out_str.append(".")

        var r_index = len(out_str) - 1
        for i in range(len(out_str)):
            if out_str[i] == ".":
                while (x := out_str[r_index]) == ".":
                    r_index -= 1
                out_str[i] = x
                r_index -= 1
            var num = int(out_str[i])
            total += i * num
            if r_index <= i:
                break
    print(total)

