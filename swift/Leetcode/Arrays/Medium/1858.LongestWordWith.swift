func longestWord(_ words: [String]) -> String {
    let words = words.sorted()
    var validWords = Set<String>()
    var result = ""

    for currentWord in words {
        if currentWord.count == 1 || validWords.contains(String(currentWord.dropLast())) {
            validWords.insert(currentWord)

            if currentWord.count > result.count {
                result = currentWord
            }
        }
    }

    return result
}