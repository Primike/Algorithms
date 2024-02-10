// Return the number of different expressions that you can build, which evaluates to target.

func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    let sum = nums.reduce(0, +)
    if abs(target) > sum { return 0 } 

    var tab = Array(repeating: Array(repeating: 0, count: 2 * sum + 1), count: nums.count + 1)
    tab[0][sum] = 1

    for i in 1...nums.count {
        for j in -sum...sum {
            let add = j + nums[i - 1], subtract = j - nums[i - 1]
            
            if add <= sum { tab[i][j + sum] += tab[i - 1][add + sum] }
            if subtract >= -sum { tab[i][j + sum] += tab[i - 1][subtract + sum] }
        }
    }

    return tab[nums.count][target + sum]
}

print(findTargetSumWays([1,1,1,1,1], 3))
print(findTargetSumWays([1], 1))


func findTargetSumWays2(_ nums: [Int], _ target: Int) -> Int {
    var memo = [String: Int]()

    func dp(_ index: Int, _ current: Int) -> Int {
        let key = "\(index),\(current)"

        if index == nums.count { return current == target ? 1 : 0 }
        if let value = memo[key] { return value }

        var result = 0

        result += dp(index + 1, current + nums[index])
        result += dp(index + 1, current - nums[index])

        memo[key] = result
        return result
    }

    return dp(0, 0)
}