def howSumTab(x, array):
    table = [None] * (x + 1)
    table[0] = []
    
    for i in range(len(table)):
        if table[i] != None:
            for num in array:
                if i + num < len(table):
                    table[i + num] = table[i] + [num]

    return table[x]
                    
print(howSumTab(8, [2,3,5]))