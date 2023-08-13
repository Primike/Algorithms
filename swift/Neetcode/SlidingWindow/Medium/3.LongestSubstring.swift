//Given a string s, find the length of the longest substring
//without repeating characters.

func lengthOfLongestSubstring(_ s: String) -> Int {
    var s = Array(s)
    var window = Set<Character>()
    var left = 0
    var result = 0

    for (i, number) in s.enumerated() {
        while window.contains(number) {
            window.remove(s[left])
            left += 1 
        }

        window.insert(number)
        result = max(result, i - left + 1)
    }

    return result
}


print(lengthOfLongestSubstring("abcabcbb"))
print(lengthOfLongestSubstring("bbbbb"))
print(lengthOfLongestSubstring("pwwkew"))