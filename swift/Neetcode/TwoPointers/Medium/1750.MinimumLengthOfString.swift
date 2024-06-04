// Pick a non-empty prefix from the string s where all the characters in the prefix are equal.
// Pick a non-empty suffix from the string s where all the characters in this suffix are equal.
// The prefix and the suffix should not intersect at any index.
// The characters from the prefix and suffix must be the same.
// Delete both the prefix and the suffix.
// Return the minimum length of s after performing the above operation 
// any number of times (possibly zero times).

// Time: O(n), Space: O(1)
func minimumLength(_ s: String) -> Int {
    let s = Array(s)
    var left = 0, right = s.count - 1
    
    while left < right {
        if s[left] != s[right] { return right - left + 1 }

        let letter = s[left]

        while left <= right, (s[left] == letter || s[right] == letter) {
            if s[left] == letter { left += 1 }
            if s[right] == letter { right -= 1 }
        }
    }

    return left == right ? 1 : 0
}

print(minimumLength("ca"))
print(minimumLength("cabaabac"))
print(minimumLength("aabccabba"))