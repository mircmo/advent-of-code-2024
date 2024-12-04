from collections import Optional


fn main() raises:
    var safe_reports = 0
    with open("./day2.txt", "r") as data:
        var lines = data.read().splitlines()
        for line in lines:
            var nums_str = line[].split(" ")
            var nums = List[Int]()
            for char in nums_str:
                nums.append(int(char[]))
            safe_reports += is_safe(nums)

    print(safe_reports)


def is_safe(nums: List[Int]) -> Int:
    var increasing = False
    for i in range(len(nums) - 1):
        var a = nums[i]
        var b = nums[i + 1]
        var diff = a - b

        if abs(diff) > 3 or diff == 0:
            return 0

        if i == 0:
            increasing = diff < 0
        if (diff < 0) != increasing:
            return 0
    return 1
