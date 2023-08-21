//Given the array nums after the possible rotation and an integer target, 
//return the index of target if it is in nums, or -1 if it is not in nums.

func search(_ nums: [Int], _ target: Int) -> Int {
    var left = 0, right = nums.count - 1

    while left <= right {
        let mid = (right + left) / 2

        if nums[mid] == target {
            return mid
        } else if nums[mid] >= nums[left] {
            if nums[mid] < target || target < nums[left] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        } else {
            if target < nums[mid] || target > nums[right] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
    }

    return -1
}

print(search([4,5,6,7,0,1,2], 0))
print(search([4,5,6,7,0,1,2], 3))
print(search([1], 0))