// Two strings are considered close if you can attain one from the other 
// using the following operations:
// Operation 1: Swap any two existing characters. For example, abcde -> aecdb
// Operation 2: Transform every occurrence of one existing character into another 
// existing character, and do the same with the other character.
// For example, aacabb -> bbcbaa (all a's turn into b's, and all b's turn into a's)
// You can use the operations on either string as many times as necessary.
// Given two strings, word1 and word2, return true if word1 and word2 are close, 
// and false otherwise.

// Time: O(n), Space: O(n)
func closeStrings(_ word1: String, _ word2: String) -> Bool {
    if Set(word1) != Set(word2) { return false }
    
    var word1Dict = Array(word1).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var word2Dict = Array(word2).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var word1Count = [Int: Int](), word2Count = [Int: Int]()
    
    for (key, value) in word1Dict {
        word1Count[value, default: 0] += 1
    }

    for (key, value) in word2Dict {
        word2Count[value, default: 0] += 1
    }

    return word1Count == word2Count
}

print(closeStrings("abc", "bca"))
print(closeStrings("a", "aa"))
print(closeStrings("cabbba", "abbccc"))