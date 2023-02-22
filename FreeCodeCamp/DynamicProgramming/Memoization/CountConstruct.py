def countConstruct(string, array, memo = {}):
    if string in memo:
        return memo[string]
    if string == "":
        return 1

    count = 0

    for word in array:
        if string.startswith(word):
            result = countConstruct(string[len(word):], array, memo)
            count = count + result

    memo[string] = count
    return count

print(countConstruct("purple", ["purp", "p", "ur", "le", "purpl"]))