// You are given a string s consisting of the characters 
// 'a', 'b', and 'c' and a non-negative integer k. 
// Each minute, you may take either the leftmost character of s, 
// or the rightmost character of s.
// Return the minimum number of minutes needed for you to take 
// at least k of each character, or return -1 if it is not possible 
// to take k of each character.

func takeCharacters(_ s: String, _ k: Int) -> Int {
    if k == 0 { return 0 }
    
    let s = Array(s).map { String($0) }
    var dict = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    if dict.keys.count < 3 || !dict.values.allSatisfy { $0 >= k } { return -1 }

    var window = ["a" : 0, "b": 0, "c": 0]
    var result = 0
    var left = 0

    for i in 0..<s.count {
        window[s[i], default: 0] += 1

        while left <= i,
                (dict["a"]! - window["a"]! < k ||
                dict["b"]! - window["b"]! < k ||
                dict["c"]! - window["c"]! < k) {
            window[s[left], default: 0] -= 1
            left += 1
        }

        result = max(result, i - left + 1)
    }

    return s.count - result
}

print(takeCharacters("aabaaaacaabc", 2))
print(takeCharacters("a", 1))