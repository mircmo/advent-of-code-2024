from collections import Dict


fn calculate_count_cached(
    num: Int, generations: Int, inout cache: Dict[String, Int]
) raises -> Int:
    var key = str(num) + "|" + str(generations)
    if key in cache:
        return cache[key]
    else:
        var result = 0
        if generations == 0:
            return 1
        elif num == 0:
            result = calculate_count_cached(1, generations - 1, cache)
        elif (ln := len((word := str(num)))) % 2 == 0:
            var a = word[: ln // 2]
            var b = word[(ln // 2) :]
            result = calculate_count_cached(
                int(a), generations - 1, cache
            ) + calculate_count_cached(int(b), generations - 1, cache)
        else:
            result = calculate_count_cached(num * 2024, generations - 1, cache)
        cache[key] = result
        return result


fn main() raises:
    with open("./day11.txt", "r") as data:
        var line = data.read()
        var nums_str = line.split(" ")
        var total_p1 = 0
        var total_p2 = 0
        var cache = Dict[String, Int]()
        for num in nums_str:
            total_p1 += calculate_count_cached(int(num[]), 25, cache)
            total_p2 += calculate_count_cached(int(num[]), 75, cache)
        print(total_p1)
        print(total_p2)
