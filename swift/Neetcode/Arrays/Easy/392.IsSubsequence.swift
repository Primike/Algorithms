// Given two strings s and t, return true if s is a subsequence of t, 
// or false otherwise.

func isSubsequence2(_ s: String, _ t: String) -> Bool {
    let s = Array(s)
    var index = 0

    for letter in t {
        if index == s.count { return true }
        if letter == s[index] { index += 1 }
    }

    return index == s.count
}

print(isSubsequence("abc", "ahbgdc"))
print(isSubsequence("axc", "ahbgdc"))