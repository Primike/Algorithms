// Given an m x n board of characters and a list of strings words, 
// return all words on the board.

func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
    let root = TrieNode()

    for word in words {
        root.addWord(word)
    }

    let rows = board.count, cols = board[0].count
    var result = Set<String>()
    var visited = Set<String>()

    func dfs(_ i: Int, _ j: Int, _ node: TrieNode, _ word: String) {
        let key = "\(i),\(j)"
        
        if i < 0 || i >= rows || j < 0 || j >= cols || visited.contains(key) {
            return
        }
        
        if node.children[board[i][j]] == nil || node.children[board[i][j]]!.refs < 1 {
            return
        }
        
        visited.insert(key)
        let currentLetter = board[i][j]
        let nextNode = node.children[currentLetter]!
        var newWord = word
        newWord.append(currentLetter)

        if nextNode.isWord {
            nextNode.isWord = false
            result.insert(newWord)
            root.removeWord(newWord)
        }

        dfs(i + 1, j, nextNode, newWord)
        dfs(i - 1, j, nextNode, newWord)
        dfs(i, j + 1, nextNode, newWord)
        dfs(i, j - 1, nextNode, newWord)
        
        visited.remove(key)
    }

    for i in 0..<rows {
        for j in 0..<cols {
            dfs(i, j, root, "")
        }
    }

    return Array(result)
}

class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isWord = false
    var refs = 0

    func addWord(_ word: String) {
        var current = self
        current.refs += 1

        for j in word {
            if current.children[j] == nil { current.children[j] = TrieNode() }

            current = current.children[j]!
            current.refs += 1
        }

        current.isWord = true
    }

    func removeWord(_ word: String) {
        var current = self
        current.refs -= 1
        
        for j in word {
            if let nextNode = current.children[j] {
                current = nextNode
                current.refs -= 1
            }
        }
    }
}