//Given a string s, return the number of unique palindromes 
//of length three that are a subsequence of s.

func countPalindromicSubsequence(_ s: String) -> Int {
    struct CharPair: Hashable {
        let first: Character
        let second: Character
    }
    
    var result = Set<(CharPair)>()
    var prefixSet = Set<Character>()
    var postfixSet = s.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }

    for letter in s {
        //no negative since letter has to be in postfixSet
        postfixSet[letter, default: 0] -= 1

        if postfixSet[letter] == 0 {
            postfixSet.removeValue(forKey: letter)
        }

        for i in 0..<26 {
            let alpha = Character(UnicodeScalar("a".unicodeScalars.first!.value + UInt32(i))!)

            if prefixSet.contains(alpha) && postfixSet.keys.contains(alpha) {
                result.insert(CharPair(first: alpha, second: letter))
            }
        }

        prefixSet.insert(letter)
    }

    return result.count
}

print(countPalindromicSubsequence("aabca"))
print(countPalindromicSubsequence("abc"))
print(countPalindromicSubsequence("bbcbaba"))