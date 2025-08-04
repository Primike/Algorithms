// You are given a string s consisting only of uppercase English letters.
// You can apply some operations to this string where, 
// in one operation, you can remove any occurrence 
// of one of the substrings "AB" or "CD" from s.
// Return the minimum possible length of the resulting string 
// that you can obtain.

// Time: O(n), Space: O(n)
func minLength(_ s: String) -> Int {
    var result = [Character]()

    for char in s {
        if (char == "B" && result.last == "A") || 
           (char == "D" && result.last == "C") {
            result.removeLast()
        } else {
            result.append(char)
        }
    }

    return result.count
}

print(minLength("ABFCACDB"))
print(minLength("ACBBD"))