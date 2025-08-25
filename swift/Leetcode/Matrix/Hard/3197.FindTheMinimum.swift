class Solution {
    private func minimumSum2(grid: [[Int]], u: Int, d: Int, l: Int, r: Int) -> Int {
        var minI = grid.count
        var maxI = -1
        var minJ = grid[0].count
        var maxJ = -1

        for i in u...d {
            for j in l...r {
                if grid[i][j] == 1 {
                    minI = min(minI, i)
                    minJ = min(minJ, j)
                    maxI = max(maxI, i)
                    maxJ = max(maxJ, j)
                }
            }
        }

        if minI <= maxI {
            return (maxI - minI + 1) * (maxJ - minJ + 1)
        } else {
            return Int.max / 3
        }
    }

    private func rotate(vec: [[Int]]) -> [[Int]] {
        let n = vec.count
        guard n > 0 else { return [] }
        let m = vec[0].count
        var ret = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)

        for i in 0..<n {
            for j in 0..<m {
                ret[m - j - 1][i] = vec[i][j]
            }
        }
        return ret
    }

    private func solve(grid: [[Int]]) -> Int {
        let n = grid.count
        guard n > 0 else { return 0 }
        let m = grid[0].count
        var res = n * m

        for i in 0..<(n - 1) {
            for j in 0..<(m - 1) {
                res = min(
                    res,
                    minimumSum2(grid: grid, u: 0, d: i, l: 0, r: m - 1)
                        + minimumSum2(grid: grid, u: i + 1, d: n - 1, l: 0, r: j)
                        + minimumSum2(grid: grid, u: i + 1, d: n - 1, l: j + 1, r: m - 1)
                )

                res = min(
                    res,
                    minimumSum2(grid: grid, u: 0, d: i, l: 0, r: j)
                        + minimumSum2(grid: grid, u: 0, d: i, l: j + 1, r: m - 1)
                        + minimumSum2(grid: grid, u: i + 1, d: n - 1, l: 0, r: m - 1)
                )
            }
        }

        for i in 0..<(n - 2) {
            for j in (i + 1)..<(n - 1) {
                res = min(
                    res,
                    minimumSum2(grid: grid, u: 0, d: i, l: 0, r: m - 1)
                        + minimumSum2(grid: grid, u: i + 1, d: j, l: 0, r: m - 1)
                        + minimumSum2(grid: grid, u: j + 1, d: n - 1, l: 0, r: m - 1)
                )
            }
        }

        return res
    }

    func minimumSum(_ grid: [[Int]]) -> Int {
        let rgrid = rotate(vec: grid)
        return min(solve(grid: grid), solve(grid: rgrid))
    }
}