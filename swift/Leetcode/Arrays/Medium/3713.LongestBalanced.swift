// You are given a string s consisting of lowercase English letters.
// A substring of s is called balanced if all distinct characters 
// in the substring appear the same number of times.
// Return the length of the longest balanced substring of s.

// Time: O(26 * n^2), Space: O(n)
func longestBalanced(_ s: String) -> Int {
    let s = Array(s)
    var result = 0

    for i in 0..<s.count {
        var dict = [Character: Int]()

        for j in i..<s.count {
            dict[s[j], default: 0] += 1

            var count = dict[s[j], default: 1]
            var isValid = true

            for (_, value) in dict {
                if value != count {
                    isValid = false
                    break
                }
            }

            if isValid { result = max(result, j - i + 1) }
        }
    }

    return result
}

print(longestBalanced("abbac"))
print(longestBalanced("zzabccy"))
print(longestBalanced("aba"))