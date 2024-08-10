// A 3 x 3 magic square is a 3 x 3 grid filled with distinct numbers from 
// 1 to 9 such that each row, column, and both diagonals all have the same sum.
// Given a row x col grid of integers, 
// how many 3 x 3 contiguous magic square subgrids are there?

// Time: O(m * n), Space: O(m * n)
func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count

    if rows < 3 || cols < 3 { return 0 }

    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1), (1, -1), (1, 1), (-1, 1), (-1, -1)]
    var result = 0

    for i in 1..<(rows - 1) {
        for j in 1..<(cols - 1) {
            var numbers = Set([grid[i][j]])

            for (di, dj) in directions {
                numbers.insert(grid[i + di][j + dj])
            }

            if numbers != Set(1...9) { continue }

            let row1 = grid[i - 1][j - 1] + grid[i - 1][j] + grid[i - 1][j + 1]

            if grid[i][j - 1] + grid[i][j] + grid[i][j + 1] != row1 { continue }
            if grid[i + 1][j - 1] + grid[i + 1][j] + grid[i + 1][j + 1] != row1 { continue }
            if grid[i - 1][j - 1] + grid[i][j - 1] + grid[i + 1][j - 1] != row1 { continue }
            if grid[i - 1][j] + grid[i][j] + grid[i + 1][j] != row1 { continue }
            if grid[i - 1][j + 1] + grid[i][j + 1] + grid[i + 1][j + 1] != row1 { continue }
            if grid[i - 1][j - 1] + grid[i][j] + grid[i + 1][j + 1] != row1 { continue }
            if grid[i + 1][j - 1] + grid[i][j] + grid[i - 1][j + 1] != row1 { continue }

            result += 1
        }
    }

    return result
}

print(numMagicSquaresInside([[4,3,8,4],[9,5,1,9],[2,7,6,2]]))
print(numMagicSquaresInside([[8]]))