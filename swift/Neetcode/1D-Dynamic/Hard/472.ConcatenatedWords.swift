// Given an array of strings words (without duplicates), 
// return all the concatenated words in the given list of words.

func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
    var wordSet = Set(words)
    var result = [String]()

    for word in words {
        wordSet.remove(word)
        var tab = Array(repeating: false, count: word.count + 1)
        tab[0] = true

        for i in 0..<word.count {
            var string = "_" + String(word.prefix(i + 1))

            for j in 0...i {
                string.removeFirst()
                
                if tab[j] == false { continue }
                if wordSet.contains(string) { tab[i + 1] = true }
            }
        }

        if tab[word.count] { result.append(word) }
        wordSet.insert(word)
    }

    return result
}

print(findAllConcatenatedWordsInADict(["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"]))
print(findAllConcatenatedWordsInADict(["cat","dog","catdog"]))


func findAllConcatenatedWordsInADict2(_ words: [String]) -> [String] {
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