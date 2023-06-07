def canSumTab(x, array):
    table = [False] * (x+1)
    table[0] = True

    for i in range(len(table)):
        if table[i] == True:
            for num in array:
                if i + num < len(table):
                    table[i + num] = True

    return table[x]

print(canSumTab(10, [3,3,2]))