// An n x n grid is composed of 1 x 1 squares where each 
// 1 x 1 square consists of a '/', '\', or blank space ' '. 
// These characters divide the square into contiguous regions.
// Given the grid grid represented as a string array, return the number of regions.
// Note that backslash characters are escaped, so a '\' is represented as '\\'.

// Time: O(n^2), Space: O(n^2)
func regionsBySlashes(_ grid: [String]) -> Int {
    let grid = grid.map { Array($0) }
    var newGrid = Array(repeating: Array(repeating: 0, count: grid.count * 3), count: grid.count * 3)
    
    for i in 0..<grid.count {
        for j in 0..<grid.count {
            let r = i * 3, c = j * 3
                            
            if grid[i][j] == "\\" {
                newGrid[r][c] = 1
                newGrid[r + 1][c + 1] = 1
                newGrid[r + 2][c + 2] = 1
            } else if grid[i][j] == "/" {
                newGrid[r][c + 2] = 1
                newGrid[r + 1][c + 1] = 1
                newGrid[r + 2][c] = 1
            }
        }
    }
    
    let rows = newGrid.count, cols = newGrid[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var result = 0
    
    for i in 0..<grid.count * 3 {
        for j in 0..<grid.count * 3 {
            if newGrid[i][j] == 1 { continue }

            var queue = [(i, j)]
            newGrid[i][j] = 1
            
            while !queue.isEmpty {
                let first = queue.removeFirst()

                for (di, dj) in directions {
                    let r = first.0 + di, c = first.1 + dj

                    if r < 0 || r >= rows || c < 0 || c >= cols { continue }
                    if newGrid[r][c] == 1 { continue }

                    newGrid[r][c] = 1
                    queue.append((r, c))
                }
            }

            result += 1
        }
    }
    
    return result
}

print(regionsBySlashes([" /","/ "]))
print(regionsBySlashes([" /","  "]))
print(regionsBySlashes(["/\\","\\/"]))