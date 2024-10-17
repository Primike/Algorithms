// Given an integer array nums, return the largest integer 
// that only occurs once. If no integer occurs once, return -1.

// Time: O(n * log(n)), Space: O(1)
func largestUniqueNumber(_ nums: [Int]) -> Int {
    if nums.count == 1 { return nums[0] }

    let nums = nums.sorted()

    if nums[nums.count - 1] != nums[nums.count - 2] { return nums[nums.count - 1] }

    for i in (1..<(nums.count - 1)).reversed() {
        if nums[i] != nums[i - 1], nums[i] != nums[i + 1] {
            return nums[i]
        }
    }

    return nums[0] == nums[1] ? -1 : nums[0]
}

print(largestUniqueNumber([5,7,3,9,4,9,8,3,1]))
print(largestUniqueNumber([9,9,8,8]))