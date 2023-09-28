// Given a circular integer array nums of length n, return the maximum 
// possible sum of a non-empty subarray of nums.

func maxSubarraySumCircular(_ nums: [Int]) -> Int {
    var globalMax = nums[0], globalMin = nums[0]
    var currentMax = 0, currentMin = 0

    for number in nums {
        currentMax = max(currentMax + number, number)
        currentMin = min(currentMin + number, number)

        globalMax = max(currentMax, globalMax)
        globalMin = min(currentMin, globalMin)
    }

    var total = nums.reduce(0, +)

    return globalMax > 0 ? max(globalMax, total - globalMin) : globalMax
}

print(maxSubarraySumCircular([1,-2,3,-2]))
print(maxSubarraySumCircular([5,-3,5]))
print(maxSubarraySumCircular([-3,-2,-3]))