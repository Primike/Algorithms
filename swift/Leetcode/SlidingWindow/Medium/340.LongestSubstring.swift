// Given a string s and an integer k, return the length of the longest 
// substring of s that contains at most k distinct characters.

// Time: O(n), Space: O(1)
func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
    let s = Array(s)
    var letterCount = [Character: Int]()
    var result = 0
    var left = 0

    for (i, letter) in s.enumerated() {
        letterCount[letter, default: 0] += 1 

        if letterCount.count <= k { result = max(result, i - left + 1) }

        while left < i, letterCount.count > k {
            letterCount[s[left], default: 1] -= 1
            if letterCount[s[left], default: 0] == 0 { letterCount[s[left]] = nil }
            
            left += 1
        }
    }

    return result
}

print(lengthOfLongestSubstringKDistinct("eceba", 2))
print(lengthOfLongestSubstringKDistinct("aa", 1))