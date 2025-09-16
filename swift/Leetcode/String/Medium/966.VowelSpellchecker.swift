class Solution {
    var words_perfect: Set<String> = []
    var words_cap: [String: String] = [:]
    var words_vow: [String: String] = [:]
    private let vowels: Set<Character> = ["a", "e", "i", "o", "u"]

    func spellchecker(_ wordlist: [String], _ queries: [String]) -> [String] {
        words_perfect = Set<String>()
        words_cap = [String: String]()
        words_vow = [String: String]()

        for word in wordlist {
            words_perfect.insert(word)

            let wordlow = word.lowercased()
            if words_cap[wordlow] == nil {
                words_cap[wordlow] = word
            }

            let wordlowDV = devowel(wordlow)
            if words_vow[wordlowDV] == nil {
                words_vow[wordlowDV] = word
            }
        }

        return queries.map { solve($0) }
    }

    func solve(_ query: String) -> String {
        if words_perfect.contains(query) {
            return query
        }

        let queryL = query.lowercased()
        if let word = words_cap[queryL] {
            return word
        }

        let queryLV = devowel(queryL)
        if let word = words_vow[queryLV] {
            return word
        }

        return ""
    }

    func devowel(_ word: String) -> String {
        return String(word.map { vowels.contains($0) ? "*" : $0 })
    }
}