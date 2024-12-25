

func minScore(_ grid: [[Int]]) -> [[Int]] {
    var grid = grid
    let r = grid.count, c = grid[0].count
    var rows = Array(repeating: 1, count: r)
    var cols = Array(repeating: 1, count: c)
    var nums = [(Int, Int, Int)]()

    for i in 0..<r {
        for j in 0..<c {
            nums.append((grid[i][j], i, j))
        }
    }

    nums.sort { $0.0 < $1.0 }

    for (value, i, j) in nums {
        let val = max(rows[i], cols[j])
        grid[i][j] = val
        rows[i] = val + 1
        cols[j] = val + 1
    }

    return grid
}