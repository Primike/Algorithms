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
    var ascii = Array(repeating: 0, count: 26)
    let mod = 1_000_000_007

    for char in s {
        let index = Int(char.asciiValue!) - 97
        ascii[index] += 1
    }

    for _ in 0..<t {
        var last = 0

        for i in 0..<ascii.count {
            let current = ascii[i]
            ascii[i] = last
            last = current
        }

        ascii[0] += last % mod
        ascii[1] += last % mod
    }

    return ascii.reduce(0, +) % mod
}

print(lengthAfterTransformations("abcyy", 2))
print(lengthAfterTransformations("azbk", 1))