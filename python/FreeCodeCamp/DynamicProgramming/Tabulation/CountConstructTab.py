def countConstructTab(word, array):
    table = [0] * (len(word) + 1)
    table[0] = 1

    for i in range(len(table)):
        for j in array:
            if word[i : i + len(j)] == j:
                table[i + len(j)] += table[i]

    return table[len(word)]


print(countConstructTab("purple", ["purp", "p", "ur", "le", "purpl"]))