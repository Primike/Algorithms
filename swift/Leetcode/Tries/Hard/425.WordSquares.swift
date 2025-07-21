class TrieNode {
    var children: [Character: TrieNode] = [:]
    var wordList: [Int] = []
}

class Solution {
    var N = 0
    var words: [String] = []
    var trie = TrieNode()

    func wordSquares(_ words: [String]) -> [[String]] {
        self.words = words
        self.N = words[0].count

        var results: [[String]] = []
        buildTrie(words)

        for word in words {
            var wordSquare: [String] = [word]
            backtracking(step: 1, wordSquare: &wordSquare, results: &results)
        }
        return results
    }

    func backtracking(step: Int, wordSquare: inout [String], results: inout [[String]]) {
        if step == N {
            results.append(wordSquare)
            return
        }

        var prefix = ""
        for word in wordSquare {
            let charIndex = word.index(word.startIndex, offsetBy: step)
            prefix.append(word[charIndex])
        }

        for wordIndex in getWordsWithPrefix(prefix: prefix) {
            wordSquare.append(self.words[wordIndex])
            backtracking(step: step + 1, wordSquare: &wordSquare, results: &results)
            wordSquare.removeLast()
        }
    }

    func buildTrie(_ words: [String]) {
        self.trie = TrieNode()

        for (wordIndex, word) in words.enumerated() {
            var node = self.trie
            for letter in word {
                if node.children[letter] == nil {
                    node.children[letter] = TrieNode()
                }
                node = node.children[letter]!
                node.wordList.append(wordIndex)
            }
        }
    }

    func getWordsWithPrefix(prefix: String) -> [Int] {
        var node = self.trie
        for letter in prefix {
            if let nextNode = node.children[letter] {
                node = nextNode
            } else {
                return []
            }
        }
        return node.wordList
    }
}