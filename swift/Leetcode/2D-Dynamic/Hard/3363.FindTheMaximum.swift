class Solution {
    func maxCollectedFruits(_ fruits: [[Int]]) -> Int {
        var mutableFruits = fruits
        let n = mutableFruits.count
        guard n > 0 else { return 0 }

        var totalSum = 0
        for i in 0..<n {
            totalSum += mutableFruits[i][i]
        }

        totalSum += solveDP(on: mutableFruits)
        
        for i in 0..<n {
            for j in (i + 1)..<n {
                (mutableFruits[i][j], mutableFruits[j][i]) = (mutableFruits[j][i], mutableFruits[i][j])
            }
        }

        totalSum += solveDP(on: mutableFruits)

        return totalSum
    }

    private func solveDP(on matrix: [[Int]]) -> Int {
        let n = matrix.count
        guard n > 1 else { return 0 }

        var dp = Array(repeating: Int.min, count: n)
        
        dp[n - 1] = matrix[0][n - 1]

        for i in 1..<(n - 1) {
            var nextDp = Array(repeating: Int.min, count: n)
            
            for j in max(n - 1 - i, i + 1)..<n {
                
                var maxFromPrev = Int.min
                for move in -1...1 {
                    let prevCol = j + move
                    if prevCol >= 0 && prevCol < n && dp[prevCol] > Int.min {
                        maxFromPrev = max(maxFromPrev, dp[prevCol])
                    }
                }
                
                if maxFromPrev > Int.min {
                    nextDp[j] = matrix[i][j] + maxFromPrev
                }
            }
            dp = nextDp
        }
        
        let finalValue = dp[n - 1]
        
        return finalValue > Int.min ? finalValue : 0
    }
}