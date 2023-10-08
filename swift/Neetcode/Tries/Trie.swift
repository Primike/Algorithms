class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEndOfWord = false
}

class Trie {
    let root = TrieNode()

    func insert(_ word: String) {
        var node = root
        for char in word {
            if node.children[char] == nil {
                node.children[char] = TrieNode()
            }
            node = node.children[char]!
        }
        node.isEndOfWord = true
    }

    func search(_ word: String) -> Bool {
        var node = root
        for char in word {
            guard let nextNode = node.children[char] else {
                return false
            }
            node = nextNode
        }
        return node.isEndOfWord
    }

    func startsWith(_ prefix: String) -> Bool {
        var node = root
        for char in prefix {
            guard let nextNode = node.children[char] else {
                return false
            }
            node = nextNode
        }
        return true
    }
}