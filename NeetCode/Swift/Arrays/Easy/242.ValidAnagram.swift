//Given two strings s and t, 
//return true if t is an anagram of s, and false otherwise.

func isAnagram(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    
    var dict = s.reduce(into: [Character: Int]()) { result, letter in
        result[letter, default: 0] += 1
    }
    
    return t.allSatisfy { letter -> Bool in
        if let count = dict[letter], count > 0 {
            dict[letter] = count - 1
            return true
        } else {
            return false
        }
    }
}

print(isAnagram("anagram", "nagaram"))
print(isAnagram("rat", "car"))
print(isAnagram("aacc", "ccac"))