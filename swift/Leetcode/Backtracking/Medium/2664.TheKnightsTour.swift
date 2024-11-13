func tourOfKnight(_ m: Int, _ n: Int, _ r: Int, _ c: Int) -> [[Int]] {
    if m == 1, n == 1 { return [[0]] }
    
    let directions = [(2, 1), (2, -1), (-2, 1), (-2, -1),
        (1, 2), (1, -2), (-1, 2), (-1, -2),]
    var result = Array(repeating: Array(repeating: -1, count: n), count: m)

    func backtrack(_ i: Int, _ j: Int, _ count: Int) -> Bool {
        if count == m * n { return true }
        if result[i][j] != -1 { return false }

        result[i][j] = count

        for (di, dj) in directions {
            let x = i + di, y = j + dj

            if x < 0 || x >= m || y < 0 || y >= n { continue }
            if backtrack(x, y, count + 1) { return true }
        }

        result[i][j] = -1
        return false
    }

    backtrack(r, c, 0)
    result[r][c] = 0
    return result
}