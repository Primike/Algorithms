// Given a string s, return the length of the longest substring 
// between two equal characters, excluding the two characters. 
// If there is no such substring return -1.

// Time: O(n), Space: O(26)
func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
    let s = Array(s)
    var dict = [Character: Int]()
    var result = -1

    for (i, letter) in s.enumerated() {
        if let index = dict[letter] {
            result = max(result, i - index - 1)
        } else {
            dict[letter] = i
        }
    }

    return result
}

print(maxLengthBetweenEqualCharacters("aa"))
print(maxLengthBetweenEqualCharacters("abca"))
print(maxLengthBetweenEqualCharacters("cbzxy"))