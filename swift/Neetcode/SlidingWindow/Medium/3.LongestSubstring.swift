// Given a string s, find the length of the longest substring
// without repeating characters.

func lengthOfLongestSubstring(_ s: String) -> Int {
    var s = Array(s)
    var window = Set<Character>()
    var result = 0

    for (i, character) in s.enumerated() {
        while window.contains(character) {
            window.remove(s[i - window.count])
        }

        window.insert(character)
        result = max(result, window.count)
    }

    return result
}


print(lengthOfLongestSubstring("abcabcbb"))
print(lengthOfLongestSubstring("bbbbb"))
print(lengthOfLongestSubstring("pwwkew"))