def bestSum(x, array, memo = {}):
    if x in memo:
        return memo[x]
    if x == 0:
        return []
    if x < 0:
        return None
    
    shortest = None

    for i in array:
        remainderCombination = bestSum(x - i, array, memo)
        if remainderCombination != None:
            combination = [*remainderCombination, i]
            if shortest == None or len(combination) < len(shortest):
                shortest = combination

    memo[x] = shortest
    return shortest

print(bestSum(100, [1,2,5,25]))