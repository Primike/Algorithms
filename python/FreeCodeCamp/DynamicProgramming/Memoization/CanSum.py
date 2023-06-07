def canSum(target, array, memo = {}):
    if target in memo:
        return memo[target]
    if target < 0:
        return False
    if target == 0:
        return True

    for number in array:
        if canSum(target - number, array):
            return True
    
    memo[target] = False
    return False

print(canSum(27, [1,3,5]))
print(canSum(1000, [3,3]))