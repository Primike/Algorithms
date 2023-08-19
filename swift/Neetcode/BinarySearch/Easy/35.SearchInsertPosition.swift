// Given a sorted array of distinct integers and a target value, 
// return the index if the target is found. If not, 
// return the index where it would be if it were inserted in order.

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var left = 0, right = nums.count - 1

    while left <= right {
        let mid = (right + left) / 2

        if nums[mid] > target {
            right = mid - 1
        } else if nums[mid] < target {
            left = mid + 1
        } else {
            return mid
        }
    }

    return left
}

print(searchInsert([1,3,5,6], 0))
print(searchInsert([1,3,5,6], 2))
print(searchInsert([1,3,5,6], 7))