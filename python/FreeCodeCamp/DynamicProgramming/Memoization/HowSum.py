def howSum(target, array, memo = {}):
    if target in memo:
        return memo[target]
    if target == 0:
        return []
    if target < 0:
        return None
    
    for number in array:
        result = howSum(target - number, array)

        if result != None:
            return result + [number]

    memo[target] = None
    return None


print(howSum(8, [2,3,5]))
print(howSum(1,[4,5,6,7,8,9,10]))
print(howSum(30,[7,14]))