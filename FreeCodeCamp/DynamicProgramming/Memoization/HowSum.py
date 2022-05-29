def howSum(x, array, memo = {}):
    if x in memo:
        return memo[x]
    if x == 0:
        return []
    if x < 0:
        return None
    
    for i in array:
        result = howSum(x - i, array)
        if result != None:
            memo[x] = [*result, i]
            return memo[x]

    memo[x] = None
    return None


print(howSum(8, [2,3,5]))
print(howSum(1,[4,5,6,7,8,9,10]))
print(howSum(300,[7,14]))