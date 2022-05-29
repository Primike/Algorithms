def allConstruct(word, wordBank, memo = {}):
    if word in memo: 
        return memo[word]
    if word == "":
        return [[]]

    result = []

    for i in wordBank:
        if word.startswith(i):
            suffix = word[len(i) :]
            suffixWays = allConstruct(suffix, wordBank, memo)
            targetWays = list(map(lambda x: [i] + x, suffixWays))
            result = result + targetWays

    memo[word] = result
    return result
    
print(allConstruct("purple", ["purp", "p", "ur", "le", "purpl"]))