class Solution {
    func largestMagicSquare(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count

        var rowsum = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<m {
            rowsum[i][0] = grid[i][0]
            for j in 1..<n {
                rowsum[i][j] = rowsum[i][j - 1] + grid[i][j]
            }
        }

        var colsum = Array(repeating: Array(repeating: 0, count: n), count: m)
        for j in 0..<n {
            colsum[0][j] = grid[0][j]
            for i in 1..<m {
                colsum[i][j] = colsum[i - 1][j] + grid[i][j]
            }
        }

        for edge in stride(from: min(m, n), through: 2, by: -1) {
            for i in 0...(m - edge) {
                for j in 0...(n - edge) {
                    let stdsum = rowsum[i][j + edge - 1] - (j == 0 ? 0 : rowsum[i][j - 1])
                    var check = true

                    for ii in (i + 1)..<(i + edge) {
                        if rowsum[ii][j + edge - 1] - (j == 0 ? 0 : rowsum[ii][j - 1]) != stdsum {
                            check = false
                            break
                        }
                    }
                    if !check { continue }

                    for jj in j..<(j + edge) {
                        if colsum[i + edge - 1][jj] - (i == 0 ? 0 : colsum[i - 1][jj]) != stdsum {
                            check = false
                            break
                        }
                    }
                    if !check { continue }

                    var d1 = 0
                    var d2 = 0
                    for k in 0..<edge {
                        d1 += grid[i + k][j + k]
                        d2 += grid[i + k][j + edge - 1 - k]
                    }
                    
                    if d1 == stdsum && d2 == stdsum {
                        return edge
                    }
                }
            }
        }

        return 1
    }
}