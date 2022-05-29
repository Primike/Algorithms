def allConstructTab(word, array):
    table = [ [] * (len(word) + 1) for _ in range(len(word) + 1)]
    table[0] = [[]]

    for i in range(len(word)):
        for j in array:
            if word[i : i + len(j)] == j:
                newCombinations = list(map(lambda x: x + [j], table[i]))
                table[i + len(j)] = table[i + len(j)] + newCombinations
                
    return table[len(word)]


print(allConstructTab("purple", ["purp", "p", "ur", "le", "purpl"]))
