// You are given an array of strings words (0-indexed).
// In one operation, pick two distinct indices i and j, 
// where words[i] is a non-empty string, and move any character 
// from words[i] to any position in words[j].
// Return true if you can make every string in words equal using 
// any number of operations, and false otherwise.

// Time: O(n * m), Space: O(26)
func makeEqual(_ words: [String]) -> Bool {
    var dict = [Character: Int]()
    let count = words.count

    for word in words {
        for letter in word {
            dict[letter, default: 0] += 1
        }
    }

    for value in dict.values {
        if value % count != 0 { return false }
    }

    return true
}

print(makeEqual(["abc","aabc","bc"]))
print(makeEqual(["ab","a"]))