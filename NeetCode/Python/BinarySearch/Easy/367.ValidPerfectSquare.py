# Given a positive integer num, return true if num is a perfect square 
# or false otherwise.

def isPerfectSquare(num):
    left, right = 0, num

    while left <= right:
        mid = (right + left)//2

        if mid**2 == num:
            return True
        elif mid**2 > num:
            right = mid - 1
        else:
            left = mid + 1

    return False

print(isPerfectSquare(16))
print(isPerfectSquare(14))