// Given an array of strings words (without duplicates), 
// return all the concatenated words in the given list of words.

func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
    let wordSet = Set(words)
    var memo = [String: Bool]()

    func dp(_ word: String) -> Bool {
        if let value = memo[word] { return value }

        for i in 1..<word.count {
            let index = word.index(word.startIndex, offsetBy: i)
            let part1 = String(word[..<index] )
            let part2 = String(word[index...])

            if wordSet.contains(part1), (wordSet.contains(part2) || dp(part2) ) {
                memo[word] = true
                return true
            }
        }

        memo[word] = false 
        return false
    }

    var result = [String]()

    for word in words {
        if dp(word) { result.append(word) }
    }

    return result
}

print(findAllConcatenatedWordsInADict(["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"]))
print(findAllConcatenatedWordsInADict(["cat","dog","catdog"]))