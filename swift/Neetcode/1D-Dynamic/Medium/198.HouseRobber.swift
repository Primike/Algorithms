// Given an integer array nums representing the amount of money of each house, 
// return the maximum amount of money you can rob tonight.

//Time: O(n), Space: O(1)
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
    var tab = Array(repeating: 0, count: nums.count + 2)

    for i in 0..<nums.count {
        tab[i + 2] = max(tab[i] + nums[i], tab[i + 1])
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