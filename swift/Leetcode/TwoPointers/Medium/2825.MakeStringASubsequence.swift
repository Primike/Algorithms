// You are given two 0-indexed strings str1 and str2.
// In an operation, you select a set of indices in str1, 
// and for each index i in the set, increment str1[i] 
// to the next character cyclically. That is 'a' becomes 'b', 
// 'b' becomes 'c', and so on, and 'z' becomes 'a'.
// Return true if it is possible to make str2 a subsequence of 
// str1 by performing the operation at most once, and false otherwise.

func canMakeSubsequence(_ str1: String, _ str2: String) -> Bool {
    let str1 = Array(str1), str2 = Array(str2)
    var i = 0

    for letter in str1 {
        if i == str2.count { return true }

        let ascii1 = (Int(letter.asciiValue!) - 97)
        let ascii2 = (Int(str2[i].asciiValue!) - 97)
        
        if ascii1 + 1 == ascii2 || ascii1 == ascii2 { i += 1 }
        if ascii1 == 25, ascii2 == 0 { i += 1 }
    }

    return i == str2.count
}

print(canMakeSubsequence("abc", "ad"))
print(canMakeSubsequence("zc", "ad"))
print(canMakeSubsequence("ab", "d"))