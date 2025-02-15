// You are given a string s consisting of the characters 
// 'a', 'b', and 'c' and a non-negative integer k. 
// Each minute, you may take either the leftmost character of s, 
// or the rightmost character of s.
// Return the minimum number of minutes needed for you to take 
// at least k of each character, or return -1 if it is not possible 
// to take k of each character.

func takeCharacters(_ s: String, _ k: Int) -> Int {
    let s = Array(s)
    var count = Array(repeating: 0, count: 3)

    for c in s {
        count[Int(c.asciiValue!) - Int(Character("a").asciiValue!)] += 1
    }

    for i in 0..<3 {
        if count[i] < k {
            return -1
        }
    }

    var window = [Int](repeating: 0, count: 3)
    var left = 0
    var maxWindow = 0

    for right in 0..<s.count {
        window[Int(s[right].asciiValue!) - Int(Character("a").asciiValue!)] += 1

        while left <= right &&
                (count[0] - window[0] < k ||
                count[1] - window[1] < k ||
                count[2] - window[2] < k) {
            window[Int(s[left].asciiValue!) - Int(Character("a").asciiValue!)] -= 1
            left += 1
        }

        maxWindow = max(maxWindow, right - left + 1)
    }

    return s.count - maxWindow
}

print(takeCharacters("aabaaaacaabc", 2))
print(takeCharacters("a", 1))