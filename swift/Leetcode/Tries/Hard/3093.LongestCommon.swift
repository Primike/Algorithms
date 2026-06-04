class TrieNode {
    var children = [Character: TrieNode]()
    var minLen = Int.max
    var idx = Int.max
}

class Trie {
    let root = TrieNode()
    
    func insert(_ s: String, _ idx: Int) {
        var node = root
        let length = s.count
        
        if length < node.minLen {
            node.minLen = length
            node.idx = idx
        }
        
        for ch in s {
            if node.children[ch] == nil {
                node.children[ch] = TrieNode()
            }
            node = node.children[ch]!
            
            if length < node.minLen {
                node.minLen = length
                node.idx = idx
            }
        }
    }
    
    func query(_ s: String) -> Int {
        var node = root
        
        for ch in s {
            if let nextNode = node.children[ch] {
                node = nextNode
            } else {
                break
            }
        }
        
        return node.idx
    }
}

class Solution {
    func stringIndices(_ wordsContainer: [String], _ wordsQuery: [String]) -> [Int] {
        let trie = Trie()
        
        for (i, word) in wordsContainer.enumerated() {
            let reversedWord = String(word.reversed())
            trie.insert(reversedWord, i)
        }
        
        var res = [Int]()
        for query in wordsQuery {
            let reversedQuery = String(query.reversed())
            res.append(trie.query(reversedQuery))
        }
        
        return res
    }
}