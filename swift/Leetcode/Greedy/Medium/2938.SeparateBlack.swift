// You are given a 0-indexed binary string s of length n, 
// where 1 and 0 represent black and white balls, respectively.
// In each step, you can choose two adjacent balls and swap them.
// Return the minimum number of steps to group all the black balls 
// to the right and all the white balls to the left.

// Time: O(n), Space: O(1)
func minimumSteps(_ s: String) -> Int {
    let s = Array(s)
    var result = 0
    var current = 0

    for i in (0..<s.count).reversed() {
        if s[i] == "0" {
            current += 1
        } else if s[i] == "1" {
            result += current
        }
    }

    return result
}

print(minimumSteps("101"))
print(minimumSteps("100"))
print(minimumSteps("0111"))