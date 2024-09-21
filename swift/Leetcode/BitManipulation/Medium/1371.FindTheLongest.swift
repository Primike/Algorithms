// Given the string s, return the size of the longest substring 
// containing each vowel an even number of times. 
// That is, 'a', 'e', 'i', 'o', and 'u' must appear an even number of times.

func findTheLongestSubstring(_ s: String) -> Int {
    let vowelToBit: [Character: Int] = ["a": 1, "e": 2, "i": 4, "o": 8, "u": 16]
    var mp = Array(repeating: -1, count: 32)
    var prefixXOR = 0
    var result = 0

    for (i, c) in s.enumerated() {
        if let bit = vowelToBit[c] { prefixXOR ^= bit }
        if mp[prefixXOR] == -1, prefixXOR != 0 { mp[prefixXOR] = i }
        result = max(result, i - mp[prefixXOR])
    }

    return result
}

print(findTheLongestSubstring("eleetminicoworoep"))
print(findTheLongestSubstring("leetcodeisgreat"))
print(findTheLongestSubstring("bcbcbc"))