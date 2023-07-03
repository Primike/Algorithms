//Given the sorted rotated array nums of unique elements, 
//return the minimum element of this array.

func findMin(_ nums: [Int]) -> Int {
    var left = 0, right = nums.count - 1

    while left < right {
        let mid = (right + left) / 2

        if nums[mid] > nums[right] {
            left = mid + 1
        } else {
            right = mid
        }
    }

    return nums[left]
}

print(findMin([3,4,5,1,2]))
print(findMin([4,5,6,7,0,1,2]))
print(findMin([11,13,15,17]))