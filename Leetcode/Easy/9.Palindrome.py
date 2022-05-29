# Given an integer x, return true if x is palindrome integer.
# An integer is a palindrome when it reads the same backward as forward.
# For example, 121 is a palindrome while 123 is not.

def isPalindrome(x):
    x = str(x)

    if len(x) == 0:
        return True

    if x[0] == x[len(x) - 1]:
        return isPalindrome(x[1 : len(x) - 1])

    return False

print(isPalindrome(121))
print(isPalindrome(1000021))