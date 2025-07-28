// You are given a string s consisting only of lowercase English letters.
// We call a substring special if it contains no character which has 
// occurred at least twice (in other words, it does not contain a repeating 
// character). Your task is to count the number of special substrings. 
// Return the number of special substrings.

// Time: O(n), Space: O(n)
func numberOfSpecialSubstrings(_ s: String) -> Int {
    let s = Array(s)
    var letters = Set<Character>()
    var result = 0
    var left = 0

    for i in 0..<s.count {
        while letters.contains(s[i]) {
            letters.remove(s[left])
            left += 1
        }

        letters.insert(s[i])
        result += i - left + 1
    }

    return result
}

print(numberOfSpecialSubstrings("abcd"))
print(numberOfSpecialSubstrings("ooo"))
print(numberOfSpecialSubstrings("abab"))