fn main() raises:
    l1 = List[Int]()
    l2 = List[Int]()
    with open("./day1.txt", "r") as data:
        var lines = data.read().splitlines()
        for line in lines:
            var res = line[].split("   ")
            l1.append(int(res[0]))
            l2.append(int(res[1]))
    
    sort(l1)
    sort(l2)

    var total = 0
    for i in range(len(l1)):
        total += abs(l1[i] - l2[i])

    print(total)


