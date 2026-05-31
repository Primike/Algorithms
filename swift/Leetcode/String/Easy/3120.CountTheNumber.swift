// You are given a string word. A letter is called special 
// if it appears both in lowercase and uppercase in word.
// Return the number of special letters in word.

// Time: O(n), Space: O(n)
func numberOfSpecialChars(_ word: String) -> Int {
    var lowercased = Set<Character>()
    var uppercased = Set<Character>()
    var result = 0

    for char in word {
        if char.isLowercase {
            lowercased.insert(char)
        } else {
            uppercased.insert(char)
        }
    }

    for char in uppercased {
        if lowercased.contains(char.lowercased()) {
            result += 1
        }
    }

    return result
}

print(numberOfSpecialChars("aaAbcBC"))
print(numberOfSpecialChars("abc"))
print(numberOfSpecialChars("abBCab"))