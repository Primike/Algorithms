// Given a string s, return the length of the longest 
// substring that contains at most two distinct characters.

// Time: O(n), Space: O(n)
func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
    let s = Array(s)
    var dict = [Character: Int]()
    var result = 0
    var count = 0
    var left = 0

    for i in 0..<s.count {
        if !dict.keys.contains(s[i]) { count += 1 }
        dict[s[i], default: 0] += 1

        while count > 2 {
            dict[s[left], default: 1] -= 1

            if dict[s[left]] == 0 {
                dict[s[left]] = nil
                count -= 1
            }

            left += 1
        } 

        result = max(result, i - left + 1)
    }

    return result
}

print(lengthOfLongestSubstringTwoDistinct("eceba"))
print(lengthOfLongestSubstringTwoDistinct("ccaabbb"))