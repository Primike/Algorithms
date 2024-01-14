// Given a 2D grid of size m x n and an integer k. You need to shift the grid k times.
// Return the 2D grid after applying shift operation k times.

func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
    let m = grid.count, n = grid[0].count 
    var flatGrid = grid.flatMap { $0 }
    let elements = m * n
    var result = Array(repeating: Array(repeating: 0, count: n), count: m)

    for i in 0..<elements {
        let index = (i + k) % elements
        result[index / n][index % n] = flatGrid[i]
    }

    return result
}

print(shiftGrid([[1,2,3],[4,5,6],[7,8,9]], 1))
print(shiftGrid([[3,8,1,9],[19,7,2,5],[4,6,11,10],[12,0,21,13]], 4))
print(shiftGrid([[1,2,3],[4,5,6],[7,8,9]], 9))