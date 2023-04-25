//Given two strings s and t, return true if s is a subsequence of t, 
//or false otherwise.


func isSubsequence(_ s: String, _ t: String) -> Bool {
    if s.isEmpty {
        return true
    }

    return t.reduce((s: Array(s), index: 0)) { (result, letter) in
        var (s, index) = result
        if index < s.count && s[index] == letter {
            index += 1
        }
        return (s, index)
    }.index == s.count
}

print(isSubsequence("abc", "ahbgdc"))
print(isSubsequence("axc", "ahbgdc"))