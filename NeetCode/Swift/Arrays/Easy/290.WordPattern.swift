//Given a pattern and a string s, find if s follows the same pattern.
//Here follow means a full match, such that there is 
//a bijection between a letter in pattern and a non-empty word in s.

func wordPattern(_ pattern: String, _ s: String) -> Bool {
    let sArray = s.split(separator: " ")
    var sDict = [String: Character]()
    var patternDict = [Character: String]()

    if pattern.count != sArray.count {
        return false
    }

    for (i, j) in zip(pattern, sArray) {
        let jString = String(j)
        if (patternDict[i] != nil && patternDict[i] != jString) || (sDict[jString] != nil && sDict[jString] != i) {
            return false
        }

        patternDict[i] = jString
        sDict[jString] = i
    }

    return true
}

print(wordPattern("abba", "dog cat cat dog"))
print(wordPattern("abba", "dog cat cat fish"))
print(wordPattern("aaaa", "dog cat cat dog"))