// You are given a 0-indexed integer array nums. 
// An index i is part of a hill in nums if the closest 
// non-equal neighbors of i are smaller than nums[i]. 
// Similarly, an index i is part of a valley in nums if 
// the closest non-equal neighbors of i are larger than nums[i]. 
// Adjacent indices i and j are part of the same hill or valley 
// if nums[i] == nums[j].
// Note that for an index to be part of a hill or valley, 
// it must have a non-equal neighbor on both the left and right of the index.
// Return the number of hills and valleys in nums.

// Time: O(n), Space: O(1)
func countHillValley(_ nums: [Int]) -> Int {
    var result = 0
    var last = nums[0]
    var i = 1

    while i < nums.count {
        var j = i

        while j < nums.count, nums[i] == nums[j] {
            j += 1
        }

        if j < nums.count, nums[i] > last, nums[i] > nums[j] { result += 1 }
        if j < nums.count, nums[i] < last, nums[i] < nums[j] { result += 1 }
        
        last = nums[i]
        i = j
    }

    return result
}

print(countHillValley([2,4,1,1,6,5]))
print(countHillValley([6,6,5,5,4,1]))