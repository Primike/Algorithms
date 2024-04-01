// Return a list of lists of the suggested products after 
// each character of searchWord is typed.

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
    
    func getSuggestions(_ searchPrefix: String) -> [String] {
        guard let prefixNode = getPrefixNode(searchPrefix) else { return [] }

        return dfs(prefixNode, searchPrefix, [])
    }

    private func getPrefixNode(_ searchPrefix: String) -> TrieNode? {
        var current = head

        for letter in searchPrefix {
            guard let node = current.children[letter] else { return nil }
            current = node
        }

        return current
    }

    private func dfs(_ node: TrieNode, _ path: String, _ suggestions: [String]) -> [String] {
        var suggestions = suggestions

        if node.isEndOfWord, suggestions.count < 3 { suggestions.append(path) }
        if suggestions.count == 3 { return suggestions }

        let sortedChildren = node.children.sorted { $0.key < $1.key }

        for (letter, nextNode) in sortedChildren {
            let newSuggestions = dfs(nextNode, path + String(letter), suggestions)

            if newSuggestions.count == 3 { return newSuggestions }
            suggestions = newSuggestions
        }

        return suggestions
    }
}

func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
    var trie = Trie()

    for product in products {
        trie.insert(product)
    }

    var result = [[String]]()
    var searchPrefix = ""

    for letter in searchWord {
        searchPrefix += String(letter)
        result.append(trie.getSuggestions(searchPrefix))
    }

    return result
}


print(searchWord(["mobile","mouse","moneypot","monitor","mousepad"], "mouse"))
print(searchWord(["havana"], "havana"))


// Time: O(n * logn), Space: O(n)
func suggestedProduct2(_ products: [String], _ searchWord: String) -> [[String]] {
    let sortedProducts = products.sorted()
    var result = [[String]]()
    var searchPrefix = ""

    for letter in searchWord {
        searchPrefix += String(letter)
        var left = 0, right = sortedProducts.count - 1

        while left < right {
            let mid = (right + left) / 2

            if sortedProducts[mid] >= searchPrefix {
                right = mid
            } else {
                left = mid + 1
            }
        }

        var suggestions = [String]()

        for i in left..<min(left + 3, sortedProducts.count) {
            if !sortedProducts[i].hasPrefix(searchPrefix) { break }
            suggestions.append(sortedProducts[i])
        }

        result.append(suggestions)
    }

    return result
}