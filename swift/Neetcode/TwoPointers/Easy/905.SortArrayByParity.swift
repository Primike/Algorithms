// Given an integer array nums, move all the even integers 
// at the beginning of the array followed by all the odd integers.
// Return any array that satisfies this condition.

// Time: O(n), Space: O(1)
func sortArrayByParity(_ nums: [Int]) -> [Int] {
    var nums = nums
    var left = 0

    for i in 0..<nums.count {
        if nums[i] % 2 == 0 { 
            nums.swapAt(left, i) 
            left += 1
        }
    }

    return nums
}

print(sortArrayByParity([3,1,2,4]))
print(sortArrayByParity([0]))