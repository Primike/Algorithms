// Return the number of different expressions that you can build, which evaluates to target.

func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
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

print(findTargetSumWays([1,1,1,1,1], 3))
print(findTargetSumWays([1], 1))