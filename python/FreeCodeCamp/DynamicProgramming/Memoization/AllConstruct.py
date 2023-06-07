def allConstruct(string, array, memo = {}):
    if string in memo: 
        return memo[string]
    if string == "":
        return [[]]

    solution = []

    for word in array:
        if string.startswith(word):
            result = allConstruct(string[len(word) :], array, memo)
            appended_string = list(map(lambda x: [word] + x, result))
            solution = solution + appended_string

    memo[string] = solution
    return solution
    
print(allConstruct("purple", ["purp", "p", "ur", "le", "purpl"]))