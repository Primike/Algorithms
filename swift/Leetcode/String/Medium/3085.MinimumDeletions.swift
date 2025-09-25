// We consider word to be k-special if 
// |freq(word[i]) - freq(word[j])| <= k 
// for all indices i and j in the string.
// Here, freq(x) denotes the frequency of the character x in word, 
// and |y| denotes the absolute value of y.
// Return the minimum number of characters 
// you need to delete to make word k-special.

// Time: O(n), Space: O(26)
func minimumDeletions(_ word: String, _ k: Int) -> Int {
    let dict = word.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = Int.max

    for (key1, value1) in dict {
        var total = 0

        for (key2, value2) in dict {
            if key1 == key2 { continue }
            
            if value1 > value2 {
                total += value2
            } else if value1 < value2 - k {
                total += value2 - (value1 + k)
            }
        }

        result = min(result, total)
    }

    return result
}

print(minimumDeletions("aabcaba", 0))
print(minimumDeletions("dabdcbdcdcd", 2))
print(minimumDeletions("aaabaaa", 2))