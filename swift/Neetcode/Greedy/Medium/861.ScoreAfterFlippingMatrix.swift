// A move consists of choosing any row or column and toggling each value 
// in that row or column (i.e., changing all 0's to 1's, and all 1's to 0's).
// Every row of the matrix is interpreted as a binary number, 
// and the score of the matrix is the sum of these numbers.
// Return the highest possible score after making 
// any number of moves (including zero moves).

func matrixScore(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count
    var result = (1 << (cols - 1)) * rows

    for j in 1..<cols {
        var countSameBits = 0

        for i in 0..<rows {
            if grid[i][j] == grid[i][0] { countSameBits += 1 }
        }

        countSameBits = max(countSameBits, rows - countSameBits)
        let columnScore = (1 << (cols - j - 1)) * countSameBits
        result += columnScore
    }

    return result
}

print(matrixScore([[0,0,1,1],[1,0,1,0],[1,1,0,0]]))
print(matrixScore([[0]]))