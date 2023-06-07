//Given two strings s and t, return true if s is a subsequence of t, 
//or false otherwise.


func isSubsequence(_ s: String, _ t: String) -> Bool {
    let s = Array(s)
    var count = 0

    for letter in t {
        if count == s.count { return true }

        if letter == s[count] {
            count += 1
        }
    }

    return count == s.count
}

print(isSubsequence("abc", "ahbgdc"))
print(isSubsequence("axc", "ahbgdc"))