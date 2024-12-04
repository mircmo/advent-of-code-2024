from python import Python


fn main() raises:
    re = Python.import_module("re") 
    var pattern = re.compile(r"mul\((\d{1,3})\,(\d{1,3})\)")

    var total = 0
    with open("./day3.txt", "r") as data:
        for rmatch in pattern.finditer(data.read()):
            var a = str(rmatch.group(1))
            var b = str(rmatch.group(2))
            total += int(a) * int(b)

    print(total)
