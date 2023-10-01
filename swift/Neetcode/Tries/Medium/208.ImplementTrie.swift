class TrieNode {
    var children: [TrieNode?] = Array(repeating: nil, count: 26)
    var end = false
}

class Trie {

    var root: TrieNode?

    init() {
        self.root = TrieNode()
    }
    
    func insert(_ word: String) {
        var current = self.root

        for letter in word {
            let i = Int(letter.asciiValue!) - Int(Character("a").asciiValue!)

            if current?.children[i] == nil { current?.children[i] = TrieNode() }

            current = current?.children[i]
        }

        current?.end = true
    }
    
    func search(_ word: String) -> Bool {
        var current = self.root

        for letter in word {
            let i = Int(letter.asciiValue!) - Int(Character("a").asciiValue!)

            if current?.children[i] == nil { return false }

            current = current?.children[i]
        }

        return current?.end ?? false
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var current = self.root

        for letter in prefix {
            let i = Int(letter.asciiValue!) - Int(Character("a").asciiValue!)

            if current?.children[i] == nil { return false }

            current = current?.children[i]
        }

        return true
    }
}