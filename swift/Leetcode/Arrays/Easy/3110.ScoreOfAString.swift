// You are given a string s. The score of a string 
// is defined as the sum of the absolute difference between 
// the ASCII values of adjacent characters.
// Return the score of s.

// Time: O(n), Space: O(1)
func scoreOfString(_ s: String) -> Int {
    let s = Array(s)
    var result = 0

    for i in 1..<s.count {
        result += abs(Int(s[i].asciiValue!) - Int(s[i - 1].asciiValue!))
    }

    return result
}

print(scoreOfString("hello"))
print(scoreOfString("zaz"))