from collections import Dict

struct Rule(CollectionElement):
    var before: List[String]
    var after: List[String]

    fn __init__(inout self):
        self.before = List[String]()
        self.after = List[String]()

    fn __copyinit__(inout self, existing: Self):
        self.before = existing.before[:]
        self.after = existing.after[:]

    fn __moveinit__(inout self, owned existing: Self):
        self.before = existing.before
        self.after = existing.after

fn main() raises:
    with open("./day5.txt", "r") as data:
        var rule_collection = Dict[String, Rule]()
        var total = 0

        var rule_part = True
        for line in data.read().splitlines():
            if line[] == "":
                rule_part = False
                continue

            if rule_part:
                var rules = line[].split("|")
                var a = rules[0]
                var b = rules[1]
                var x = rule_collection.setdefault(a, Rule())
                x[].after.append(b)
                var y = rule_collection.setdefault(b, Rule())
                y[].before.append(a)
            else:
                var nums = line[].split(",")

                def function_only_exists_for_control_flow() -> Int:
                    for i in range(len(nums)):
                        var rules = rule_collection.get(nums[i]).value()
                        for before in nums[:i]:
                            if before[] in rules.after:
                                return 0
                        for after in nums[i + 1 :]:
                            if after[] in rules.before:
                                return 0

                    return int(nums[len(nums) // 2])

                total += function_only_exists_for_control_flow()

        print(total)
