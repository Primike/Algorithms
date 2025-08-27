// A string can be abbreviated by replacing any number of non-adjacent, 
// non-empty substrings with their lengths. 
// The lengths should not have leading zeros.
// Given a string word and an abbreviation abbr, 
// return whether the string matches the given abbreviation.

// Time: O(n), Space: O(1)
func validWordAbbreviation(_ word: String, _ abbr: String) -> Bool {
    let word = Array(word), abbr = Array(abbr)
    var i = 0, j = 0

    while i < word.count, j < abbr.count {
        if abbr[j].isLetter {
            if word[i] != abbr[j] { return false }

            i += 1
            j += 1
        } else {
            var number = 0
            
            if abbr[j] == "0" { return false }

            while j < abbr.count, abbr[j].isNumber {
                number = (number * 10) + (abbr[j].wholeNumberValue ?? 0)
                j += 1
            }

            i += number
        }
    }

    return i == word.count && j == abbr.count
}

print(validWordAbbreviation("internationalization", "i12iz4n"))
print(validWordAbbreviation("apple", "a2e"))