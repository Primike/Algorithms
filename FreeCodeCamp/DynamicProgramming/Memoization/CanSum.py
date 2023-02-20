def canSum(x, array, memo = {}):
    if x in memo:
        return memo[x]
    if x < 0:
        return False
    if x == 0:
        return True

    for i in array:
        if canSum(x - i, array):
            return True
    
    memo[x] = False
    return False

print(canSum(27, [1,3,5]))
print(canSum(1000, [3,3]))