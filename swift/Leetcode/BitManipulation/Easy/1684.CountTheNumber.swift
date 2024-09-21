// You are given a string allowed consisting of distinct characters 
// and an array of strings words. A string is consistent if 
// all characters in the string appear in the string allowed.
// Return the number of consistent strings in the array words.

func countConsistentStrings(_ allowed: String, _ words: [String]) -> Int {
    var allowed = Set(allowed)
    var result = 0

    for string in words {
        var notInAllowed = false 

        for letter in string {
            if !allowed.contains(letter) { notInAllowed = true }
        }

        result += notInAllowed ? 0 : 1
    }

    return result
}

print(countConsistentStrings("ab", ["ad","bd","aaab","baa","badab"]))
print(countConsistentStrings("abc", ["a","b","c","ab","ac","bc","abc"]))
print(countConsistentStrings("cad", ["cc","acd","b","ba","bac","bad","ac","d"]))