//Given a pattern and a string s, find if s follows the same pattern.
//Here follow means a full match, such that there is 
//a bijection between a letter in pattern and a non-empty word in s.

func wordPattern(_ pattern: String, _ s: String) -> Bool {
    var sArray = s.components(separatedBy: " ")
    var patternDict = [Character: String]()
    var sDict = [String: Character]()

    if pattern.count != sArray.count { return false }

    for (i, j) in zip(pattern, sArray) {
        if patternDict[i, default: j] != j || sDict[j, default: i] != i {
            return false
        }
        
        patternDict[i] = j
        sDict[j] = i
    }

    return true
}

print(wordPattern("abba", "dog cat cat dog"))
print(wordPattern("abba", "dog cat cat fish"))
print(wordPattern("aaaa", "dog cat cat dog"))