// Return the number of different expressions that you can build, which evaluates to target.

func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    var memo = [String: Int]()

    func dp(_ i: Int, _ current: Int) -> Int {
        let key = "\(i)_\(current)"
        if let previous = memo[key] { return previous }
        if i >= nums.count { return current == target ? 1 : 0 }

        memo[key] = dp(i + 1, current + nums[i]) + dp(i + 1, current - nums[i])
        return memo[key, default: 0]
    }

    return dp(0, 0)
}

print(findTargetSumWays([1,1,1,1,1], 3))
print(findTargetSumWays([1], 1))