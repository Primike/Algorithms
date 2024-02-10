// Given a string s containing only three types of characters: 
// '(', ')' and '*', return true if s is valid.

// Time: O(n), Space: O(1)
func checkValidString(_ s: String) -> Bool {
    var left = 0, right = 0

    for char in s {
        left += char == "(" ? 1 : -1
        right += char != ")" ? 1 : -1

        if right < 0 { break }
        left = max(left, 0)
    }

    return left == 0
}

print(checkValidString("()"))
print(checkValidString("(*)"))
print(checkValidString("(*))"))