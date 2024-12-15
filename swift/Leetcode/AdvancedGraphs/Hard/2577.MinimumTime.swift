// You are given a m x n matrix grid consisting of non-negative 
// integers where grid[row][col] represents the minimum time required 
// to be able to visit the cell (row, col), which means you can 
// visit the cell (row, col) only when the time you visit it is 
// greater than or equal to grid[row][col].
// You are standing in the top-left cell of the matrix in the 0th second, 
// and you must move to any adjacent cell in the four directions: 
// up, down, left, and right. Each move you make takes 1 second.
// Return the minimum time required in which you can visit 
// the bottom-right cell of the matrix. If you cannot visit the 
// bottom-right cell, then return -1.

struct Cell: Comparable {
    let i: Int
    let j: Int
    let time: Int

    static func < (_ l: Cell, _ r: Cell) -> Bool {
        return l.time < r.time
    }
}

func minimumTime(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var heap = Heap<Cell>(.minHeap, [Cell(i: 0, j: 0, time: 0)])
    var visited = Set<String>()

    while !heap.isEmpty {
        let first = heap.pop()!

        for (di, dj) in directions {
            let r = first.i + di, c = first.j + dj
            let key = "\(r),\(c)"

            if r < 0 || r >= rows || c < 0 || c >= cols { continue }
            if first.time + 1 < grid[r][c] || visited.contains(key) { continue }
            if r == rows - 1, c == cols - 1 { return first.time + 1 }

            visited.insert(key)
            heap.push(Cell(i: r, j: c, time: max(first.time + 1, grid[r][c])))
        }
    }

    return -1
}

print(minimumTime([[0,1,3,2],[5,1,2,5],[4,3,8,6]]))
print(minimumTime([[0,2,4],[3,2,1],[1,0,4]]))