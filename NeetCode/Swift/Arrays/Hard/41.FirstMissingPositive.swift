//Given an unsorted integer array nums, 
//return the smallest missing positive integer.
//You must implement an algorithm that runs in 
//O(n) time and uses constant extra space.

func firstMissingPositive(_ nums: [Int]) -> Int {
    var nums = nums
    var left = 0
    var right = nums.count - 1

    while left <= right {
        if nums[left] <= 0 {
            nums.swapAt(left, right)
            right -= 1
        } else {
            left += 1
        }
    }

    for i in 0..<right+1 {
        var number = abs(nums[i]) - 1
        if number < right+1 {
            let value = nums[number]
            if value > 0 {
                nums[number] = -value
            }
        }
    }

    for i in 0..<right+1 {
        if nums[i] > 0 {
            return i + 1
        }
    }

    return right + 2
}

print(firstMissingPositive([1,2,0]))
print(firstMissingPositive([3,4,-1,1]))
print(firstMissingPositive([7,8,9,11,12]))