//Given an array nums with n integers, your task is to check 
//if it could become non-decreasing by modifying at most one element.

func checkPossibility(_ nums: [Int]) -> Bool {
    var count = 0
    var nums = nums

    for i in 0..<(nums.count - 1) {
        if nums[i] <= nums[i + 1] {
            continue
        }

        if i == 0 || nums[i + 1] >= nums[i - 1] {
            nums[i] = nums[i + 1]
        } else {
            nums[i + 1] = nums[i]
        }

        count += 1
    }

    return count < 2
}

print(checkPossibility([4,2,3]))
print(checkPossibility([4,2,1]))
print(checkPossibility([1,2,3,2,1]))
print(checkPossibility([1,3,3,2,3,3]))