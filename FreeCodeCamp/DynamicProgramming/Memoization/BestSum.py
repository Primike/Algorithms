def bestSum(target, array, memo = {}):
    if target in memo:
        return memo[target]
    if target == 0:
        return []
    if target < 0:
        return None
    
    shortest = None

    for number in array:
        result = bestSum(target - number, array, memo)

        if result != None:
            combination = [*result, number]

            if shortest == None or len(combination) < len(shortest):
                shortest = combination

    memo[target] = shortest
    return shortest

print(bestSum(100, [1,2,5,25]))