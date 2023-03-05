# Given a string s containing just the characters 
# '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

def isValid(s):
    stack = []
    dict = {")": "(", "]": "[", "}": "{"}

    for item in s:
        if item in dict:
            if stack and stack[-1] == dict[item]:
                stack.pop()
            else:
                return False
        else:
            stack.append(item)

    return True if not stack else False

print(isValid("()"))
print(isValid("()[]{}"))
print(isValid("(]"))