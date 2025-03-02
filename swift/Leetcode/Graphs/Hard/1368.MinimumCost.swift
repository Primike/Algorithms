// Given an m x n grid. Each cell of the grid has a sign pointing 
// to the next cell you should visit if you are currently in this cell. 
// The sign of grid[i][j] can be:
// 1 which means go to the cell to the right. (i.e go from grid[i][j] to grid[i][j + 1])
// 2 which means go to the cell to the left. (i.e go from grid[i][j] to grid[i][j - 1])
// 3 which means go to the lower cell. (i.e go from grid[i][j] to grid[i + 1][j])
// 4 which means go to the upper cell. (i.e go from grid[i][j] to grid[i - 1][j])
// You will initially start at the upper left cell (0, 0). 
// A valid path in the grid is a path that starts from the upper left cell 
// (0, 0) and ends at the bottom-right cell (m - 1, n - 1) following the signs on the grid. 
// The valid path does not have to be the shortest.
// You can modify the sign on a cell with cost = 1. 
// You can modify the sign on a cell one time only.
// Return the minimum cost to make the grid have at least one valid path.

// Time: O(m * n), Space: O(m * n)
func minCost(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count
    let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    var result = Array(repeating: Array(repeating: Int.max, count: cols), count: rows)
    result[0][0] = 0
    var deque = [(0, 0)]
    
    while !deque.isEmpty {
        let (i, j) = deque.removeFirst()

        for (index, (dx, dy)) in directions.enumerated() {
            let r = i + dx, c = j + dy
            let cost = grid[i][j] == index + 1 ? 0 : 1
            
            if r < 0 || r >= rows || c < 0 || c >= cols { continue }
            if result[i][j] + cost >= result[r][c] { continue }

            result[r][c] = result[i][j] + cost

            if cost == 1 {
                deque.append((r, c))
            } else {
                deque.insert((r, c), at: 0)
            }
        }
    }
    
    return result[rows - 1][cols - 1]
}

print(minCost([[1,1,1,1],[2,2,2,2],[1,1,1,1],[2,2,2,2]]))
print(minCost([[1,1,3],[3,2,2],[1,1,4]]))
print(minCost([[1,2],[4,3]]))