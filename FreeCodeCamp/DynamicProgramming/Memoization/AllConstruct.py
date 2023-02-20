def allConstruct(word, wordBank, memo = {}):
    if word in memo: 
        return memo[word]
    if word == "":
        return [[]]

    result = []

    for i in wordBank:
        if word.startswith(i):
            ways = allConstruct(word[len(i) :], wordBank, memo)
            appendedWays = list(map(lambda x: [i] + x, ways))
            result = result + appendedWays

    memo[word] = result
    return result
    
print(allConstruct("purple", ["purp", "p", "ur", "le", "purpl"]))