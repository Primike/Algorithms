class Solution {
    func findSafeWalk(_ grid: [[Int]], _ health: Int) -> Bool {
        let m = grid.count
        let n = grid[0].count
        let dirs = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        var dis = Array(repeating: Array(repeating: Int.max, count: n), count: m)
        
        var deque = [(x: Int, y: Int)]()
        deque.append((0, 0))
        dis[0][0] = grid[0][0]
        
        while !deque.isEmpty {
            let curr = deque.removeFirst()
            let cx = curr.x
            let cy = curr.y
            
            if cx == m - 1 && cy == n - 1 {
                return true
            }
            
            for (dx, dy) in dirs {
                let nx = cx + dx
                let ny = cy + dy
                
                if nx < 0 || ny < 0 || nx >= m || ny >= n {
                    continue
                }
                
                let cost = dis[cx][cy] + grid[nx][ny]
                if cost >= health {
                    continue
                }
                
                if cost < dis[nx][ny] {
                    dis[nx][ny] = cost
                    if grid[nx][ny] == 0 {
                        deque.insert((nx, ny), at: 0)
                    } else {
                        deque.append((nx, ny))
                    }
                }
            }
        }
        
        return false
    }
}