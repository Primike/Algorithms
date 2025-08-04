// You are given a string s.
// Your task is to remove all digits by doing this operation repeatedly:
// Delete the first digit and the closest non-digit character to its left.
// Return the resulting string after removing all digits.

// Time: O(n), Space: O(n)
func clearDigits(_ s: String) -> String {
    var result = [Character]()

    for char in s {
        if char.isNumber, let last = result.last, !last.isNumber {
            result.removeLast()
        } else {
            result.append(char)
        }
    }

    return String(result)
}

print(clearDigits("abc"))
print(clearDigits("cb34"))