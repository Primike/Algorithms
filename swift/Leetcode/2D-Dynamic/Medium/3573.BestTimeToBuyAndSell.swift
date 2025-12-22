class Solution {
    func maximumProfit(_ prices: [Int], _ k: Int) -> Int {
        let n = prices.count
        if n == 0 { return 0 }

        var memo = Array(repeating: Array(repeating: Array(repeating: Int.min, count: 3), count: k + 1), count: n)

        func dfs(_ i: Int, _ j: Int, _ state: Int) -> Int {
            if j == 0 {
                return 0
            }
            if i == 0 {
                if state == 0 { return 0 }
                return state == 1 ? -prices[0] : prices[0]
            }
            if memo[i][j][state] != Int.min {
                return memo[i][j][state]
            }

            let p = prices[i]
            var res = 0

            if state == 0 {
                res = max(dfs(i - 1, j, 0), dfs(i - 1, j, 1) + p, dfs(i - 1, j, 2) - p)
            } else if state == 1 {
                res = max(dfs(i - 1, j, 1), dfs(i - 1, j - 1, 0) - p)
            } else {
                res = max(dfs(i - 1, j, 2), dfs(i - 1, j - 1, 0) + p)
            }

            memo[i][j][state] = res
            return res
        }

        return dfs(n - 1, k, 0)
    }
}