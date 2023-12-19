// Given a string s, return the number of unique palindromes 
// of length three that are a subsequence of s.

func countPalindromicSubsequence(_ s: String) -> Int {
    var postDict = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var preSet = Set<Character>()
    var palindromes = Set<String>()

    for letter in s {
        postDict[letter, default: 0] -= 1
        if postDict[letter, default: 0] == 0 { postDict[letter] = nil }

        for i in 1..<27 {
            let alpha = Character(UnicodeScalar(UInt8(96 + i)))

            if preSet.contains(alpha), postDict.keys.contains(alpha) {
                palindromes.insert("\(alpha)\(letter)\(alpha)")
            }
        }

        preSet.insert(letter)
    }

    return palindromes.count
}

print(countPalindromicSubsequence("aabca"))
print(countPalindromicSubsequence("abc"))
print(countPalindromicSubsequence("bbcbaba"))