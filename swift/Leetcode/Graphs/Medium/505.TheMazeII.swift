class Solution {
    func shortestDistance(_ maze: [[Int]], _ start: [Int], _ dest: [Int]) -> Int {
        let m = maze.count
        let n = maze[0].count
        var distance = Array(repeating: Array(repeating: Int.max, count: n), count: m)
        
        distance[start[0]][start[1]] = 0
        dfs(maze, start, &distance)
        
        let result = distance[dest[0]][dest[1]]
        return result == Int.max ? -1 : result
    }

    private func dfs(_ maze: [[Int]], _ start: [Int], _ distance: inout [[Int]]) {
        let dirs = [[0, 1], [0, -1], [-1, 0], [1, 0]]
        let m = maze.count
        let n = maze[0].count
        
        for dir in dirs {
            var x = start[0] + dir[0]
            var y = start[1] + dir[1]
            var count = 0
            
            while x >= 0 && y >= 0 && x < m && y < n && maze[x][y] == 0 {
                x += dir[0]
                y += dir[1]
                count += 1
            }
            
            let lastX = x - dir[0]
            let lastY = y - dir[1]
            
            if distance[start[0]][start[1]] + count < distance[lastX][lastY] {
                distance[lastX][lastY] = distance[start[0]][start[1]] + count
                dfs(maze, [lastX, lastY], &distance)
            }
        }
    }
}