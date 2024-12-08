fn main() raises:
    with open("./day7.txt", "r") as data:
        var lines = data.read().splitlines()
        var total = 0
        for line in lines:
            var res = line[].split(": ")
            var test = int(res[0])
            var nums = List[Int]()
            for num in res[1].split(" "):
                nums.append(int(num[]))
            
            var results = List[Int]()
            for i in range(len(nums) - 1):
                var a = nums[i]
                var b = nums[i + 1]
                if i == 0:
                    results.append(a + b)
                    results.append(a * b)
                    continue
                new_results = List[Int]()
                for j in range(len(results)):
                    new_results.append(results[j] + b)
                    new_results.append(results[j] * b)
                results = new_results
            
            if test in results:
                total += test

        print(total)


