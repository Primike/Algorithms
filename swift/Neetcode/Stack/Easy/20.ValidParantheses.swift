//Given a string s containing just the characters 
//'(', ')', '{', '}', '[' and ']', determine if the input string is valid.

func isValid(_ s: String) -> Bool {
    let dict: [Character: Character] = [")": "(", "]": "[", "}": "{"]
    var stack = [Character]()

    for item in s {
        if let bracket = dict[item] {
            if stack.last == bracket {
                stack.removeLast()
            } else {
                return false
            }
        } else {
            stack.append(item)
        }
    }

    return stack.isEmpty
}

print(isValid("()"))
print(isValid("()[]{}"))
print(isValid("(]"))