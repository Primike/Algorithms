def gridTraveler(x, y, memo = {}):
    key = str(x) + "," + str(y)
    if key in memo:
        return memo[key]

    if x == 0 or y == 0:
        return 0

    if x == 1 and y == 1:
        return 1

    memo[key] = gridTraveler(x - 1, y, memo) + gridTraveler(x, y - 1, memo)
    return memo[key]

print(gridTraveler(1, 1))
print(gridTraveler(18,18))