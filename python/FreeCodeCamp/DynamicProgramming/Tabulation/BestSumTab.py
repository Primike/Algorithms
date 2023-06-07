def bestSumTab(x, array):
    table = [None] * (x + 1)
    table[0] = []

    for i in range(len(table)):
        if table[i] != None:
            for num in array:
                if i + num < len(table):
                    combination = table[i] + [num]
                    if table[i + num] == None or len(table[i + num]) > len(combination):
                        table[i+ num] = combination

    return table[x]

print(bestSumTab(8, [2,3,5]))
print(bestSumTab(100, [1,2,5,25]))