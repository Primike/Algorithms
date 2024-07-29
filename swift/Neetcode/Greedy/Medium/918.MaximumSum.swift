// Given a circular integer array nums of length n, return the  
// maximum possible sum of a non-empty subarray of nums.

// Time: O(n), Space: O(1)
func maxSubarraySumCircular(_ nums: [Int]) -> Int {
    var maximum = Int.min, minimum = Int.max
    var currentMax = 0, currentMin = 0

    for number in nums {
        currentMax = max(currentMax + number, number)
        currentMin = min(currentMin + number, number)

        maximum = max(maximum, currentMax)
        minimum = min(minimum, currentMin)
    }

    let total = nums.reduce(0, +)
    if minimum == total { return maximum }

    return max(maximum, total - minimum)
}

print(maxSubarraySumCircular([1,-2,3,-2]))
print(maxSubarraySumCircular([5,-3,5]))
print(maxSubarraySumCircular([-3,-2,-3]))