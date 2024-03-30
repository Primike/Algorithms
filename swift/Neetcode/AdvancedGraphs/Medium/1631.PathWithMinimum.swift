// A route's effort is the maximum absolute difference in heights 
// between two consecutive cells of the route.
// Return the minimum effort required to travel from the 
// top-left cell to the bottom-right cell.

struct Cell: Comparable {
    let i: Int
    let j: Int
    let effort: Int

    static func < (_ l: Cell, _ r: Cell) -> Bool {
        return l.effort < r.effort
    }
}

// Time: O(m * n * log(m * n)), Space: O(m * n)
func minimumEffortPath(_ heights: [[Int]]) -> Int {
    let rows = heights.count, cols = heights[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var visited = Set<String>()
    var heap = Heap<Cell>(.minHeap)
    heap.push(Cell(i: 0, j: 0, effort: 0))
    var result = 0

    while !heap.isEmpty {
        let leastEffort = heap.pop()!
        result = max(result, leastEffort.effort)
        visited.insert("\(leastEffort.i),\(leastEffort.j)")

        if leastEffort.i == rows - 1, leastEffort.j == cols - 1 { return result }

        for (di, dj) in directions {
            let r = leastEffort.i + di, c = leastEffort.j + dj
            
            if r < 0 || r >= rows || c < 0 || c >= cols { continue }
            if visited.contains("\(r),\(c)") { continue }

            let effort = abs(heights[leastEffort.i][leastEffort.j] - heights[r][c])
            heap.push(Cell(i: r, j: c, effort: effort))
        }
    }

    return result
}

print(minimumEffortPath([[1,2,2],[3,8,2],[5,3,5]]))
print(minimumEffortPath([[1,2,3],[3,8,4],[5,3,5]]))
print(minimumEffortPath([[1,2,1,1,1],[1,2,1,2,1],[1,2,1,2,1],[1,2,1,2,1],[1,1,1,2,1]]))