// You are given two strings of the same length s1 and s2 and a string baseStr.
// We say s1[i] and s2[i] are equivalent characters.
// For example, if s1 = "abc" and s2 = "cde", then we have 'a' == 'c',
// 'b' == 'd', and 'c' == 'e'.
// For example, given the equivalency information from s1 = "abc"
// and s2 = "cde", "acd" and "aab" are equivalent strings of baseStr = "eed", 
// and "aab" is the lexicographically smallest equivalent string of baseStr.
// Return the lexicographically smallest equivalent string of baseStr 
// by using the equivalency information from s1 and s2.

// Time: O(n + m), Space: O(n + m)
func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {
    var neighbors = [Character: [Character]]()

    for (char1, char2) in zip(s1, s2) {
        if char1 != char2 { neighbors[char1, default: []].append(char2) }
        if char1 != char2 { neighbors[char2, default: []].append(char1) }
    }

    var memo = [Character: Character]()
    var visited = Set<Character>()

    func dfs(_ char: Character) -> Character {
        if let value = memo[char] { return value }
        if visited.contains(char) { return "z" }

        visited.insert(char)
        var smallest = char

        for next in neighbors[char, default: []] {
            smallest = min(smallest, dfs(next))
        }

        return smallest
    }

    var result = ""

    for char in baseStr {
        let smallest = dfs(char)
        result.append(smallest)
        
        for letter in visited {
            memo[letter] = smallest
        }

        visited = []
    }

    return result
}

print(smallestEquivalentString("parker", "morris", "parser"))
print(smallestEquivalentString("hello", "world", "hold"))
print(smallestEquivalentString("leetcode", "programs", "sourcecode"))