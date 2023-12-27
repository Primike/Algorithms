// Given a string s of zeros and ones, return the maximum score 
// after splitting the string into two non-empty substrings 
// (i.e. left substring and right substring).
// The score after splitting a string is the number of zeros in 
// the left substring plus the number of ones in the right substring.

func maxScore(_ s: String) -> Int {
    let s = Array(s)
    var ones = 0, zeros = 0
    var netZeros = Int.min

    for i in 0..<(s.count - 1) {
        if s[i] == "1" {
            ones += 1
        } else {
            zeros += 1
        }

        netZeros = max(netZeros, zeros - ones)
    }

    if s[s.count - 1] == "1" { ones += 1 }

    return netZeros + ones
}

print(maxScore("011101"))
print(maxScore("00111"))
print(maxScore("1111"))