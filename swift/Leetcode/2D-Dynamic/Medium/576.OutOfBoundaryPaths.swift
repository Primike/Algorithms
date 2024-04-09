// There is an m x n grid with a ball. The ball is initially at the position 
// [startRow, startColumn]. You are allowed to move the ball to one of the four 
// adjacent cells in the grid (possibly out of the grid crossing the grid boundary). 
// You can apply at most maxMove moves to the ball.
// Given the five integers m, n, maxMove, startRow, startColumn, 
// return the number of paths to move the ball out of the grid boundary. 
// Since the answer can be very large, return it modulo 109 + 7.

// Time: O(n * m * maxMove), Space: O(n * m * maxMove)
func findPaths(_ m: Int, _ n: Int, _ maxMove: Int, _ startRow: Int, _ startColumn: Int) -> Int {
    let mod = 1_000_000_007
    var memo = [String: Int]()

    func dp(_ i: Int, _ j: Int, _ moves: Int) -> Int {
        let key = "\(i),\(j),\(moves)"

        if moves > maxMove { return 0 }
        if i < 0 || i >= m || j < 0 || j >= n { return 1 }
        if let value = memo[key] { return value }

        let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]
        var result = 0

        for (di, dj) in directions {
            result += dp(di, dj, moves + 1) % mod
        }

        result = result % mod
        memo[key] = result
        return result
    }

    return dp(startRow, startColumn, 0)
}

print(findPaths(2, 2, 2, 0, 0))
print(findPaths(1, 3, 3, 0, 1))