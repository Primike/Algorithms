// Given an array nums, return true if the array was originally sorted 
// in non-decreasing order, then rotated some number of positions (including zero). 
// Otherwise, return false.
// There may be duplicates in the original array.

// Time: O(n), Space: O(1)
func check(_ nums: [Int]) -> Bool {
    var inRotation = false

    for i in 1..<nums.count {
        if inRotation, nums[i] < nums[i - 1] { return false }
        if nums[i] < nums[i - 1] { inRotation = true }
        if inRotation, nums[i] > nums[0] { return false } 
    }

    return true
}

print(check([3,4,5,1,2]))
print(check([2,1,3,4]))
print(check([1,2,3]))