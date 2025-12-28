class Solution {
    func minDeletionSize(_ A: [String]) -> Int {
        let numRows = A.count
        let numCols = A[0].count
        let grid = A.map { Array($0) }
        var dp = Array(repeating: 1, count: numCols)

        for i in stride(from: numCols - 2, through: 0, by: -1) {
            for j in i + 1..<numCols {
                let isOrdered = (0..<numRows).allSatisfy { row in
                    grid[row][i] <= grid[row][j]
                }

                if isOrdered {
                    dp[i] = max(dp[i], 1 + dp[j])
                }
            }
        }

        return numCols - (dp.max() ?? 0)
    }
}