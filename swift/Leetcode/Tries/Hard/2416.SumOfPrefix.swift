class TrieNode {

    var next: [TrieNode?]
    var count: Int

    init() {
        self.next = Array(repeating: nil, count: 26)
        self.count = 0
    }
}

class Trie {

    let root: TrieNode

    init() {
        self.root = TrieNode()
    }

    func insert(_ word: String) {
        var node = root

        for letter in word {
            let index = Int(letter.asciiValue! - Character("a").asciiValue!)
            if node.next[index] == nil { node.next[index] = TrieNode() }

            node.next[index]!.count += 1
            node = node.next[index]!
        }
    }

    func count(_ s: String) -> Int {
        var node = root
        var result = 0

        for letter in s {
            let index = Int(letter.asciiValue! - Character("a").asciiValue!)
            result += node.next[index]!.count
            node = node.next[index]!
        }

        return result
    }
}

func sumPrefixScores(_ words: [String]) -> [Int] {
    let trie = Trie()

    for word in words {
        trie.insert(word)
    }

    return words.map { trie.count($0) }
}