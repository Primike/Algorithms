// You are given a rows x cols matrix grid representing a field of 
// cherries where grid[i][j] represents the number of cherries that 
// you can collect from the (i, j) cell.
// Return the maximum number of cherries collection using both robots 

func cherryPickup(_ grid: [[Int]]) -> Int {
    let r = grid.count, c = grid[0].count
    var dp = Array(repeating: Array(repeating: Array(repeating: Int.min, count: c), count: c), count: r)

    for i in 0..<c {
        for j in 0..<c {
            if i == j { continue }
            dp[r - 1][i][j] = grid[r - 1][i] + grid[r - 1][j]
        }
    }

    for k in stride(from: r - 2, through: 0, by: -1) {
        for i in 0..<c {
            for j in 0..<c {
                if i == j { continue }
                
                var maximum = Int.min
                
                for x in -1...1 {
                    for y in -1...1 {
                        if i + x >= 0, i + x < c, j + y >= 0, j + y < c {
                            maximum = max(maximum, dp[k + 1][i + x][j + y])
                        }
                    }
                }

                dp[k][i][j] = grid[k][i] + grid[k][j] + maximum
            }
        }
    }

    return dp[0][0][c - 1]
}

print(cherryPickup([[3,1,1],[2,5,1],[1,5,5],[2,1,1]]))
print(cherryPickup([[1,0,0,0,0,0,1],[2,0,0,0,0,3,0],[2,0,9,0,0,0,0],[0,3,0,5,4,0,0],[1,0,2,3,0,0,6]]))


func cherryPickup2(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count
    var memo = [String: Int]()

    func dp(_ i: Int, _ j: Int, _ k: Int) -> Int {
        let key = "\(i),\(j),\(k)"

        if i < 0 || i >= cols || j < 0 || j >= cols { return 0 }
        if k == rows || i == j { return 0 }
        if let value = memo[key] { return value }

        var result = 0

        for x in [-1, 0, 1] {
            for y in [-1, 0, 1] {
                result = max(result, dp(i + x, j + y, k + 1))
            }
        }

        result += grid[k][i] + grid[k][j]
        memo[key] = result
        return result
    }

    return dp(0, cols - 1, 0)
}