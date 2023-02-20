def bestSum(x, array, memo = {}):
    if x in memo:
        return memo[x]
    if x < 0:
        return False
    if x == 0:


print(bestSum(100, [1,2,5,25]))