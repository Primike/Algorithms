// Given an integer array nums representing the amount of money of each house, 
// return the maximum amount of money you can rob tonight without alerting the police.

func rob(_ nums: [Int]) -> Int {
    if nums.count == 1 { return nums[0] }
    
    func steal(_ start: Int) -> Int {
        if start == nums.count { return 0 }

        var previous = 0, current = 0
        let end = nums.count - 1 + start

        for i in start..<end {
            let temp = current
            current = max(current, previous + nums[i])
            previous = temp
        }

        return current
    }

    return max(steal(0), steal(1))
}

print(rob([2,3,2]))
print(rob([1,2,3,1]))
print(rob([1,2,3]))