// Given an integer array nums representing the amount of money of each house, 
// return the maximum amount of money you can rob tonight without alerting the police.

//Time: n, Space: 1
func rob(_ nums: [Int]) -> Int {
    if nums.count == 1 { return nums[0] }
    
    var previous = 0, current = 0

    for i in 0..<nums.count - 1 {
        let temp = current
        current = max(current, previous + nums[i])
        previous = temp
    }

    var first = current
    previous = 0
    current = 0

    for i in 1..<nums.count {
        let temp = current
        current = max(current, previous + nums[i])
        previous = temp
    }

    return max(first, current)
}

print(rob([2,3,2]))
print(rob([1,2,3,1]))
print(rob([1,2,3]))