// There is a new alien language that uses the English alphabet. 
// However, the order of the letters is unknown to you.
// You are given a list of strings words from the alien language's dictionary. 
// Now it is claimed that the strings in words are 
// sorted lexicographically by the rules of this new language.
// If this claim is incorrect, and the given arrangement of string in 
// words cannot correspond to any order of letters, return "".
// Otherwise, return a string of the unique letters in the new alien language 
// sorted in lexicographically increasing order by the new language's rules. 
// If there are multiple solutions, return any of them.

func alienOrder(_ words: [String]) -> String {
    var paths = [Character: [Character]]()

    words.forEach { word in
        word.forEach { letter in
            paths[letter] = []
        }
    }

    for i in 0..<words.count - 1 {
        let firstWord = Array(words[i])
        let secondWord = Array(words[i + 1])
        var foundDifference = false
        
        for j in 0..<min(firstWord.count, secondWord.count) {
            if firstWord[j] == secondWord[j] { continue }

            paths[firstWord[j], default: []].append(secondWord[j])
            foundDifference = true
            break
        }

        if !foundDifference, secondWord.count < firstWord.count { return "" }
    }

    var visited = Set<Character>()
    var finished = Set<Character>()
    var result = [Character]()

    func visit(_ n: Character) -> Bool {
        if finished.contains(n) { return true }
        if visited.contains(n) { return false }
        
        visited.insert(n)

        for node in paths[n, default: []] {
            if !visit(node) { return false }
        }

        visited.remove(n)
        finished.insert(n)
        result.append(n)
        return true
    }

    for letter in paths.keys {
        if !finished.contains(letter), !visit(letter) { return "" }
    }

    return String(result.reversed())
}

print(alienOrder(["wrt","wrf","er","ett","rftt"]))
print(alienOrder(["z","x"]))
print(alienOrder(["z","x","z"]))