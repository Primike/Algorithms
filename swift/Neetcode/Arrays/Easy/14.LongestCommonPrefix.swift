// Write a function to find the longest common prefix string 
// amongst an array of strings.
// If there is no common prefix, return an empty string "".

class Trie {
    var dict: [Character: Trie] = [:]
}

// Time: O(n * l), Space: O(l)
func longestCommonPrefix(_ strs: [String]) -> String {
    let strs = strs.map { Array($0) }
    var trie = Trie()
    var current = trie

    for letter in strs[0] {
        let newTrie = Trie()
        current.dict[letter] = newTrie
        current = newTrie
    }

    var minimum = strs[0].count

    for i in 1..<strs.count {
        current = trie
        var j = 0

        while j < strs[i].count, let next = current.dict[strs[i][j]] {
            current = next
            j += 1
        }

        minimum = min(minimum , j)
    }

    return String(strs[0][..<minimum])
}

print(longestCommonPrefix(["flower","flow","flight"]))
print(longestCommonPrefix(["dog","racecar","car"]))


func longestCommonPrefix2(_ strs: [String]) -> String {
    var result = ""

    for letter in strs[0] {
        for word in strs {
            if !word.hasPrefix(result + String(letter)) { return result }
        }

        result += String(letter)
    }

    return result
}