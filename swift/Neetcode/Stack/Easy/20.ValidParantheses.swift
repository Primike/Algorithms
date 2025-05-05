// Given a string s containing just the characters 
// '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

// Time: O(n), Space: O(n)
func isValid(_ s: String) -> Bool {
    var dict: [Character: Character] = [")": "(", "]": "[", "}": "{"]
    var stack = [Character]()

    for letter in s {
        if !dict.keys.contains(letter) {
            stack.append(letter)
        } else if let last = stack.last, dict[letter]! == last {
            stack.removeLast()
        } else {
            return false
        }
    }

    return stack.isEmpty
}

print(isValid("()"))
print(isValid("()[]{}"))
print(isValid("(]"))