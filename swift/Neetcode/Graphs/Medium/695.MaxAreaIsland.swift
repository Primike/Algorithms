// You are given an m x n binary matrix grid. 
// An island is a group of 1's (representing land) connected 
// 4-directionally (horizontal or vertical.) 
// You may assume all four edges of the grid are surrounded by water.

func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    if grid.isEmpty { return 0 }

    var visited = Set<(String)>()
    var result = 0

    func dfs(_ i: Int, _ j: Int) -> Int {
        if i < 0 || i >= grid.count || j < 0 || j >= grid[0].count || visited.contains(("\(i),\(j)")) || grid[i][j] == 0 {
            return 0
        } 

        visited.insert("\(i),\(j)")
        return 1 + dfs(i + 1, j) + dfs(i - 1, j) + dfs(i, j + 1) + dfs(i, j - 1)
    }

    for i in 0..<grid.count {
        for j in 0..<grid[0].count {
            if visited.contains("\(i),\(j)") {
                continue
            }

            result = max(result, dfs(i, j))
        }
    }  

    return result  
}

print(maxAreaOfIsland([
    [0,0,1,0,0,0,0,1,0,0,0,0,0],
    [0,0,0,0,0,0,0,1,1,1,0,0,0],
    [0,1,1,0,1,0,0,0,0,0,0,0,0],
    [0,1,0,0,1,1,0,0,1,0,1,0,0],
    [0,1,0,0,1,1,0,0,1,1,1,0,0],
    [0,0,0,0,0,0,0,0,0,0,1,0,0],
    [0,0,0,0,0,0,0,1,1,1,0,0,0],
    [0,0,0,0,0,0,0,1,1,0,0,0,0]]))

print(maxAreaOfIsland([[0,0,0,0,0,0,0,0]]))