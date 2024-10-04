// A word's generalized abbreviation can be constructed by 
// taking any number of non-overlapping and non-adjacent 
// substrings and replacing them with their respective lengths.
// For example, "abcde" can be abbreviated into:
// "a3e" ("bcd" turned into "3")
// "1bcd1" ("a" and "e" both turned into "1")
// "5" ("abcde" turned into "5")
// "abcde" (no substrings replaced)
// Given a string word, return a list of all the possible
// generalized abbreviations of word. Return the answer in any order.

func generateAbbreviations(_ word: String) -> [String] {
    let word = Array(word)
    var result = [String]()

    func backtrack( _ i: Int, _ count: Int, _ current: String) {
        if i == word.count {
            let finalWord = current + (count > 0 ? String(count) : "")
            result.append(finalWord)
            return
        }
        
        backtrack(i + 1, 0, current + (count > 0 ? String(count) : "") + String(word[i]))
        backtrack(i + 1, count + 1, current)
    }
    
    backtrack(0, 0, "")
    return result
}

print(generateAbbreviations("word"))
print(generateAbbreviations("a"))