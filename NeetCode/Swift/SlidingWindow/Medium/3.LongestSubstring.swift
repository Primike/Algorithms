//Given a string s, find the length of the longest substring
//without repeating characters.

func lengthOfLongestSubstring(_ s: String) -> Int {
    var wordSet = Set<Character>()
    var leftIndex = s.startIndex
    var rightIndex = s.startIndex
    var result = 0

    while rightIndex != s.endIndex {
        let rightChar = s[rightIndex]

        if wordSet.contains(rightChar) {
            wordSet.remove(s[leftIndex])
            leftIndex = s.index(after: leftIndex)
            continue
        }

        wordSet.insert(rightChar)
        rightIndex = s.index(after: rightIndex)
        result = max(result, s.distance(from: leftIndex, to: rightIndex))
    }

    return result
}

print(lengthOfLongestSubstring("abcabcbb"))
print(lengthOfLongestSubstring("bbbbb"))
print(lengthOfLongestSubstring("pwwkew"))