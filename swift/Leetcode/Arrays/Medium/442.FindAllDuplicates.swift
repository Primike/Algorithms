// Given an integer array nums of length n where all the integers 
// of nums are in the range [1, n] and each integer appears once 
// or twice, return an array of all the integers that appears twice.

// Time: O(n), Space: O(1)
func findDuplicates(_ nums: [Int]) -> [Int] {
    var nums = nums
    var result = [Int]()

    for i in 0..<nums.count {
        if nums[abs(nums[i]) - 1] < 0 {
            result.append(abs(nums[i]))
        } else {
            nums[abs(nums[i]) - 1] *= -1
        }
    }

    return result
}

print(findDuplicates([4,3,2,7,8,2,3,1]))
print(findDuplicates([1,1,2]))
print(findDuplicates([1]))