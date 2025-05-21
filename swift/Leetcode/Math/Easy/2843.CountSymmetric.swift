// You are given two positive integers low and high.
// An integer x consisting of 2 * n digits is symmetric 
// if the sum of the first n digits of x is equal to t
// he sum of the last n digits of x. Numbers with an 
// odd number of digits are never symmetric.
// Return the number of symmetric integers in the range [low, high].

// Time: O(n * log10(n)), Space: O(1)
func countSymmetricIntegers(_ low: Int, _ high: Int) -> Int {
    var result = 0

    for i in low...high {
        let digitCount = Int(floor(log10(Double(i)))) + 1

        if digitCount % 2 != 0 { continue }

        var current = i
        var left = 0, right = 0
        var count = 0

        while current > 0 {
            let digit = current % 10
            current /= 10

            if count < digitCount / 2 {
                right += digit
            } else {
                left += digit
            }

            count += 1
        }

        if left == right { result += 1 }
    }

    return result
}

print(countSymmetricIntegers(1, 100))
print(countSymmetricIntegers(1200, 1230))