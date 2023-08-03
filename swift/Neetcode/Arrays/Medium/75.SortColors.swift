//Given an array nums with n objects colored red, white, or blue, 
//sort them in-place so that objects of the same color are adjacent, 
//with the colors in the order red, white, and blue.
//We will use the integers 0, 1, and 2 to represent the color red,
//white, and blue, respectively.

func sortColors(_ nums: inout [Int]) {
    var left = 0, right = nums.count - 1
    var index = 0

    while index <= right {
        if nums[index] == 0 {
            nums.swapAt(left, index)
            left += 1
            index += 1
        } else if nums[index] == 2 {
            nums.swapAt(index, right)
            right -= 1
        } else {
            index += 1
        }
    }
}

print(sortColors([2,0,2,1,1,0]))
print(sortColors([2,0,1]))