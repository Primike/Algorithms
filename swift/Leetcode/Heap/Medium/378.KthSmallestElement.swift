struct Cell: Comparable {
    var i: Int
    var j: Int
    var value: Int

    static func < (_ l: Cell, _ r: Cell) -> Bool {
        return l.value < r.value
    }
}

func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
    let rows = matrix.count, cols = matrix[0].count
    var heap = Heap<Cell>(.minHeap)

    for i in 0..<min(k, rows) {
        heap.push(Cell(i: i, j: 0, value: matrix[i][0]))
    }

    var remaining = k
    var result = 0

    while remaining > 0, !heap.isEmpty {
        let first = heap.pop()!
        result = first.value 
        let nextJ = first.j + 1
        
        if nextJ < cols {
            
            heap.push(Cell(i: first.i, j: nextJ, value: matrix[first.i][nextJ]))
        }

        remaining -= 1
    }

    return result
}