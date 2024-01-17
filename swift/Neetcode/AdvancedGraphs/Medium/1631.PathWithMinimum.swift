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

// Time: O(m * n), Space: O(m * n)
func minimumEffortPath(_ heights: [[Int]]) -> Int {
    let rows = heights.count, cols = heights[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var heap = Heap<Cell>(.minHeap, [Cell(i: 0, j: 0, effort: 0)])
    var visited = Set<String>()
    
    while !heap.isEmpty {
        let cell = heap.pop()!
        let key = "\(cell.i),\(cell.j)"

        if visited.contains(key) { continue }
        visited.insert(key)

        if cell.i == rows - 1, cell.j == cols - 1 { return cell.effort }

        for (di, dj) in directions {
            let r = cell.i + di, c = cell.j + dj
            let key = "\(r),\(c)"

            if r < 0 || r >= rows || c < 0 || c >= cols { continue }
            if visited.contains(key) { continue }

            let nextEffort = abs(heights[cell.i][cell.j] - heights[r][c])
            let largestEffort = max(cell.effort, nextEffort)
            heap.push(Cell(i: r, j: c, effort: largestEffort))
        }
    }

    return 0
}

print(minimumEffortPath([[1,2,2],[3,8,2],[5,3,5]]))
print(minimumEffortPath([[1,2,3],[3,8,4],[5,3,5]]))
print(minimumEffortPath([[1,2,1,1,1],[1,2,1,2,1],[1,2,1,2,1],[1,2,1,2,1],[1,1,1,2,1]]))