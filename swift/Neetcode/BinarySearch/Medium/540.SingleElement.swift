// You are given a sorted array consisting of only integers where every element 
// appears exactly twice, except for one element which appears exactly once.
// Return the single element that appears only once.

// Time: O(n), Space: O(1)
func singleNonDuplicate(_ nums: [Int]) -> Int {
    var left = 0, right = nums.count - 1

    while left < right {
        let mid = (right + left) / 2

        if mid % 2 == 0 {
            if nums[mid] == nums[mid + 1] {
                left = mid + 1
            } else {
                right = mid
            }
        } else {
            if nums[mid] != nums[mid + 1] {
                left = mid + 1
            } else {
                right = mid
            }
        }
    }

    return nums[left]
}

print(singleNonDuplicate([1,1,2,3,3,4,4,8,8]))
print(singleNonDuplicate([3,3,7,7,10,11,11]))


func singleNonDuplicate2(_ nums: [Int]) -> Int {
    var left = 0, right = nums.count - 1

    while left < right {
        let mid = (right + left) / 2

        if mid > 0, nums[mid] == nums[mid - 1] {
            if mid % 2 == 0 {
                right = mid - 1
            } else {
                left = mid + 1
            }
        } else if mid < nums.count - 1, nums[mid] == nums[mid + 1] {
            if mid % 2 != 0 {
                right = mid - 1
            } else {
                left = mid + 1
            }
        } else {    
            return nums[mid]
        }
    }

    return nums[left]
}