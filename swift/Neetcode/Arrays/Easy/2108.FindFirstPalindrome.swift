// Given an array of strings words, return the first palindromic string 
// in the array. If there is no such string, return an empty string "".

// Time: O(m * n), Space: O(1)
func firstPalindrome(_ words: [String]) -> String {
    let words = Array(words)

    for word in words {
        if word == String(word.reversed()) { return word }
    }

    return ""
}

print(firstPalindrome(["abc","car","ada","racecar","cool"]))
print(firstPalindrome(["notapalindrome","racecar"]))
print(firstPalindrome(["def","ghi"]))