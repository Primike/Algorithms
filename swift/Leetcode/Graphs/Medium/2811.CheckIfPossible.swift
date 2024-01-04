// The safeness factor of a path on the grid is defined as the minimum 
// manhattan distance from any cell in the path to any thief in the grid.
// Return the maximum safeness factor of all paths leading to cell (n - 1, n - 1).

func maximumSafenessFactor(_ grid: [[Int]]) -> Int {
    let n = grid.count
    var distance = Array(repeating: Array(repeating: Int.max, count: n), count: n)
    var queue = [(Int, Int)]()

    for i in 0..<n {
        for j in 0..<n {
            if grid[i][j] == 1 {
                distance[i][j] = 0
                queue.append((i, j))
            }
        }
    }

    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    while !queue.isEmpty {
        let (i, j) = queue.removeFirst()

        for (di, dj) in directions {
            let r = i + di, c = j + dj

            if r < 0 || r >= n || c < 0 || c >= n { continue }

            if distance[r][c] > distance[i][j] + 1 {
                distance[r][c] = distance[i][j] + 1
                queue.append((r, c))
            }
        }
    }

    func isPathAvailable(_ safeness: Int) -> Bool {
        if safeness > distance[0][0] { return false }

        var visited = Set([[0, 0]])
        var queue = [(0, 0)]

        while !queue.isEmpty {
            let (i, j) = queue.removeFirst()
            if i == n - 1 && j == n - 1 { return true }

            for (di, dj) in directions {
                let r = i + di, c = j + dj
                let key = [r, c]

                if r < 0 || r >= n || c < 0 || c >= n { continue }
                if visited.contains(key) || safeness > distance[r][c] { continue }

                visited.insert(key)
                queue.append((r, c))
            }
        }
        
        return false
    }

    var left = 0, right = 2 * (n - 1)
    var result = 0

    while left <= right {
        let mid = (left + right) / 2

        if isPathAvailable(mid) {
            result = mid
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return result
}

print(maximumSafenessFactor([[1,0,0],[0,0,0],[0,0,1]]))
print(maximumSafenessFactor([[0,0,1],[0,0,0],[0,0,0]]))
print(maximumSafenessFactor([[0,0,0,1],[0,0,0,0],[0,0,0,0],[1,0,0,0]]))