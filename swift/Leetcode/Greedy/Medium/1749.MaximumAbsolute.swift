// You are given an integer array nums. 
// The absolute sum of a subarray [numsl, 
// numsl+1, ..., numsr-1, numsr] is 
// abs(numsl + numsl+1 + ... + numsr-1 + numsr).
// Return the maximum absolute sum of any 
// (possibly empty) subarray of nums.

// Time: O(n), Space: O(1)
func maxAbsoluteSum(_ nums: [Int]) -> Int {
    var maximum = nums[0]
    var minimum = nums[0]
    var currentMax = 0
    var currentMin = 0

    for i in 0..<nums.count {
        currentMax += nums[i]
        currentMin += nums[i]

        maximum = max(maximum, currentMax)
        minimum = min(minimum, currentMin)

        if currentMax < 0 { currentMax = 0 }
        if currentMin > 0 { currentMin = 0 }
    }

    return max(maximum, abs(minimum))
}

print(maxAbsoluteSum([1,-3,2,3,-4]))
print(maxAbsoluteSum([2,-5,1,-4,3,-2]))