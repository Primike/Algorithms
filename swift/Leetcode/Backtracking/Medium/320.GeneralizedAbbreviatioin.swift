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

// Time: O(2^n), Space: O(n)
func generateAbbreviations(_ word: String) -> [String] {
    let word = Array(word)
    var result = [String]()

    func backtrack(_ index: Int, _ string: String) {  
        if index == word.count { result.append(string) }

        var lastIsNumber = (string.last ?? "a").isNumber
        var current = ""
        var count = 0

        for i in index..<word.count {
            current.append(word[i])
            count += 1

            if lastIsNumber || string.isEmpty { backtrack(i + 1, string + current) }
            if !lastIsNumber || string.isEmpty { backtrack(i + 1, string + "\(count)") }
        }
    }

    backtrack(0, "")
    return result
}

print(generateAbbreviations("word"))
print(generateAbbreviations("a"))