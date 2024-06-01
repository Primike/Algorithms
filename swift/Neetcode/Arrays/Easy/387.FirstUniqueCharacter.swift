// Given a string s, find the first non-repeating character in it 
// and return its index. If it does not exist, return -1.

// Time: O(n), Space: O(1)
func firstUniqChar(_ s: String) -> Int {
    let s = Array(s)
    var dict = [Character: (Int, Int)]()

    for (i, letter) in s.enumerated() {
        if dict.keys.contains(letter) { 
            dict[letter, default: (0, 0)].1 += 1
        } else {
            dict[letter] = (i, 1)
        }
    }

    var result = Int.max

    for (key, value) in dict {
        if value.1 == 1 { result = min(result, value.0) }
    }

    return result == .max ? -1 : result
}

print(firstUniqChar("leetcode"))
print(firstUniqChar("loveleetcode"))
print(firstUniqChar("aabb"))