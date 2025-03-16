class Solution {
    func isVowel(_ c: Character) -> Bool {
        return c == "a" || c == "e" || c == "i" || c == "o" || c == "u"
    }
    
    func countOfSubstrings(_ word: String, _ k: Int) -> Int {
        let letters = Array(word)
        var numValidSubstrings = 0
        var start = 0, end = 0
        var vowelCount = [Character: Int]()
        var consonantCount = 0
        var nextConsonant = Array(repeating: 0, count: letters.count)
        var nextConsonantIndex = letters.count
        
        for i in stride(from: letters.count - 1, through: 0, by: -1) {
            nextConsonant[i] = nextConsonantIndex
            if !isVowel(letters[i]) {
                nextConsonantIndex = i
            }
        }
        
        while end < letters.count {
            let newLetter = letters[end]
            if isVowel(newLetter) {
                vowelCount[newLetter, default: 0] += 1
            } else {
                consonantCount += 1
            }
            
            while consonantCount > k {
                let startLetter = letters[start]
                if isVowel(startLetter) {
                    vowelCount[startLetter]! -= 1
                    if vowelCount[startLetter]! == 0 {
                        vowelCount.removeValue(forKey: startLetter)
                    }
                } else {
                    consonantCount -= 1
                }
                start += 1
            }
            
            while start < letters.count && vowelCount.count == 5 && consonantCount == k {
                numValidSubstrings += nextConsonant[end] - end
                let startLetter = letters[start]
                if isVowel(startLetter) {
                    vowelCount[startLetter]! -= 1
                    if vowelCount[startLetter]! == 0 {
                        vowelCount.removeValue(forKey: startLetter)
                    }
                } else {
                    consonantCount -= 1
                }
                start += 1
            }
            
            end += 1
        }
        
        return numValidSubstrings
    }
}