def canConstructTab(word, array):
    table = [False] * (len(word) + 1)
    table[0] = True

    for i in range(len(table)):
        if table[i] == True:
            for j in array:
                if word[i : i + len(j)] == j:
                    table[i + len(j)] = True

    return table[len(word)]

print(canConstructTab("abcdef", ["ab", "abc", "cd", "def", "abcd"]))
