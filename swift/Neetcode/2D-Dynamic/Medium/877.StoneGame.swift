// Alice and Bob take turns, with Alice starting first. Each turn, 
// a player takes the entire pile of stones either from the beginning 
// or from the end of the row. Assuming Alice and Bob play optimally, 
// return true if Alice wins the game, or false if Bob wins.

func stoneGame(_ piles: [Int]) -> Bool {
    let n = piles.count
    var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

    for i in 0..<n {
        dp[i][i] = piles[i]
    }

    for i in 2...n {
        for j in 0...(n - i) {
            let k = j + i - 1
            let left = piles[j] - dp[j + 1][k]
            let right = piles[k] - dp[j][k - 1]
            
            dp[j][k] = max(left, right)
        }
    }

    return dp[0][n - 1] > 0
}


print(stoneGame([5,3,4,5]))
print(stoneGame([3,7,2,3]))


func stoneGame2(_ piles: [Int]) -> Bool {
    let target = (piles.reduce(0, +) / 2) + 1
    var memo = [String: Int]()

    func dp(_ i: Int, _ j: Int, _ alice: Bool) -> Int {
        let key = "\(i),\(j),\(alice)"

        if i > j { return 0 }
        if let value = memo[key] { return value }

        var result = 0

        if alice {
            result = max(piles[i] + dp(i + 1, j, !alice), piles[j] + dp(i, j - 1, !alice))
        } else {
            result = min(dp(i + 1, j, !alice), dp(i, j - 1, !alice))
        }

        memo[key] = result
        return result
    }

    return dp(0, piles.count - 1, true) >= target
}