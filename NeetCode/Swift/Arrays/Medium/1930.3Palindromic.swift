//Given a string s, return the number of unique palindromes 
//of length three that are a subsequence of s.

func countPalindromicSubsequence(_ s: String) -> Int {
    struct CharPair: Hashable {
        let first: Character
        let second: Character
    }
    
    var result = Set<(CharPair)>()
    var left = Set<Character>()
    var right = s.reduce(into: [Character: Int]()) { dict, letter in
        dict[letter, default: 0] += 1
    }

    for letter in s {
        //no negative since letter has to be in right
        right[letter, default: 0] -= 1

        if right[letter] == 0 {
            right.removeValue(forKey: letter)
        }

        for i in 0..<26 {
            let alpha = Character(UnicodeScalar("a".unicodeScalars.first!.value + UInt32(i))!)

            if left.contains(alpha) && right.keys.contains(alpha) {
                result.insert(CharPair(first: alpha, second: letter))
            }
        }

        left.insert(letter)
    }

    return result.count
}

print(countPalindromicSubsequence("aabca"))
print(countPalindromicSubsequence("abc"))
print(countPalindromicSubsequence("bbcbaba"))