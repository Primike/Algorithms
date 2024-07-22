// Given an m x n binary matrix filled with 0's and 1's, find the 
// largest square containing only 1's and return its area.

// Time: O(m * n), Space: O(n)
func maximalSquare(_ matrix: [[Character]]) -> Int {
    var rows = matrix.count + 1, cols = matrix[0].count + 1
    var tab = Array(repeating: 0, count: cols)
    var result = 0

    for i in 1..<rows {
        var nextRow = Array(repeating: 0, count: cols)

        for j in 1..<cols {
            if matrix[i - 1][j - 1] == "0" { continue }

            nextRow[j] = min(nextRow[j - 1], tab[j], tab[j - 1]) + 1
            result = max(result, nextRow[j])
        }

        tab = nextRow
    }

    return result * result
}

func maximalSquare2(_ matrix: [[Character]]) -> Int {
    var rows = matrix.count + 1, cols = matrix[0].count + 1
    var tab = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    var result = 0

    for i in 1..<rows {
        for j in 1..<cols {
            if matrix[i - 1][j - 1] == "0" { continue }

            tab[i][j] = min(tab[i][j - 1], tab[i - 1][j], tab[i - 1][j - 1]) + 1
            result = max(result, tab[i][j])
        }
    }

    return result * result
}

print(maximalSquare([
    ["1","0","1","0","0"],
    ["1","0","1","1","1"],
    ["1","1","1","1","1"],
    ["1","0","0","1","0"]]))
print(maximalSquare([["0","1"],["1","0"]]))
print(maximalSquare([["0"]]))


func maximalSquare3(_ matrix: [[Character]]) -> Int {
    let rows = matrix.count, cols = matrix[0].count
    var memo = [String: Int]()

    func dp(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if i < 0 || i >= rows || j < 0 || j >= cols { return 0 }
        if matrix[i][j] == "0" { return 0 }
        if let value = memo[key] { return value }

        let down = dp(i + 1, j)
        let right = dp(i, j + 1)
        let diagonal = dp(i + 1, j + 1)

        let result = 1 + min(down, right, diagonal)

        memo[key] = result
        return result
    }

    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if matrix[i][j] == "1" {
                result = max(result, dp(i, j))
            }
        }
    }

    return result * result
}