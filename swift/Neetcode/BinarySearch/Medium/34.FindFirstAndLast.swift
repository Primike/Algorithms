// Given an array of integers nums sorted in non-decreasing order, 
// find the starting and ending position of a given target value.
// If target is not found in the array, return [-1, -1].

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    func search(_ leftBias: Bool) -> Int {
        var left = 0, right = nums.count - 1
        var i = -1
        
        while left <= right {
            let mid = (left + right) / 2

            if nums[mid] > target {
                right = mid - 1
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                i = mid
                
                if leftBias {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        
        return i
    }

    let left = search(true)
    let right = search(false)
    return [left, right]
}

print(searchRange([5,7,7,8,8,10], 8))
print(searchRange([5,7,7,8,8,10], 6))
print(searchRange([], 0))