//Given two strings s and t, 
//return true if t is an anagram of s, and false otherwise.

func isAnagram(_ s: String, _ t: String) -> Bool {
    var sDict = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }

    for letter in t {
        if (sDict[letter] ?? 0) > 0 {
            sDict[letter]! -= 1
        } else {
            return false
        }
    }

    return sDict.values.allSatisfy { $0 == 0 }
}

print(isAnagram("anagram", "nagaram"))
print(isAnagram("rat", "car"))
print(isAnagram("aacc", "ccac"))