// Given an integer array nums, reorder it such that 
// nums[0] <= nums[1] >= nums[2] <= nums[3]....

// Time: O(n), Space: O(1)
func wiggleSort(_ nums: inout [Int]) {
    for i in 1..<nums.count {
        if (i % 2 == 1) == (nums[i - 1] > nums[i]) {
            nums.swapAt(i, i - 1) 
        }
    }
}

print(wiggleSort([3,5,2,1,6,4]))
print(wiggleSort([6,6,5,6,3,8]))