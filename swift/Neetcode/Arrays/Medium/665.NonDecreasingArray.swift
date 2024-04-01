// Given an array nums with n integers, your task is to check 
// if it could become non-decreasing by modifying at most one element.

//Time: O(n), Space: O(1)
func checkPossibility(_ nums: [Int]) -> Bool {
    var nums = nums
    var result = 0

    for i in 1..<nums.count {
        if nums[i - 1] > nums[i] {
            if i > 1, nums[i - 2] > nums[i] { 
                nums[i] = nums[i - 1]
            }

            result += 1
        }
    }

    return result <= 1
}

print(checkPossibility([4,2,3]))
print(checkPossibility([4,2,1]))
print(checkPossibility([1,2,3,2,1]))
print(checkPossibility([1,3,3,2,3,3]))
print(checkPossibility([3,4,2,3]))