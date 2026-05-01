class TrieNode {
    var children: [TrieNode?] = Array(repeating: nil, count: 26)
    var isEnd = false
}

class Solution {
    private let root = TrieNode()

    func insert(_ word: String) {
        var node = root
        for char in word {
            let idx = Int(char.asciiValue! - 97)
            if node.children[idx] == nil {
                node.children[idx] = TrieNode()
            }
            node = node.children[idx]!
        }
        node.isEnd = true
    }

    private func dfs(_ word: [UInt8], _ i: Int, _ node: TrieNode?, _ cnt: Int) -> Bool {
        guard let node = node, cnt <= 2 else { return false }

        if i == word.count {
            return node.isEnd
        }

        let idx = Int(word[i] - 97)

        if let nextNode = node.children[idx], dfs(word, i + 1, nextNode, cnt) {
            return true
        }

        if cnt < 2 {
            for c in 0..<26 {
                if c == idx { continue }
                if let nextNode = node.children[c], dfs(word, i + 1, nextNode, cnt + 1) {
                    return true
                }
            }
        }

        return false
    }

    func twoEditWords(_ queries: [String], _ dictionary: [String]) -> [String] {
        for word in dictionary {
            insert(word)
        }

        var result = [String]()
        for query in queries {
            let queryBytes = Array(query.utf8)
            if dfs(queryBytes, 0, root, 0) {
                result.append(query)
            }
        }
        return result
    }
}