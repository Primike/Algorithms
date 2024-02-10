struct Point: Comparable {
    let i: Int
    let j: Int
    let time: Int

    static func < (_ l: Point, _ r: Point) -> Bool {
        return l.time < r.time
    }
}

func swimInWater(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count
    var heap = Heap<Point>(.minHeap, [Point(i: 0, j: 0, time: grid[0][0])])
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var visited = Set(["\(0),\(0)"])

    while !heap.isEmpty {
        let first = heap.pop()!
        if first.i == rows - 1, first.j == cols - 1 { return first.time }

        for (di, dj) in directions {
            let r = first.i + di, c = first.j + dj
            let key = "\(r),\(c)"

            if r < 0 || r >= rows || c < 0 || c >= cols { continue }
            if visited.contains(key) { continue }
            
            visited.insert(key) 
            heap.push(Point(i: r, j: c, time: max(first.time, grid[r][c])))
        }
    }

    return 0
}

print(swimInWater([[0,2],[1,3]]))
print(swimInWater([[0,1,2,3,4],[24,23,22,21,5],[12,13,14,15,16],[11,17,18,19,20],[10,9,8,7,6]]))