// Given a 0-indexed integer array nums, find a peak element, 
// and return its index. If the array contains multiple peaks, 
// return the index to any of the peaks.

func findPeakElement(_ nums: [Int]) -> Int {
    var left = 0, right = nums.count - 1

    while left < right {
        let mid = (right + left) / 2

        if nums[mid] < nums[mid + 1] {
            left = mid + 1
        } else {
            right = mid
        }
    }

    return left
}

print(findPeakElement([1,2,3,1]))
print(findPeakElement([1,2,1,3,5,6,4]))