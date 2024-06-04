// Given two string arrays word1 and word2, 
// return true if the two arrays represent the same string, 
// and false otherwise.

// Time: O(n), Space: O(n)
func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
    return word1.joined() == word2.joined()
}

print(arrayStringsAreEqual(["ab", "c"], ["a", "bc"]))
print(arrayStringsAreEqual(["a", "cb"], ["ab", "c"]))
print(arrayStringsAreEqual(["abc", "d", "defg"], ["abcddefg"]))