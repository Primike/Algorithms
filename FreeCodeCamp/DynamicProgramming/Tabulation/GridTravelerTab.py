def gridTravelerTab(x, y):
    table = [ [0] * (x + 1) for _ in range(y + 1)]
    table[1][1] = 1

    for i in range(x + 1):
        for j in range(y + 1):
            current = table[i][j]
            if j+ 1 <= y:
                table[i][j + 1] += current
            if i + 1 <= x:
                table[i + 1][j] += current
    
    return table[x][y]

print(gridTravelerTab(18, 18))
