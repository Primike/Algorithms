// You are given an integer array nums. In one move, 
// you can pick an index i where 0 <= i < nums.length and 
// increment nums[i] by 1.
// Return the minimum number of moves to make every value 
// in nums unique.

// Time: O(n), Space: O(n)
func minIncrementForUnique(_ nums: [Int]) -> Int {
    var numbers = Array(repeating: 0, count: (nums.max() ?? 0) + nums.count)

    for number in nums {
        numbers[number] += 1
    }

    var result = 0
    var count = 0

    for i in 0..<numbers.count {
        if numbers[i] == 0, count > 0 { count -= 1 }
        if numbers[i] > 1 { count += numbers[i] - 1 }
        result += count
    }

    return result
}

print(minIncrementForUnique([1,2,2]))
print(minIncrementForUnique([3,2,1,2,1,7]))


// Time: O(n * log(n)), Space: O(1)
func minIncrementForUnique2(_ nums: [Int]) -> Int {
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