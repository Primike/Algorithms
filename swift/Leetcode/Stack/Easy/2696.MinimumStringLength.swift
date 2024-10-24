// You are given a string s consisting only of uppercase English letters.
// You can apply some operations to this string where, 
// in one operation, you can remove any occurrence 
// of one of the substrings "AB" or "CD" from s.
// Return the minimum possible length of the resulting string 
// that you can obtain.

// Time: O(n), Space: O(n)
func minLength(_ s: String) -> Int {
    let s = Array(s)
    var stack = [Character]()

    for letter in s {
        if let last = stack.last, (last == "A" && letter == "B" ) || 
            (last == "C" && letter == "D") {
            stack.removeLast()
        } else {
            stack.append(letter)
        }
    }

    return stack.count
}

print(minLength("ABFCACDB"))
print(minLength("ACBBD"))