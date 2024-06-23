// You are given two strings s and t consisting of 
// only lowercase English letters.
// Return the minimum number of characters that need to be 
// appended to the end of s so that t becomes a subsequence of s.

// Time: O(n), Space: O(1)
func appendCharacters(_ s: String, _ t: String) -> Int {
    let s = Array(s), t = Array(t)
    var i = 0, j = 0

    while i < s.count, j < t.count {
        if s[i] == t[j] { j += 1 }
        i += 1
    }

    return t.count - j
}