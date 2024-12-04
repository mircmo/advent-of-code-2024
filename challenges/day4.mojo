fn main() raises:
    field = List[String]()
    with open("./day4.txt", "r") as data:
        var lines = data.read().splitlines()
        for line in lines:
            # Add a padding of 3 empty columns to the right, to avoid bound checks on every damn line
            field.append(line[] + "   ")
        # Add a padding of 3 empty rows to the bottom, for the same reason
        for _ in range(3):
            var l: String = ""
            for _ in field[0]:
                l += " "
            field.append(l)

    var query = "XMAS"
    var query_rev = "SAMX"

    var total = 0
    for y in range(len(field) - 3):
        for x in range(len(field[y]) - 3):
            # Horizontal match
            var h_word = field[y][x : x + len(query)]
            if h_word == query or h_word == query_rev:
                total += 1

            # Vertical match
            var v_word: String = ""
            for i in range(len(query)):
                v_word += field[y + i][x]
            if v_word == query or v_word == query_rev:
                total += 1

            # Diagonal match right and left
            var d_word_r: String = ""
            var d_word_l: String = ""

            for i in range(len(query)):
                d_word_r += (field[y + i][x + i])
                d_word_l += (field[y + i][x - i])

            if d_word_r == query or d_word_r == query_rev:
                total += 1
            if d_word_l == query or d_word_l == query_rev:
                total += 1

    print(total)
