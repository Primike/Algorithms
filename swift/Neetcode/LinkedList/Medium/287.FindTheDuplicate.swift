// Given an array of integers nums containing n + 1 integers where 
// each integer is in the range [1, n] inclusive.
// There is only one repeated number in nums, return this repeated number.

func findDuplicate(_ nums: [Int]) -> Int {
    var slow = 0, fast = 0
    
    while true {
        slow = nums[slow]
        fast = nums[nums[fast]]
        if slow == fast { break }
    }

    var slow2 = 0
    while true {
        slow = nums[slow]
        slow2 = nums[slow2]
        if slow == slow2 { return slow }
    }
}

print(findDuplicate([1,3,4,2,2]))
print(findDuplicate([3,1,3,4,2]))


func findDuplicate2(_ nums: [Int]) -> Int {
    var nums = nums

    for i in 0..<nums.count {
        let index = abs(nums[i]) - 1

        if nums[index] < 0 { return abs(nums[i]) }

        nums[index] *= -1
    }

    return -1
}