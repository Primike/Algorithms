// Given a non-negative integer c, decide whether there're two 
// integers a and b such that a2 + b2 = c.

// Time: O(sqrt(n)), Space: O(1)
func judgeSquareSum(_ c: Int) -> Bool {
    var left = 0, right = Int(pow(Double(c), 0.5)) + 1

    while left <= right {
        let sum = left * left + right * right

        if sum > c {
            right -= 1
        } else if sum < c {
            left += 1
        } else {
            return true
        }
    }

    return false
}

print(judgeSquareSum(5))
print(judgeSquareSum(3))