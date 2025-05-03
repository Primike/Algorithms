// Given an array of integers nums sorted in non-decreasing order, 
// find the starting and ending position of a given target value.
// If target is not found in the array, return [-1, -1].

// Time: O(log(n)), Space: O(1)
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.isEmpty { return [-1, -1] }
    
    var left = 0, right = nums.count - 1

    while left < right {
        let mid = (right + left) / 2

        if nums[mid] >= target {
            right = mid
        } else {
            left = mid + 1
        }
    }

    if nums[left] != target { return [-1, -1] }

    var result = [left]
    left = 0
    right = nums.count - 1

    while left <= right {
        let mid = (right + left) / 2

        if nums[mid] <= target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return result + [right]
}

print(searchRange([5,7,7,8,8,10], 8))
print(searchRange([5,7,7,8,8,10], 6))
print(searchRange([], 0))