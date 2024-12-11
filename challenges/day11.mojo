fn main() raises:
    with open("./day11.txt", "r") as data:
        var line = data.read()
        var nums_str = line.split(" ")
        var nums = List[Int]()
        for num in nums_str:
            nums.append(int(num[]))

        for _ in range(25):
            var offset = 0
            for i in range(len(nums)):
                var num = nums[i + offset]
                if num == 0:
                    nums[i + offset] = 1
                elif (ln := len((word := str(num)))) % 2 == 0:
                    var a = word[: ln // 2]
                    var b = word[(ln // 2) :]
                    nums[i + offset] = int(a)
                    nums.insert(i + offset + 1, int(b))
                    offset += 1
                else:
                    nums[i + offset] *= 2024
        print(len(nums))
