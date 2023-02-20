def gridTraveler(x, y, memo = {}):
    if (x, y) in memo:
        return memo[(x, y)]
    if x == 0 or y == 0:
        return 0
    if x == 1 and y == 1:
        return 1

    memo[(x, y)] = gridTraveler(x - 1, y, memo) + gridTraveler(x, y - 1, memo)
    return memo[(x, y)]

print(gridTraveler(1, 1))
print(gridTraveler(18,18))