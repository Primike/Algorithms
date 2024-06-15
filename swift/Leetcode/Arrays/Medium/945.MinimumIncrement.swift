// You are given an integer array nums. In one move, 
// you can pick an index i where 0 <= i < nums.length and 
// increment nums[i] by 1.
// Return the minimum number of moves to make every value 
// in nums unique.

// Time: O(n * log(n)), Space: O(1)
func minIncrementForUnique(_ nums: [Int]) -> Int {
    var nums = nums.sorted()
    var result = 0
    
    for i in 1..<nums.count {
        if nums[i] <= nums[i - 1] {
            let value = nums[i - 1] - nums[i] + 1
            result += value
            nums[i] += value
        }
    }

    return result
}

print(minIncrementForUnique([1,2,2]))
print(minIncrementForUnique([3,2,1,2,1,7]))