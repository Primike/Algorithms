def canConstruct(string, array, memo = {}):
    if string in memo:
        return memo[string]
    if string == "":
        return True
    
    for word in array:
        if string.startswith(word):
            if canConstruct(string[len(word):], array):
                return True
            
    memo[string] = False
    return False

print(canConstruct("abcdef", ["ab", "abc", "cd", "def", "abcd"]))
