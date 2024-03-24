// Given an integer array nums sorted in non-decreasing order, 
// remove some duplicates in-place such that each unique element appears at most twice.
// The relative order of the elements should be kept the same.

// Time: O(n), Space: O(1)
func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.count <= 2 { return nums.count }

    var left = 2

    for i in 2..<nums.count {
        if nums[i] != nums[left - 2] {
            nums[left] = nums[i]
            left += 1
        }
    }

    return left
}

print(removeDuplicates([1,1,1,2,2,3]))
print(removeDuplicates([0,0,1,1,1,1,2,3,3]))