// Alice is organizing a game for her numFriends friends. 
// There are multiple rounds in the game, where in each round:
// word is split into numFriends non-empty strings, 
// such that no previous round has had the exact same split.
// All the split words are put into a box.
// Find the lexicographically largest string from the box after 
// all the rounds are finished.

// Time: O(n), Space: O(1)
func answerString(_ word: String, _ numFriends: Int) -> String {
    if numFriends == 1 { return word }

    let word = Array(word)
    var i = 0, j = 1

    while j < word.count {
        var k = 0

        while j + k < word.count, word[i + k] == word[j + k] {
            k += 1
        }
        
        if j + k < word.count, word[i + k] < word[j + k] {
            let temp = i
            i = j
            j = max(j + 1, temp + k + 1)
        } else {
            j += k + 1
        }
    }

    let string = String(word[i...])
    let length = min(string.count, word.count - numFriends + 1)

    return String(string.prefix(length))
}

print(answerString("dbca", 2))
print(answerString("gggg", 4))