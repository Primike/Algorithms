//Given a string s, return the number of unique palindromes 
//of length three that are a subsequence of s.

func countPalindromicSubsequence(_ s: String) -> Int {
    var postfixDict = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var prefixSet = Set<Character>()
    var result = Set<String>()

    for letter in s {
        postfixDict[letter, default: 0] -= 1

        if postfixDict[letter] == 0 { postfixDict.removeValue(forKey: letter) }

        for i in 1..<27 {
            let alpha = Character(UnicodeScalar(UInt8(96 + i)))

            if prefixSet.contains(alpha), postfixDict.keys.contains(alpha) {
                result.insert("\(alpha)\(letter)\(alpha)")
            }
        }

        prefixSet.insert(letter)
    }

    return result.count
}

print(countPalindromicSubsequence("aabca"))
print(countPalindromicSubsequence("abc"))
print(countPalindromicSubsequence("bbcbaba"))