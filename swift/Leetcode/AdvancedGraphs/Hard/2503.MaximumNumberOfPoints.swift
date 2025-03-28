// You are given an m x n integer matrix grid and an array queries of size k.
// Find an array answer of size k such that for each integer queries[i] 
// you start in the top left cell of the matrix and repeat the following process:
// If queries[i] is strictly greater than the value of the current cell 
// that you are in, then you get one point if it is your first time 
// visiting this cell, and you can move to any adjacent cell in 
// all 4 directions: up, down, left, and right.
// Otherwise, you do not get any points, and you end this process.
// After the process, answer[i] is the maximum number of points you can get. 
// Note that for each query you are allowed to visit the same cell multiple times.
// Return the resulting array answer.

struct Cell: Comparable {
    let i: Int
    let j: Int
    let value: Int

    static func < (_ l: Cell, _ r: Cell) -> Bool {
        return l.value < r.value
    }
}

// Time: O(m * n * log(m * n) + q * log(m * n)), Space: O(m * n)
func maxPoints(_ grid: [[Int]], _ queries: [Int]) -> [Int] {
    let rows = grid.count, cols = grid[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var heap = Heap<Cell>(.minHeap, [Cell(i: 0, j: 0, value: grid[0][0])])
    var memo = [Int: Int]()
    var visited = Set([[0, 0]])
    var maximum = 0
    var total = 0

    while !heap.isEmpty {
        let first = heap.pop()!
        total += 1
        maximum = max(maximum, first.value)
        memo[maximum] = total

        for (di, dj) in directions {
            let r = first.i + di, c = first.j + dj
            let key = [r, c]

            if visited.contains(key) { continue }
            if r < 0 || r >= rows || c < 0 || c >= cols { continue }

            heap.push(Cell(i: r, j: c, value: grid[r][c]))
            visited.insert([r, c])
        }
    }

    let keys = memo.keys.sorted { $0 < $1 }
    var result = Array(repeating: 0, count: queries.count)

    for i in 0..<queries.count {
        if queries[i] <= grid[0][0] { continue }

        var left = 0, right = keys.count - 1

        while left <= right {
            let mid = (right + left) / 2

            if queries[i] <= keys[mid] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

        result[i] = memo[keys[right], default: 0]
    }

    return result
}

print(maxPoints([[1,2,3],[2,5,7],[3,5,1]], [5,6,2]))
print(maxPoints([[5,2,1],[1,1,2]], [3]))