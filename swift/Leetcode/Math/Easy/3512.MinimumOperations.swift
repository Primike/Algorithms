// You are given an integer array nums and an integer k. 
// You can perform the following operation any number of times:
// Select an index i and replace nums[i] with nums[i] - 1.
// Return the minimum number of operations required 
// to make the sum of the array divisible by k.

// Time: O(n), Space: O(1)
func minOperations(_ nums: [Int], _ k: Int) -> Int {
    return nums.reduce(0, +) % k
}

print(minOperations([3,9,7], 5))
print(minOperations([4,1,3], 4))
print(minOperations([3,2], 6))