// Given an array of string words, return all strings 
// in words that is a substring of another word. 
// You can return the answer in any order.

// Time: O(n * m), Space: O(1)
func stringMatching(_ words: [String]) -> [String] {
    var result = [String]()

    for i in 0..<words.count {
        for j in 0..<words.count {
            if i == j { continue }
            
            if words[j].contains(words[i]) { 
                result.append(words[i]) 
                break
            }
        }
    }

    return result
}

print(stringMatching(["mass","as","hero","superhero"]))
print(stringMatching(["leetcode","et","code"]))
print(stringMatching(["blue","green","bu"]))