// Given an integer array nums sorted in non-decreasing order, 
// return an array of the squares of each number sorted in non-decreasing order.

func sortedSquares(_ nums: [Int]) -> [Int] {
    var left = 0, right = nums.count - 1
    var result = [Int]()

    while left <= right {
        if abs(nums[left]) >= abs(nums[right]) {
            result.append(nums[left] * nums[left])
            left += 1
        } else {
            result.append(nums[right] * nums[right])
            right -= 1
        }
    }

    return result.reversed()
}

print(sortedSquares([-4,-1,0,3,10]))
print(sortedSquares([-7,-3,2,3,11]))