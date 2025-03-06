// Given an array of strings words, find the longest string 
// in words such that every prefix of it is also in words.
// For example, let words = ["a", "app", "ap"]. The string "app" 
// has prefixes "ap" and "a", all of which are in words.
// Return the string described above. If there is more than one string 
// with the same length, return the lexicographically smallest one, 
// and if no string exists, return "".

// Time: O(n * l * log(n)), Space: O(n * l)
func longestWord(_ words: [String]) -> String {
    let words = words.sorted()
    var wordSet = Set<String>()
    var result = ""

    for word in words {
        if word.count == 1 || wordSet.contains(String(word.dropLast())) {
            wordSet.insert(word)

            if word.count > result.count { result = word }
        }
    }

    return result
}

print(longestWord(["k","ki","kir","kira", "kiran"]))
print(longestWord(["a", "banana", "app", "appl", "ap", "apply", "apple"]))
print(longestWord(["abc", "bc", "ab", "qwe"]))