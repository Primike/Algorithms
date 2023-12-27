// You are given a string s consisting only of the characters '0' and '1'. 
// In one operation, you can change any '0' to '1' or vice versa.
// The string is called alternating if no two adjacent characters are equal.
// For example, the string "010" is alternating, while the string "0100" is not.
// Return the minimum number of operations needed to make s alternating.

func minOperations(_ s: String) -> Int {
    let s = Array(s)
    var zeros = 0, ones = 0

    for (i, number) in s.enumerated() {
        zeros += i % 2 == (number == "0" ? 0 : 1) ? 1 : 0
        ones += i % 2 == (number == "0" ? 1 : 0) ? 1 : 0
    }

    return min(zeros, ones)
}

print(minOperations("0100"))
print(minOperations("10"))
print(minOperations("1111"))