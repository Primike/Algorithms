func shortestDistance(_ grid: [[Int]]) -> Int {
    let rows = grid.count
    let cols = grid[0].count
    let houses = grid.reduce(0) { $0 + $1.reduce(0) { $0 + ($1 == 1 ? 1 : 0) } }
    var dist = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
    var reach = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
    let dirs = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    var minDist = Int.max

    for r in 0..<rows {
        for c in 0..<cols {
            if grid[r][c] == 1 {
                var q = [(r, c, 0)] // (row, col, distance)
                var visited = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
                visited[r][c] = true

                while !q.isEmpty {
                    let (currR, currC, d) = q.removeFirst()

                    for dir in dirs {
                        let nextR = currR + dir[0]
                        let nextC = currC + dir[1]

                        if nextR >= 0 && nextR < rows && nextC >= 0 && nextC < cols && grid[nextR][nextC] == 0 && !visited[nextR][nextC] {
                            visited[nextR][nextC] = true
                            dist[nextR][nextC] += d + 1
                            reach[nextR][nextC] += 1
                            q.append((nextR, nextC, d + 1))
                        }
                    }
                }
            }
        }
    }

    for r in 0..<rows {
        for c in 0..<cols {
            if grid[r][c] == 0 && reach[r][c] == houses {
                minDist = min(minDist, dist[r][c])
            }
        }
    }

    return minDist == Int.max ? -1 : minDist
}