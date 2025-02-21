// You are given a string s.
// Your task is to remove all digits by doing this operation repeatedly:
// Delete the first digit and the closest non-digit character to its left.
// Return the resulting string after removing all digits.

// Time: O(n), Space: O(n)
func clearDigits(_ s: String) -> String {
    var stack = [Character]()

    for char in s {
        if char.isNumber {
            stack.popLast()
        } else {
            stack.append(char)
        }
    }

    return String(stack)
}

print(clearDigits("abc"))
print(clearDigits("cb34"))