// In one operation, select any index i such that 0 < i < words.length 
// and words[i - 1] and words[i] are anagrams, and delete words[i] from words. 
// Keep performing this operation as long as you can select an index 
// that satisfies the conditions.
// Return words after performing all operations. 
// It can be shown that selecting the indices for each operation 
// in any arbitrary order will lead to the same result.

// Time: O(n * l), Space: O(n * l)
func removeAnagrams(_ words: [String]) -> [String] {
    var result = [(String, [Int])]()

    for word in words {
        var counts = Array(repeating: 0, count: 26)

        for letter in word {
            let index = Int(letter.asciiValue!) - 97
            counts[index] += 1
        }

        if result.isEmpty || result.last!.1 != counts {
            result.append((word, counts))
        }
    }

    return result.map { $0.0 }
}

print(removeAnagrams(["abba","baba","bbaa","cd","cd"]))
print(removeAnagrams(["a","b","c","d","e"]))