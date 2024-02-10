// Given an integer n, your task is to count how many strings 
// of length n can be formed under the following rules:
// Each character is a lower case vowel ('a', 'e', 'i', 'o', 'u')
// Each vowel 'a' may only be followed by an 'e'.
// Each vowel 'e' may only be followed by an 'a' or an 'i'.
// Each vowel 'i' may not be followed by another 'i'.
// Each vowel 'o' may only be followed by an 'i' or a 'u'.
// Each vowel 'u' may only be followed by an 'a'.

// Time: O(n), Space: O(n)
func countVowelPermutation(_ n: Int) -> Int {
    var rules = [
        "*": ["a", "e", "i", "o", "u"], "a": ["e"], "e": ["a", "i"], 
        "i": ["a", "e", "o", "u"], "o": ["i", "u"], "u": ["a"]
    ]
    
    let mod = 1_000_000_007
    var memo = [String: Int]()

    func dp(_ n: Int, _ letter: String) -> Int {
        let key = "\(n),\(letter)"

        if n == 0 { return 1 }
        if let value = memo[key] { return value }

        var result = 0

        for vowel in rules[letter, default: []] {
            result += dp(n - 1, vowel) % mod
        }

        result = result % mod
        memo[key] = result 
        return result
    }

    return dp(n, "*")
}

print(countVowelPermutation(1))
print(countVowelPermutation(2))
print(countVowelPermutation(5))