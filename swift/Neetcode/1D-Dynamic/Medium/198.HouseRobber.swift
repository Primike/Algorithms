// Given an integer array nums representing the amount of money of each house, 
// return the maximum amount of money you can rob tonight.

//Time: n, Space: 1
func rob(_ nums: [Int]) -> Int {
    var previous = 0, current = 0

    for number in nums {
        var temp = current
        current = max(previous + number, current)
        previous = temp
    }

    return current
}

print(rob([1,2,3,1]))
print(rob([2,7,9,3,1]))

func rob2(_ nums: [Int]) -> Int {
    if nums.count == 1 { return nums[0] }
    
    var tab = Array(repeating: 0, count: nums.count)
    tab[0] = nums[0]
    tab[1] = max(nums[0], nums[1])
    
    for i in 2..<nums.count {
        tab[i] = max(tab[i - 1], tab[i - 2] + nums[i])
    }
    
    return tab[tab.count - 1]
}

func rob3(_ nums: [Int]) -> Int {
    var memo = [Int: Int]()

    func dp(_ i: Int) -> Int {
        if i >= nums.count { return 0 }
        if let stored = memo[i] { return stored }

        memo[i] = max(nums[i] + dp(i + 2), dp(i + 1))
        return memo[i, default: 0]
    }

    return dp(0)
}