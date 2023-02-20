def canConstruct(word, wordBank, memo = {}):
    if word in memo:
        return memo[word]
    if word == "":
        return True
    
    for i in wordBank:
        if word.startswith(i):
            if canConstruct(word[len(i) :], wordBank):
                return True
            
    memo[word] = False
    return False

print(canConstruct("abcdef", ["ab", "abc", "cd", "def", "abcd"]))
