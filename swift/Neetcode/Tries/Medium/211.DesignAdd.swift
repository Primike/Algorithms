class TrieNode {
    var children: [TrieNode?] = Array(repeating: nil, count: 26)
    var end = false
}

class WordDictionary {

    var root: TrieNode

    init() {
        self.root = TrieNode()
    }
    
    func addWord(_ word: String) {
        var current = root

        for letter in word {
            let i = Int(letter.asciiValue!) - Int(Character("a").asciiValue!)

            if current.children[i] == nil { current.children[i] = TrieNode() }

            current = current.children[i]!
        }

        current.end = true
    }
    
    func search(_ word: String) -> Bool {
        return dotSearch(Array(word), root)
    }

    func dotSearch(_ word: [Character], _ current: TrieNode?) -> Bool {
        if word.isEmpty { return current?.end ?? false }

        if word[0] == "." {
            for n in 0..<26 {
                if let child = current?.children[n], dotSearch(Array(word.dropFirst()), child) {
                    return true
                }
            }

            return false
        } else {
            let i = Int(word[0].asciiValue!) - Int(Character("a").asciiValue!)
            return dotSearch(Array(word.dropFirst()), current?.children[i])
        }
    }
}