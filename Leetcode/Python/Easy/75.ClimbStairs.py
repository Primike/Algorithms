# You are climbing a staircase. It takes n steps to reach the top.

# Each time you can either climb 1 or 2 steps. 
# In how many distinct ways can you climb to the top?

def climbStairs(x, array = [1, 2], memo = {}):
    if x in memo:
        return memo[x]
    if x == 0:
        return 1
    if x < 0:
        return 0

    count = 0

    for i in array:
        y = climbStairs(x - i)
        count = count + y

    memo[x] = count
    return count

print(climbStairs(35))