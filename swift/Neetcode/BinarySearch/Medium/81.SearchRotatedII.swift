// Given the array nums after the rotation and an integer target, 
// return true if target is in nums, or false if it is not in nums.

func search(_ nums: [Int], _ target: Int) -> Bool {
    var left = 0, right = nums.count - 1

    while left <= right {
        let mid = (right + left) / 2

        if nums[mid] == target {
            return true
        } else if nums[mid] > nums[left] {
            if target >= nums[left], target < nums[mid] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        } else if nums[mid] < nums[left] {
            if target <= nums[right], target > nums[mid] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        } else {
            left += 1
        }
    }

    return false
}

print(search([2,5,6,0,0,1,2], 0))
print(search([2,5,6,0,0,1,2], 3))