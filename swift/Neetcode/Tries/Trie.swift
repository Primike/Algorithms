class TrieNode {
    var children = [Character: TrieNode]()
    var isEndOfWord = false
}

class Trie {
    let head: TrieNode

    init() {
        self.head = TrieNode()
    }
    
    func insert(_ word: String) {
        var current = head

        for letter in word {
            if let node = current.children[letter] {
                current = node
            } else {
                let new = TrieNode()
                current.children[letter] = new
                current = new
            }
        }

        current.isEndOfWord = true
    }
    
    func search(_ word: String) -> Bool {
        var current = head

        for letter in word {
            guard let node = current.children[letter] else { return false }
            current = node
        }

        return current.isEndOfWord
    }
    
    func startsWith(_ string: String) -> Bool {
        var current = head

        for letter in string {
            guard let node = current.children[letter] else { return false }
            current = node
        }

        return true
    }
}