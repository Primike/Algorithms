//Given a string s containing just the characters 
//'(', ')', '{', '}', '[' and ']', determine if the input string is valid.

func isValid(_ s: String) -> Bool {
    var s = Array(s)
    var stack = [Character]()
    var parentheses: [Character: Character] = [")" : "(", "}": "{", "]": "["]

    for bracket in s {
        if parentheses.values.contains(bracket) { 
            stack.append(bracket) 
            continue
        }

        if stack.isEmpty { return false }

        if let last = stack.popLast(), last != parentheses[bracket, default: "x"] {
            return false
        } 
    }

    return stack.isEmpty
}

print(isValid("()"))
print(isValid("()[]{}"))
print(isValid("(]"))