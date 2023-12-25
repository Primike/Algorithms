// Given an array of integers nums sorted in non-decreasing order, 
// find the starting and ending position of a given target value.
// If target is not found in the array, return [-1, -1].

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    var start = 0, end = nums.count - 1

    while start < end {
        let mid = (end + start) / 2

        if nums[mid] >= target {
            end = mid
        } else {
            start = mid + 1
        }
    }

    if nums.isEmpty || nums[end] != target { return [-1, -1] }
    
    var left = 0, right = nums.count - 1

    while left < right {
        let mid = (left + right) / 2

        if nums[mid] < target || nums[mid + 1] == target {
            left = mid + 1
        } else {
            right = mid
        }
    }
    
    return [start, right]
}

print(searchRange([5,7,7,8,8,10], 8))
print(searchRange([5,7,7,8,8,10], 6))
print(searchRange([], 0))