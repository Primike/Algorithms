// Return the maximum amount of gold you can collect under the conditions:
// Every time you are located in a cell you will collect all the gold in that cell.
// From your position, you can walk one step to the left, right, up, or down.
// You can't visit the same cell more than once.
// Never visit a cell with 0 gold.
// You can start and stop collecting gold from any position in the grid that has some gold.

func getMaximumGold(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count 
    var visited = Set<String>()

    func dfs(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if i < 0 || i >= rows || j < 0 || j >= cols { return 0 }
        if visited.contains(key) || grid[i][j] == 0 { return 0 }

        visited.insert(key)
        let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]
        var maxGold = 0

        for (di, dj) in directions {
            maxGold = max(maxGold, dfs(di, dj))
        }

        visited.remove(key)
        return grid[i][j] + maxGold
    }

    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] > 0 { 
                result = max(result, dfs(i, j)) 
                visited = []
            }
        }
    }

    return result
}

print(getMaximumGold([[0,6,0],[5,8,7],[0,9,0]]))
print(getMaximumGold([[1,0,7],[2,0,6],[3,4,5],[0,3,0],[9,0,20]]))