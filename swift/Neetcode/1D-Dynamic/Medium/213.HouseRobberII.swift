// Given an integer array nums representing the amount of money of each house, 
// return the maximum amount of money you can rob tonight without alerting the police.

//Time: O(n), Space: O(1)
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


func rob2(_ nums: [Int]) -> Int {
    if nums.count == 1 { return nums[0] }
        
    func dp(_ nums: [Int]) -> Int {
        var tab = Array(repeating: 0, count: nums.count + 2)

        for i in 0..<nums.count {
            tab[i + 2] = max(tab[i] + nums[i], tab[i + 1])
        }

        return tab[tab.count - 1]
    }

    return max(dp(Array(nums[1...])), dp(Array(nums[..<(nums.count - 1)])))
}

func rob3(_ nums: [Int]) -> Int {
    var memo = [String: Int]()

    func dp(_ i: Int, _ last: Int) -> Int {
        let key = "\(i),\(last)"

        if i >= last { return 0 }
        if let value = memo[key] { return value }

        let result = max(dp(i + 2, last) + nums[i], dp(i + 1, last))
        memo[key] = result 
        return result
    }

    return max(dp(2, nums.count - 1) + nums[0], dp(1, nums.count))
}