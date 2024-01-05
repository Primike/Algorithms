class WordDictionary {
    var trie: Trie

    init() {
        self.trie = Trie()
    }
    
    func addWord(_ word: String) {
        trie.insert(word)
    }
    
    func search(_ word: String) -> Bool {
        trie.search(word)
    }
}

class TrieNode {
    var children: [Character: TrieNode] = [:]
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
    
    func findNodes(_ letter: Character, _ current: [TrieNode]) -> [TrieNode] {
        var result = [TrieNode]()

        for node in current {
            if let trieNode = node.children[letter] { result.append(trieNode) }
        }

        return result
    }

    func search(_ word: String) -> Bool {
        var current = [head]

        for letter in word {
            if letter == "." { 
                var nodes = [TrieNode]()

                for node in current {
                    for (key, value) in node.children {
                        nodes.append(value)
                    }
                }

                current = nodes
            } else {
                let nodes = findNodes(letter, current)
                if nodes.isEmpty { return false }
                current = nodes
            }
        }

        return current.contains { $0.isEndOfWord }
    }
}