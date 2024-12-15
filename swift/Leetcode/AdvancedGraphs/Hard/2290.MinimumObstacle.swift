// You are given a 0-indexed 2D integer array grid of size m x n. 
// Each cell has one of two values:
// 0 represents an empty cell,
// 1 represents an obstacle that may be removed.
// You can move up, down, left, or right from and to an empty cell.
// Return the minimum number of obstacles to remove so you 
// can move from the upper left corner (0, 0) to the lower right 
// corner (m - 1, n - 1).

struct Cell: Comparable {
    let i: Int
    let j: Int
    let weight: Int

    static func < (_ l: Cell, _ r: Cell) -> Bool {
        return l.weight < r.weight
    }
}

func minimumObstacles(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var heap = Heap<Cell>(.minHeap, [Cell(i: 0, j: 0, weight: 0)])
    var visited = [String: Int]()

    while !heap.isEmpty {
        let first = heap.pop()!

        for (di, dj) in directions {
            let r = first.i + di, c = first.j + dj
            let key = "\(r),\(c)"

            if r < 0 || r >= rows || c < 0 || c >= cols { continue }
            if let value = visited[key], value <= first.weight + grid[r][c] { continue }
            if r == rows - 1, c == cols - 1 { return first.weight + grid[r][c] }

            heap.push(Cell(i: r, j: c, weight: first.weight + grid[r][c]))
            visited[key] = first.weight + grid[r][c]
        }
    }

    return 0
}

print(minimumObstacles([[0,1,1],[1,1,0],[1,1,0]]))
print(minimumObstacles([[0,1,0,0,0],[0,1,0,1,0],[0,0,0,1,0]]))