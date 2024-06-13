// The safeness factor of a path on the grid is defined as the minimum 
// manhattan distance from any cell in the path to any thief in the grid.
// Return the maximum safeness factor of all paths leading to cell (n - 1, n - 1).

// Time: O(n^2 * log(n * m)), Space: O(n^2)
func maximumSafenessFactor(_ grid: [[Int]]) -> Int {
    var rows = grid.count, cols = grid[0].count 
    var visited = Set<String>()
    var queue = [(Int, Int)]()

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] == 1 { 
                queue.append((i, j)) 
                visited.insert("\(i),\(j)")
            }
        }
    }

    var safenessGrid = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let (i, j) = queue.removeFirst()

            for (di, dj) in directions {
                let r = i + di, c = j + dj
                let key = "\(r),\(c)"

                if r < 0 || r >= rows || c < 0 || c >= cols { continue }
                if visited.contains(key) { continue }

                visited.insert(key)
                safenessGrid[r][c] = safenessGrid[i][j] + 1
                queue.append((r, c))
            }
        }
    }

    var heap = Heap<Cell>(.maxHeap, [Cell(i: 0, j: 0, safeness: safenessGrid[0][0])])
    visited = ["0,0"]
    var result = safenessGrid[0][0]

    while !heap.isEmpty {
        let safest = heap.pop()!
        result = min(result, safest.safeness)

        if safest.i == rows - 1, safest.j == cols - 1 { return result }

        for (di, dj) in directions {
            let r = safest.i + di, c = safest.j + dj
            let key = "\(r),\(c)"

            if r < 0 || r >= rows || c < 0 || c >= cols { continue }
            if visited.contains(key) { continue }

            visited.insert(key)
            heap.push(Cell(i: r, j: c, safeness: safenessGrid[r][c]))
        }
    }

    return result
}

print(maximumSafenessFactor([[1,0,0],[0,0,0],[0,0,1]]))
print(maximumSafenessFactor([[0,0,1],[0,0,0],[0,0,0]]))
print(maximumSafenessFactor([[0,0,0,1],[0,0,0,0],[0,0,0,0],[1,0,0,0]]))


// Precomputes safeness
// Guesses safeness based on mahattan distance of farthest point
// Inside isPathAvailable checks only for minimized safeness
func maximumSafenessFactor2(_ grid: [[Int]]) -> Int {
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