// Given a string s of zeros and ones, return the maximum score 
// after splitting the string into two non-empty substrings 
// (i.e. left substring and right substring).
// The score after splitting a string is the number of zeros in 
// the left substring plus the number of ones in the right substring.

// Time: O(n), Space: O(1)
func maxScore(_ s: String) -> Int {
    let s = Array(s)
    var zeros = s[0] == "0" ? 1 : 0
    var ones = s[1...].filter { $0 == "1" }.count
    var result = zeros + ones

    for i in 1..<(s.count - 1) {
        if s[i] == "1" { ones -= 1 }
        if s[i] == "0" { zeros += 1 }
        result = max(result, zeros + ones)
    }
    
    return result
}

print(maxScore("011101"))
print(maxScore("00111"))
print(maxScore("1111"))