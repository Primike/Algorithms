// Given an m x n binary matrix filled with 0's and 1's, find the 
// largest square containing only 1's and return its area.

func maximalSquare(_ matrix: [[Character]]) -> Int {
    let rows = matrix.count, cols = matrix[0].count
    var tab = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if matrix[i][j] == "1" {
                if i == 0 || j == 0 {
                    tab[i][j] = 1
                } else {
                    tab[i][j] = 1 + min(tab[i - 1][j], tab[i][j - 1], tab[i - 1][j - 1])
                }

                result = max(result, tab[i][j])
            }
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


func maximalSquare(_ matrix: [[Character]]) -> Int {
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