//Given an unsorted integer array nums, 
//return the smallest missing positive integer.
//You must implement an algorithm that runs in 
//O(n) time and uses constant extra space.

func firstMissingPositive(_ nums: [Int]) -> Int {
    var nums = nums

    for i in 0..<nums.count {
        if nums[i] < 0 { nums[i] = 0 }
    }

    for i in 0..<nums.count {
        let number = abs(nums[i])

        if 1 <= number, number <= nums.count {
            if nums[number - 1] > 0 {
                nums[number - 1] *= -1
            } else if nums[number - 1] == 0 {
                nums[number - 1] = -1 * (nums.count + 1)
            }
        }
    }

    for i in 1...nums.count {
        if nums[i - 1] >= 0 { return i }
    }

    return nums.count + 1
}

print(firstMissingPositive([1,2,0]))
print(firstMissingPositive([3,4,-1,1]))
print(firstMissingPositive([7,8,9,11,12]))