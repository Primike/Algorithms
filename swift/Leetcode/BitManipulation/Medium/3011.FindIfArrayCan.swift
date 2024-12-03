// In one operation, you can swap any two adjacent elements 
// if they have the same number of set bits
// You are allowed to do this operation any number of times (including zero).
// Return true if you can sort the array in ascending order, else return false.

func canSortArray(_ nums: [Int]) -> Bool {
    var nums = nums

    for i in 0..<(nums.count - 1) {
        if nums[i] <= nums[i + 1] {
            continue
        } else if nums[i].nonzeroBitCount == nums[i + 1].nonzeroBitCount {
            let temp = nums[i]
            nums[i] = nums[i + 1]
            nums[i + 1] = temp
        } else {
            return false
        }
    }

    for i in stride(from: nums.count - 1, to: 0, by: -1) {
        if nums[i] >= nums[i - 1] {
            continue
        } else if nums[i].nonzeroBitCount == nums[i - 1].nonzeroBitCount {
            let temp = nums[i]
            nums[i] = nums[i - 1]
            nums[i - 1] = temp
        } else {
            return false
        }
    }

    return true
}

print(canSortArray([8,4,2,30,15]))
print(canSortArray([1,2,3,4,5]))
print(canSortArray([3,16,8,4,2]))