// Find the vowel (one of 'a', 'e', 'i', 'o', or 'u') with the maximum frequency.
// Find the consonant (all other letters excluding vowels) with the maximum frequency.
// Return the sum of the two frequencies.

// Time: O(n), Space: O(1)
func maxFreqSum(_ s: String) -> Int {
    var vowels: Set<Character> = ["a", "e", "i", "o", "u"]
    var vowelDict = [Character: Int]()
    var consonantDict = [Character: Int]()

    for char in s {
        if vowels.contains(char) {
            vowelDict[char, default: 0] += 1
        } else {
            consonantDict[char, default: 0] += 1
        }
    }

    return (vowelDict.values.max() ?? 0) + (consonantDict.values.max() ?? 0)
}

print(maxFreqSum("successes"))
print(maxFreqSum("aeiaeia"))