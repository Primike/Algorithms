# I pick a number from 1 to n. You have to guess which number I picked.
# Every time you guess wrong, I will tell you whether the number 
# I picked is higher or lower than your guess.

pick = None

def guess(n):
    if n == pick:
        return 0
    elif n > pick:
        return -1
    else:
        return 1
    
def guessNumber(n):

    left, right = 1, n

    while left <= right:
        mid = (right + left)//2

        if guess(mid) == 0:
            return mid
        elif guess(mid) == -1:
            right = mid - 1
        else:
            left = mid + 1
    
    return left

pick = 6
print(guessNumber(10))
pick = 1
print(guessNumber(1))
pick = 2
print(guessNumber(2))