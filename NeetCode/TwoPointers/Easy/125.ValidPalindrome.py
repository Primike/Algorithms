# Given a string s, return true if it is a palindrome, 
# or false otherwise.

def isPalindrome(s):
    new_string = ''

    for character in s:
        if character.isalnum():
            new_string += character

    left = 0
    right = len(new_string) - 1

    while left <= right:
        if new_string[left].lower() == new_string[right].lower():
            left += 1
            right -= 1
        else:
            return False

    return True

print(isPalindrome("A man, a plan, a canal: Panama"))
print(isPalindrome("race a car"))
print(isPalindrome("0P"))
print(isPalindrome(""))