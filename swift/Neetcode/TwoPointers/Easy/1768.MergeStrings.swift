// You are given two strings word1 and word2. Merge the strings by adding letters 
// in alternating order, starting with word1. If a string is longer than the other, 
// append the additional letters onto the end of the merged string.
// Return the merged string.

func mergeAlternately(_ word1: String, _ word2: String) -> String {
    var index1 = word1.startIndex, index2 = word2.startIndex
    var result = ""

    while index1 != word1.endIndex || index2 != word2.endIndex {
        if index1 != word1.endIndex {
            result += String(word1[index1])
            index1 = word1.index(after: index1)
        }

        if index2 != word2.endIndex {
            result += String(word2[index2])
            index2 = word2.index(after: index2)
        }
    }

    return result
}

print(mergeAlternately("abc", "pqr"))
print(mergeAlternately("ab", "pqrs"))
print(mergeAlternately("abcd", "pq"))