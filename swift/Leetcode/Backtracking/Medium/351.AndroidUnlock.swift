// A sequence of k dots is a valid unlock pattern 
// if both of the following are true:
// All the dots in the sequence are distinct.
// If the line segment connecting two consecutive dots 
// in the sequence passes through the center of any other dot, 
// the other dot must have previously appeared in the sequence. 
// No jumps through the center non-selected dots are allowed.
// Given two integers m and n, return the number of unique and valid 
// unlock patterns of the Android grid lock screen 
// that consist of at least m keys and at most n keys.

func numberOfPatterns(_ m: Int, _ n: Int) -> Int {
    let singleStepMoves = [
        (0, 1), (0, -1), (1, 0), (-1, 0), 
        (1, 1), (-1, 1), (1, -1), (-1, -1), 
        (-2, 1), (-2, -1), (2, 1), (2, -1),  
        (1, -2), (-1, -2), (1, 2), (-1, 2)
    ]
    
    let skipDotMoves = [
        (0, 2), (0, -2), (2, 0), (-2, 0),
        (-2, -2), (2, 2), (2, -2), (-2, 2)
    ]

    func backtrack(_ i: Int, _ j: Int, _ length: Int, _ grid: [[Bool]]) -> Int {
        if length > n { return 0 }
        
        var grid = grid
        grid[i][j] = true
        var count = length >= m ? 1 : 0

        for (di, dj) in singleStepMoves {
            let r = i + di, c = j + dj
            if r < 0 || r >= 3 || c < 0 || c >= 3 || grid[r][c] { continue }

            count += backtrack(r, c, length + 1, grid)
        }
        
        for (di, dj) in skipDotMoves {
            let r = i + di, c = j + dj
            if r < 0 || r >= 3 || c < 0 || c >= 3 || grid[r][c] { continue }

            let midRow = i + di / 2, midCol = j + dj / 2
            if grid[midRow][midCol] { count += backtrack(r, c, length + 1, grid) }
        }
        
        return count
    }
    
    var result = 0

    for j in 0..<3 {
        for i in 0..<3 {
            let grid = Array(repeating: Array(repeating: false, count: 3), count: 3)
            result += backtrack(j, i, 1, grid)
        }
    }

    return result
}

print(numberOfPatterns(1, 1))
print(numberOfPatterns(1, 2))