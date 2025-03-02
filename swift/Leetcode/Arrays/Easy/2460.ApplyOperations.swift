// You need to apply n - 1 operations to this array where, 
// in the ith operation (0-indexed), 
// you will apply the following on the ith element of nums:
// If nums[i] == nums[i + 1], then multiply nums[i] by 2 
// and set nums[i + 1] to 0. Otherwise, you skip this operation.
// After performing all the operations, shift all the 0's to the end of the array.
// For example, the array [1,0,2,0,0,1] after shifting all its 
// 0's to the end, is [1,2,1,0,0,0].
// Return the resulting array.

// Time: O(n), Space: O(n)
func applyOperations(_ nums: [Int]) -> [Int] {
    var nums = nums 

    for i in 0..<(nums.count - 1) {
        if nums[i] == nums[i + 1] {
            nums[i] = nums[i] * 2
            nums[i + 1] = 0
        }
    }

    var numbers = [Int]()
    var zeros = [Int]()

    for number in nums {
        if number == 0 {
            zeros.append(0)
        } else {
            numbers.append(number)
        }
    }

    return numbers + zeros
}

print(applyOperations([1,2,2,1,1,0]))
print(applyOperations([0,1]))