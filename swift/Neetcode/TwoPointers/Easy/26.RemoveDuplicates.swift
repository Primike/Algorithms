//Given an integer array nums sorted in non-decreasing order, 
//remove the duplicates in-place such that each unique element appears only once. 
//The relative order of the elements should be kept the same.

// Time: O(n), Space: O(1)
func removeDuplicates(_ nums: inout [Int]) -> Int {
    var left = 1

    for i in 1..<nums.count {
        if nums[i - 1] != nums[i] {
            nums[left] = nums[i]
            left += 1
        }
    }

    return left
}

print(removeDuplicates([1,1,2]))
print(removeDuplicates([0,0,1,1,1,2,2,3,3,4]))