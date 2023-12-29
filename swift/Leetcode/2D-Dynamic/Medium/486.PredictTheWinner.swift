// Return true if Player 1 can win the game. If the scores of both players are equal, 
// then player 1 is still the winner, and you should also return true. 
// You may assume that both players are playing optimally.

func predictTheWinner(_ nums: [Int]) -> Bool {
    var memo = [String: Int]()

    func dp(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if i == j { return nums[i] }
        if let value = memo[key] { return value }

        let first = nums[i] - dp(i + 1, j)
        let last = nums[j] - dp(i, j - 1)
        let result = max(first, last)

        memo[key] = result
        return result
    }

    return dp(0, nums.count - 1) >= 0
}

print(predictTheWinner([1,5,2]))
print(predictTheWinner([1,5,233,7]))