// Given a rows x cols binary matrix filled with 0's and 1's, 
// find the largest rectangle containing only 1's and return its area.

// Time: O(m * n), Space: O(m * n)
func maximalRectangle(_ matrix: [[Character]]) -> Int {
    let rows = matrix.count, cols = matrix[0].count
    var grid = Array(repeating: Array(repeating: 0, count: cols), count: rows)

    for i in 0..<rows {
        for j in 0..<cols {
            if matrix[i][j] == "0" { continue }
            if matrix[i][j] == "1" { grid[i][j] = 1 }
            if j > 0, matrix[i][j - 1] == "1" { grid[i][j] += grid[i][j - 1] } 
        }
    }

    var result = 0

    for j in 0..<cols {
        var stack = [(Int, Int)]()

        for i in 0..<rows {
            var height = 0

            while let last = stack.last, last.0 >= grid[i][j] {
                height += last.1
                result = max(result, last.0 * height)
                stack.removeLast()
            }

            stack.append((grid[i][j], height + 1))
        }

        var height = 0

        while let last = stack.last {
            height += last.1
            result = max(result, last.0 * height)
            stack.removeLast()
        }
    }

    return result
}

print(maximalRectangle([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]))
print(maximalRectangle([["0"]]))
print(maximalRectangle([["1"]]))