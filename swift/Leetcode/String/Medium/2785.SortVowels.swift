// Given a 0-indexed string s, permute s to get a new string t such that:
// All consonants remain in their original places. More formally, 
// if there is an index i with 0 <= i < s.length such that 
// s[i] is a consonant, then t[i] = s[i].
// The vowels must be sorted in the nondecreasing order of their ASCII values. 
// More formally, for pairs of indices i, j with 0 <= i < j < s.length 
// such that s[i] and s[j] are vowels, 
// then t[i] must not have a higher ASCII value than t[j].
// Return the resulting string.

// Time: O(n), Space: O(1)
func sortVowels(_ s: String) -> String {
    var vowels: Set<Character> = [
        "A", "E", "I", "O", "U",
        "a", "e", "i", "o", "u"
    ]
    var vowelDict = [Character: Int]()

    for char in s {
        if vowels.contains(char) {
            vowelDict[char, default: 0] += 1
        }
    }

    var vowelArray = Array(vowelDict).sorted { $0.0 < $1.0 }
    var result = ""
    var i = 0

    for char in s {
        if vowels.contains(char) {
            result.append(vowelArray[i].0)
            vowelArray[i].1 -= 1
            if vowelArray[i].1 == 0 { i += 1 }
        } else {
            result.append(char)
        }
    }

    return result
}

print(sortVowels("lEetcOde"))
print(sortVowels("lYmpH"))