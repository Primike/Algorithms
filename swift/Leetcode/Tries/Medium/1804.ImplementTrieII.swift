class TrieNode {
    var links: [TrieNode?] = Array(repeating: nil, count: 26)
    var wordsEndingHere = 0
    var wordsStartingHere = 0
}

class Trie {

    private let root = TrieNode()

    func insert(_ word: String) {
        var node = root

        for char in word {
            let charIndex = Int(char.asciiValue! - Character("a").asciiValue!)
            if node.links[charIndex] == nil { node.links[charIndex] = TrieNode() }
            node = node.links[charIndex]!
            node.wordsStartingHere += 1
        }

        node.wordsEndingHere += 1
    }

    func countWordsEqualTo(_ word: String) -> Int {
        var node = root

        for char in word {
            let charIndex = Int(char.asciiValue! - Character("a").asciiValue!)
            if node.links[charIndex] == nil { return 0 }
            node = node.links[charIndex]!
        }

        return node.wordsEndingHere
    }

    func countWordsStartingWith(_ prefix: String) -> Int {
        var node = root
        for char in prefix {
            let charIndex = Int(char.asciiValue! - Character("a").asciiValue!)
            if node.links[charIndex] == nil {
                return 0
            }
            node = node.links[charIndex]!
        }
        return node.wordsStartingHere
    }

    func erase(_ word: String) {
        var node = root

        for char in word {
            let charIndex = Int(char.asciiValue! - Character("a").asciiValue!)
            node = node.links[charIndex]!
            node.wordsStartingHere -= 1
        }
        
        node.wordsEndingHere -= 1
    }
}