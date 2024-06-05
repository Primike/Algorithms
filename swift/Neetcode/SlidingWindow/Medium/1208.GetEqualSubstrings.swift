// You want to change s to t. Changing the ith character of 
// s to ith character of t costs |s[i] - t[i]| 
// (i.e., the absolute difference between the ASCII values of the characters).
// Return the maximum length of a substring of s that can be changed 
// to be the same as the corresponding substring of t with a cost 
// less than or equal to maxCost. 

// Time: O(n), Space: O(1)
func equalSubstring(_ s: String, _ t: String, _ maxCost: Int) -> Int {
    let s = Array(s), t = Array(t)
    var result = 0
    var left = 0
    var sum = 0

    for i in 0..<s.count {
        sum += abs(Int(s[i].asciiValue!) - Int(t[i].asciiValue!))

        if sum > maxCost { 
            sum -= abs(Int(s[left].asciiValue!) - Int(t[left].asciiValue!)) 
            left += 1
        } else {
            result = max(result, i - left + 1)
        }
    }

    return result
}

print(equalSubstring("abcd", "bcdf", 3))
print(equalSubstring("abcd", "cdef", 3))
print(equalSubstring("abcd", "acde", 0))