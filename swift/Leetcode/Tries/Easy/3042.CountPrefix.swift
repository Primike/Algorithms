func countPrefixSuffixPairs(_ words: [String]) -> Int {
    var result = 0

    for i in 0..<words.count {
        for j in (i + 1)..<words.count {
            if words[j].hasPrefix(words[i]), words[j].hasSuffix(words[i]) {
                result += 1
            }
        }
    }

    return result
}