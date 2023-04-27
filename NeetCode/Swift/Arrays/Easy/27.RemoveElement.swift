//Given an integer array nums and an integer val,
//remove all occurrences of val in nums in-place. 
//The relative order of the elements may be changed.


func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var index = nums.count - 1
    var count = 0

    for i in stride(from: nums.count - 1, to: -1, by: -1) {
        if nums[i] == val {
            nums.swapAt(i, index)
            index -= 1
            count += 1
        }
    }

    return nums.count - count
}

print(removeElement([3,2,2,3], 3))
print(removeElement([0,1,2,2,3,0,4,2], 2))