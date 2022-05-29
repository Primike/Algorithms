# Given a string s, return true if it is a palindrome, 
# or false otherwise.

def isPalindrome(x):
    array = []

    for i in x:
        if i.isalpha():
            array.append(i)
        elif i.isdigit() == True:
            array.append(i)

    for i in range(len(array)):
        if array[i].lower() == array[len(array) - 1 - i].lower():
            continue
        else:
            return False

    return True

print(isPalindrome("A man, a plan, a canal: Panama"))
print(isPalindrome("race a car"))
print(isPalindrome("0P"))
print(isPalindrome(""))