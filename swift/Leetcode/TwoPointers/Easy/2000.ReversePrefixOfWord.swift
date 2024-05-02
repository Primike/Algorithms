// Given a 0-indexed string word and a character ch, 
// reverse the segment of word that starts at index 0 and ends 
// at the index of the first occurrence of ch (inclusive). 
// If the character ch does not exist in word, do nothing.
// For example, if word = "abcdefd" and ch = "d", 
// then you should reverse the segment that starts at 0 and ends at 3 (inclusive). 
// The resulting string will be "dcbaefd".
// Return the resulting string.

// Time: O(n), Space: O(1)
func reversePrefix(_ word: String, _ ch: Character) -> String {
    var word = Array(word)
    var right = 0

    for i in 0..<word.count {
        if word[i] == ch { 
            right = i
            break
        }
    }

    var left = 0

    while left <= right {
        word.swapAt(left, right)
        left += 1
        right -= 1
    }

    return String(word)
}

print(reversePrefix("abcdefd", "d"))
print(reversePrefix("xyxzxe", "z"))
print(reversePrefix("abcd", "z"))