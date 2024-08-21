// Alice and Bob take turns, with Alice starting first. Each turn, 
// a player takes the entire pile of stones either from the beginning 
// or from the end of the row. Assuming Alice and Bob play optimally, 
// return true if Alice wins the game, or false if Bob wins.

// Time: O(n^2), Space: O(n^2)
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
    var memo = [String: Int]()

    func dp(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if i == j { return piles[i] }
        if let value = memo[key] { return value }

        let first = piles[i] - dp(i + 1, j)
        let last = piles[j] - dp(i, j - 1)
        let result = max(first, last)

        memo[key] = result
        return result
    }

    return dp(0, piles.count - 1) >= 0
}

func stoneGame3(_ piles: [Int]) -> Bool {
    var memo = [[Int]: Int]()

    func dp(_ i: Int, _ j: Int) -> Int {
        let key = [i, j]

        if i == j { return piles[i] }
        if let value = memo[key] { return value }

        var result = 0

        if (i + j) % 2 == 0 {
            result = min(dp(i + 1, j) - piles[i], dp(i, j - 1) - piles[j])
        } else {
            result = max(dp(i + 1, j) + piles[i], dp(i, j - 1) + piles[j])
        }

        memo[key] = result
        return result
    }

    let points = dp(0, piles.count - 1)
    return points > 0
}