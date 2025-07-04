// Alice is attempting to type a specific string on her computer. 
// However, she tends to be clumsy and may press a key for too long, 
// resulting in a character being typed multiple times.
// Although Alice tried to focus on her typing, she is aware that 
// she may still have done this at most once.
// You are given a string word, which represents the final 
// output displayed on Alice's screen.
// Return the total number of possible original strings that 
// Alice might have intended to type.

// Time: O(n), Space: O(n)
func possibleStringCount(_ word: String) -> Int {
    let word = Array(word)
    var result = 1
    var i = 0

    while i < word.count {
        var letter = word[i]
        var count = 0

        while i < word.count, word[i] == letter {
            i += 1
            count += 1
        }

        result += count - 1
    }

    return result
}

print(possibleStringCount("abbcccc"))
print(possibleStringCount("abcd"))
print(possibleStringCount("aaaa"))