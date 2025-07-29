// You are given a string word and a non-negative integer k.
// Return the total number of substrings of word that 
// contain every vowel ('a', 'e', 'i', 'o', and 'u') 
// at least once and exactly k consonants.

// Time: O(n), Space: O(n)
func countOfSubstrings(_ word: String, _ k: Int) -> Int {
    let word = Array(word).map { String($0) }
    let vowels = Set(["a", "e", "i", "o", "u"])
    var nextConsonant = Array(repeating: 0, count: word.count)
    var lastConsonant = word.count
    
    for i in (0..<word.count).reversed() {
        nextConsonant[i] = lastConsonant
        if !vowels.contains(word[i]) { lastConsonant = i }
    }

    var vowelDict = [String: Int]()       
    var result = 0
    var consonants = 0
    var i = 0
    var left = 0

    while i < word.count {
        if vowels.contains(word[i]) {
            vowelDict[word[i], default: 0] += 1
        } else {
            consonants += 1
        }
        
        while consonants > k {
            if vowels.contains(word[left]) {
                vowelDict[word[left], default: 1] -= 1
                if vowelDict[word[left]] == 0 { vowelDict[word[left]] = nil }
            } else {
                consonants -= 1
            }

            left += 1
        }
        
        while left < i, vowelDict.count == 5, consonants == k {
            result += nextConsonant[i] - i

            if vowels.contains(word[left]) {
                vowelDict[word[left], default: 1] -= 1
                if vowelDict[word[left]] == 0 { vowelDict[word[left]] = nil }
            } else {
                consonants -= 1
            }

            left += 1
        }
        
        i += 1
    }
    
    return result
}

print(countOfSubstrings("aeioqq", 1))
print(countOfSubstrings("aeiou", 0))
print(countOfSubstrings("ieaouqqieaouqq", 1))