// Given two strings s and t, 
// return true if t is an anagram of s, and false otherwise.

func isAnagram(_ s: String, _ t: String) -> Bool {
    var sDict = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var tDict = t.reduce(into: [:]) { $0[$1, default: 0] += 1 }

    return sDict == tDict
}

print(isAnagram("anagram", "nagaram"))
print(isAnagram("rat", "car"))
print(isAnagram("aacc", "ccac"))