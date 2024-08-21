// Return true if Player 1 can win the game. If the scores of both players are equal, 
// then player 1 is still the winner, and you should also return true. 
// You may assume that both players are playing optimally.

// Time: O(n^2), Space: O(n^2)
func predictTheWinner(_ nums: [Int]) -> Bool {
    var tab = Array(repeating: Array(repeating: 0, count: nums.count), count: nums.count)

    for i in (0..<nums.count).reversed() {
        for j in i..<nums.count {
            if i == j {
                tab[i][j] = nums[i]
            } else {
                let first = nums[i] - tab[i + 1][j]
                let last = nums[j] - tab[i][j - 1]
                tab[i][j] = max(first, last)
            }
        }
    }

    return tab[0][nums.count - 1] >= 0
}

print(predictTheWinner([1,5,2]))
print(predictTheWinner([1,5,233,7]))


func predictTheWinner2(_ nums: [Int]) -> Bool {
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