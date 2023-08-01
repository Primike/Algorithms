//Given an integer array nums and an integer val,
//remove all occurrences of val in nums in-place. 
//The relative order of the elements may be changed.

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var left = 0, right = nums.count - 1

    while left <= right {
        if nums[left] == val {
            nums.swapAt(left, right)
            right -= 1
        } else {
            left += 1
        }
    }

    return right + 1
}

print(removeElement([3,2,2,3], 3))
print(removeElement([0,1,2,2,3,0,4,2], 2))