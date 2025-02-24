func prefixCount(_ words: [String], _ pref: String) -> Int {
    return words.filter { $0.hasPrefix(pref) }.count
}