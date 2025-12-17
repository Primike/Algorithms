// Left subarray contains indices [0, i].
// Right subarray contains indices [i + 1, n - 1].
// Return the number of partitions where the difference between 
// the sum of the left and right subarrays is even.

// Time: O(n), Space: O(1)
func countPartitions(_ nums: [Int]) -> Int {
    var result = 0
    var rightSum = nums.reduce(0, +)
    var leftSum = 0

    for i in 0..<(nums.count - 1) {
        leftSum += nums[i]
        rightSum -= nums[i]
        
        if (rightSum - leftSum) % 2 == 0 { result += 1 } 
    }

    return result
}

print(countPartitions([10,10,3,7,6]))
print(countPartitions([1,2,2]))
print(countPartitions([2,4,6,8]))