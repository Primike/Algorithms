class TrieNode {
    var children: [Character: TrieNode] = [:]
    var sentences: [String: Int] = [:]
}

struct AutocompleteEntry: Comparable {
    let count: Int
    let text: String
    
    static func < (lhs: AutocompleteEntry, rhs: AutocompleteEntry) -> Bool {
        if lhs.count != rhs.count {
            return lhs.count < rhs.count
        }
        return lhs.text < rhs.text
    }
}

class AutocompleteSystem {
    private var root: TrieNode
    private var currSentence: [Character]
    private var currNode: TrieNode
    private let dead: TrieNode
    
    init(_ sentences: [String], _ times: [Int]) {
        self.root = TrieNode()
        self.currSentence = []
        self.dead = TrieNode()
        self.currNode = root
        
        for (sentence, count) in zip(sentences, times) {
            add(sentence, count)
        }
    }
    
    func input(_ c: Character) -> [String] {
        if c == "#" {
            let sentence = String(currSentence)
            add(sentence, 1)
            currSentence = []
            currNode = root
            return []
        }
        
        currSentence.append(c)
        
        if let nextNode = currNode.children[c] {
            currNode = nextNode
        } else {
            currNode = dead
            return []
        }
        
        var heap = Heap<AutocompleteEntry>(.minHeap)
        for (sentence, count) in currNode.sentences {
            heap.push(AutocompleteEntry(count: count, text: sentence))
        }
        
        var result: [String] = []
        for _ in 0..<3 {
            if let entry = heap.pop() {
                result.append(entry.text)
            }
        }
        return result
    }
    
    private func add(_ sentence: String, _ count: Int) {
        var node = root
        for c in sentence {
            if node.children[c] == nil {
                node.children[c] = TrieNode()
            }
            node = node.children[c]!
            node.sentences[sentence, default: 0] -= count
        }
    }
}