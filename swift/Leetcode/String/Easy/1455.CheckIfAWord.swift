// Given a sentence that consists of some words separated by a single space, 
// and a searchWord, check if searchWord is a prefix of any word in sentence.
// Return the index of the word in sentence (1-indexed) 
// where searchWord is a prefix of this word. 
// If searchWord is a prefix of more than one word, 
// return the index of the first word (minimum index). 
// If there is no such word return -1.

// Time: O(n * w), Space: O(n)
func isPrefixOfWord(_ sentence: String, _ searchWord: String) -> Int {
    let sentence = sentence.components(separatedBy: " ")

    for (i, word) in sentence.enumerated() {
        if word.hasPrefix(searchWord) { return i + 1 }
    }

    return -1
}

print(isPrefixOfWord("i love eating burger", "burg"))
print(isPrefixOfWord("this problem is an easy problem", "pro"))
print(isPrefixOfWord("i am tired", "you"))