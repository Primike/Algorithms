class Solution {
    func countCoveredBuildings(_ n: Int, _ buildings: [[Int]]) -> Int {
        var max_row = [Int](repeating: 0, count: n + 1)
        var min_row = [Int](repeating: n + 1, count: n + 1)
        var max_col = [Int](repeating: 0, count: n + 1)
        var min_col = [Int](repeating: n + 1, count: n + 1)

        for p in buildings {
            let x = p[0]
            let y = p[1]
            max_row[y] = max(max_row[y], x)
            min_row[y] = min(min_row[y], x)
            max_col[x] = max(max_col[x], y)
            min_col[x] = min(min_col[x], y)
        }

        var res = 0
        for p in buildings {
            let x = p[0]
            let y = p[1]
            if x > min_row[y] && x < max_row[y] && y > min_col[x] && y < max_col[x] {
                res += 1
            }
        }

        return res
    }
}