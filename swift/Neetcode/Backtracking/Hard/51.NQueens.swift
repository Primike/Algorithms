// Given an integer n, return all distinct solutions to the n-queens puzzle. 
// You may return the answer in any order.

// Time: O(n!), Space: O(n^2)
func solveNQueens(_ n: Int) -> [[String]] {
    var result = [[String]]()
    var cols = Set<Int>()
    var positiveSlope = Set<Int>()
    var negativeSlope = Set<Int>()

    func backtrack(_ r: Int, _ grid: [String]) {
        if r == n { 
            result.append(grid)
            return
        }

        for i in 0..<n {
            if cols.contains(i) { continue }
            if positiveSlope.contains(r + i) { continue }
            if negativeSlope.contains(r + (n - i - 1)) { continue }

            cols.insert(i)
            positiveSlope.insert(r + i)
            negativeSlope.insert(r + (n - i - 1))

            let row = String(repeating: ".", count: i) + "Q" + String(repeating: ".", count: n - i - 1)
            backtrack(r + 1, grid + [row])

            cols.remove(i)
            positiveSlope.remove(r + i)
            negativeSlope.remove(r + (n - i - 1))
        }
    }

    backtrack(0, [])
    return result
}

print(solveNQueens(4))
print(solveNQueens(1))