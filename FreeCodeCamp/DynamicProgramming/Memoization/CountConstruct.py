def countConstruct(word, wordBank, memo = {}):
    if word in memo:
        return memo[word]
    if word == "":
        return 1

    total = 0

    for i in wordBank:
        if word.startswith(i):
            numWaysForRest = countConstruct(word[len(i) :], wordBank, memo)
            total = total + numWaysForRest

    memo[word] = total
    return total

print(countConstruct("purple", ["purp", "p", "ur", "le", "purpl"]))