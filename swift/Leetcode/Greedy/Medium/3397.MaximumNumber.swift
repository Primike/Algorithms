// You are allowed to perform the following operation on each 
// element of the array at most once:
// Add an integer in the range [-k, k] to the element.
// Return the maximum possible number of distinct elements in 
// nums after performing the operations.

// Time: O(n * log(n)), Space: O(1)
func maxDistinctElements(_ nums: [Int], _ k: Int) -> Int {
    var nums = nums.sorted()
    nums[0] = nums[0] - k
    var result = 1

    for i in 1..<nums.count {
        nums[i] = min(max(nums[i - 1] + 1, nums[i] - k), nums[i] + k)
        if nums[i] != nums[i - 1] { result += 1 }
    }

    return result
}

print(maxDistinctElements([1,2,2,3,3,4], 2))
print(maxDistinctElements([4,4,4,4], 1))