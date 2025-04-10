// You are given an integer array nums and an integer k.
// An integer h is called valid if all values in the array 
// that are strictly greater than h are identical.
// You are allowed to perform the following operation on nums:
// Select an integer h that is valid for the current values in nums.
// For each index i where nums[i] > h, set nums[i] to h.
// Return the minimum number of operations required 
// to make every element in nums equal to k. 
// If it is impossible to make all elements equal to k, return -1.

// Time: O(n), Space: O(n)
func minOperations(_ nums: [Int], _ k: Int) -> Int {
    var numbers = Set<Int>()

    for i in 0..<nums.count {
        if nums[i] < k { return -1 }
        if nums[i] == k { continue }
        
        numbers.insert(nums[i])
    }

    return numbers.count
}

print(minOperations([5,2,5,4,5], 2))
print(minOperations([2,1,2], 2))
print(minOperations([9,7,5,3], 1))