// In one operation, you must:
// Choose an integer i such that 1 <= i < n and nums[i] > 0.
// Decrease nums[i] by 1.
// Increase nums[i - 1] by 1.
// Return the minimum possible value of the maximum integer 
// of nums after performing any number of operations.

// Time: O(n), Space: O(1)
func minimizeArrayValue(_ nums: [Int]) -> Int {
    var result = 0, current = 0

    for i in 0..<nums.count {
        current += nums[i]
        result = max(result, (current + i) / (i + 1))
    }

    return result
}

print(minimizeArrayValue([3,7,1,6]))
print(minimizeArrayValue([10,1]))