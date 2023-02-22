def fibonacci(target, memo = {}):
    if target in memo:
        return memo[target]
    if target <= 2:
        return 1
        
    memo[target] = fibonacci(target - 1, memo) + fibonacci(target - 2, memo)
    return memo[target]

print(fibonacci(5))
print(fibonacci(10))