// You are given two strings word1 and word2. Merge the strings by adding letters 
// in alternating order, starting with word1. If a string is longer than the other, 
// append the additional letters onto the end of the merged string.
// Return the merged string.

func mergeAlternately(_ word1: String, _ word2: String) -> String {
    let word1 = Array(word1), word2 = Array(word2)
    var left = 0, right = 0
    var result = ""

    while left < word1.count, right < word2.count {
        result += String(word1[left]) + String(word2[right])
        left += 1
        right += 1
    }

    result += String(word1[left...]) + String(word2[right...])
    return result
}

print(mergeAlternately("abc", "pqr"))
print(mergeAlternately("ab", "pqrs"))
print(mergeAlternately("abcd", "pq"))