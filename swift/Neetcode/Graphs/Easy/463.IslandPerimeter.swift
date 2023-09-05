// You are given row x col grid representing a map where grid[i][j] = 1 
// represents land and grid[i][j] = 0 represents water.
// Determine the perimeter of the island.

func islandPerimeter(_ grid: [[Int]]) -> Int {
    var rows = grid.count, cols = grid[0].count
    var perimeter = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] == 0 { continue }

            perimeter += 4

            if i > 0, grid[i - 1][j] == 1 { perimeter -= 1 }
            if i < rows - 1, grid[i + 1][j] == 1 { perimeter -= 1 }
            if j > 0, grid[i][j - 1] == 1 { perimeter -= 1 }
            if j < cols - 1, grid[i][j + 1] == 1 { perimeter -= 1 }
        }
    }

    return perimeter
}

print(islandPerimeter([[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]))
print(islandPerimeter([[1]]))
print(islandPerimeter([[1,0]]))