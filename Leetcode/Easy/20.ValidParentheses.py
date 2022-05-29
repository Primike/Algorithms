# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']'
# determine if the input string is valid.

def isValid(string):
    array = []

    for i in string:
        if i == "(" or i == "{" or i == "[":
            array.append(i)
        elif i == ")" and array[-1] != "(":
            return False
        elif i == "}" and array[-1] != "{":
            return False
        elif i == "]" and array[-1] != "[":
            return False
        elif i == ")" and array[-1] == "(":
            array.pop(-1)
        elif i == "}" and array[-1] == "{":
            array.pop(-1)
        elif i == "]" and array[-1] == "[":
            array.pop(-1)
        else:
            return False

    if len(array) > 0:
        return False
    
    return True

print(isValid("{{}}(((())))"))

