# You have n coins and you want to build a staircase with these coins. 
# The last row of the staircase may be incomplete.
# Given the integer n, return the number of complete rows 
# of the staircase you will build.

def arrangeCoins(n):
    
    left, right = 1, n
    rows = 0

    while left <= right:
        rows = (right + left)//2

        coins = (rows**2 - rows)/2 + rows
        if  coins == n:
            return rows
        elif coins > n:
            right = rows - 1
        else:
            left = rows + 1

    return right

print(arrangeCoins(5))
print(arrangeCoins(8))