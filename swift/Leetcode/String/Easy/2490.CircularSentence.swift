// A sentence is circular if:
// The last character of a word is equal to the first character of the next word.
// The last character of the last word is equal to the first character of the first word.
// Given a string sentence, return true if it is circular. Otherwise, return false.

// Time: O(n), Space: O(n)
func isCircularSentence(_ sentence: String) -> Bool {
    let sentence = sentence.components(separatedBy: " ").map { Array($0) }
    var last = sentence[0][0]

    for i in 0..<sentence.count {
        if sentence[i][0] != last { return false }
        last = sentence[i].last ?? Character("$")
    }

    return sentence[0][0] == (sentence[sentence.count - 1].last ?? Character("$"))
}

print(isCircularSentence("leetcode exercises sound delightful"))
print(isCircularSentence("eetcode"))
print(isCircularSentence("Leetcode is cool"))