// You are further given two integers lower and upper 
// that describe the inclusive range of values [lower, upper] 
// that the hidden sequence can contain.
// For example, given differences = [1, -3, 4], lower = 1, 
// upper = 6, the hidden sequence is a sequence of length 4 
// whose elements are in between 1 and 6 (inclusive).
// [3, 4, 1, 5] and [4, 5, 2, 6] are possible hidden sequences.
// [5, 6, 3, 7] is not possible since it contains an 
// element greater than 6.
// [1, 2, 3, 4] is not possible since the differences are not correct.
// Return the number of possible hidden sequences there are. 
// If there are no possible sequences, return 0.

// Time: O(n), Space: O(1)
func numberOfArrays(_ differences: [Int], _ lower: Int, _ upper: Int) -> Int {
    var current = 0
    var maximum = 0
    var minimum = 0

    for number in differences {
        current += number
        maximum = max(maximum, current)
        minimum = min(minimum, current)
    }

    let difference = maximum - minimum
    return max(0, upper - lower - difference + 1)
}

print(numberOfArrays([1,-3,4], 1, 6))
print(numberOfArrays([3,-4,5,1,-2], -4, 5))
print(numberOfArrays([4,-7,2], 3, 6))