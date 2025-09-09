// No-Zero integer is a positive integer that does not contain any 
// 0 in its decimal representation.
// Given an integer n, return a list of two integers [a, b] where:
// a and b are No-Zero integers.
// a + b = n

// Time: O(n * log10(n)), Space: O(1)
func getNoZeroIntegers(_ n: Int) -> [Int] {
    for i in 1...(n - 1) {
        var a = i
        var b = n - i
        var isValid = true

        while a > 0 || b > 0 {
            if a > 0, a % 10 == 0 { isValid = false }
            if b > 0, b % 10 == 0 { isValid = false }
            a /= 10
            b /= 10
        }

        if isValid { return [i, n - i] }
    }

    return [0, 0]
}

print(getNoZeroIntegers(2))
print(getNoZeroIntegers(11))