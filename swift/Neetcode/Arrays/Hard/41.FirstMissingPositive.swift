//Given an unsorted integer array nums, 
//return the smallest missing positive integer.
//You must implement an algorithm that runs in 
//O(n) time and uses constant extra space.

// Time: n, Space: 1
func firstMissingPositive(_ nums: [Int]) -> Int {
    var nums = nums

    for i in 0..<nums.count {
        if nums[i] <= 0 { nums[i] = nums.count + 1 }
    }

    for n in nums {
        let number = abs(n)

        if number <= nums.count { nums[number - 1] = -abs(nums[number - 1]) }
    }

    for i in 0..<nums.count {
        if nums[i] > 0 { return i + 1 }
    }

    return nums.count + 1
}

print(firstMissingPositive([1,2,0]))
print(firstMissingPositive([3,4,-1,1]))
print(firstMissingPositive([7,8,9,11,12]))