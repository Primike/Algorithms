// A land cell if grid[r][c] = 0, or
// A water cell containing grid[r][c] fish, if grid[r][c] > 0.
// A fisher can start at any water cell (r, c) and can do 
// the following operations any number of times:
// Catch all the fish at cell (r, c), or
// Move to any adjacent water cell.
// Return the maximum number of fish the fisher can catch 
// if he chooses his starting cell optimally, or 0 if no water cell exists.

// Time: O(m * n), Space: O(m * n)
func findMaxFish(_ grid: [[Int]]) -> Int {
    var grid = grid
    let rows = grid.count, cols = grid[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    func dfs(_ i: Int, _ j: Int) -> Int {
        var total = grid[i][j]
        grid[i][j] = 0

        for (di, dj) in directions {
            let r = i + di, c = j + dj

            if r < 0 || r >= rows || c < 0 || c >= cols { continue }
            if grid[r][c] == 0 { continue }

            total += dfs(r, c)
        }

        return total
    }

    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] != 0 { result = max(result, dfs(i, j)) }
        }
    }

    return result
}

print(findMaxFish([[0,2,1,0],[4,0,0,3],[1,0,0,4],[0,3,2,0]]))
print(findMaxFish([[1,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,1]]))