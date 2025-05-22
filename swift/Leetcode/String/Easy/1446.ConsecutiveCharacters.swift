// The power of the string is the maximum length of a 
// non-empty substring that contains only one unique character.
// Given a string s, return the power of s.

// Time: O(n), Space: O(1)
func maxPower(_ s: String) -> Int {
    var result = 0
    var last = s.first ?? "?"
    var count = 0

    for char in s {
        if char == last { 
            count += 1 
        } else {
            last = char
            count = 1
        }

        result = max(result, count)
    }

    return result
}

print(maxPower("leetcode"))
print(maxPower("abbcccddddeeeeedcba"))