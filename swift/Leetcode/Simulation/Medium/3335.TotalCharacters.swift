// You are given a string s and an integer t, 
// representing the number of transformations to perform. 
// In one transformation, every character in s is replaced 
// according to the following rules:
// If the character is 'z', replace it with the string "ab".
// Otherwise, replace it with the next character in the alphabet. 
// For example, 'a' is replaced with 'b', 'b' is replaced with 'c', and so on.
// Return the length of the resulting string after exactly t transformations.
// Since the answer may be very large, return it modulo 109 + 7.

// Time: O(t), Space: O(26)
func lengthAfterTransformations(_ s: String, _ t: Int) -> Int {
    let mod = 1_000_000_007
    var letterCounts = Array(repeating: 0, count: 26)

    for letter in s {
        letterCounts[Int(letter.asciiValue!) - 97] += 1
    }

    for _ in 0..<t {
        var last = 0

        for i in 0..<letterCounts.count {
            let current = letterCounts[i]
            letterCounts[i] = last
            last = current
        }

        letterCounts[0] += last % mod
        letterCounts[1] += last % mod
    }

    return letterCounts.reduce(0, +) % mod
}

print(lengthAfterTransformations("abcyy", 2))
print(lengthAfterTransformations("azbk", 1))