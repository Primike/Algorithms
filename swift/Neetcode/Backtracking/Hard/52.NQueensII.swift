// Given an integer n, return the number of distinct solutions to the n-queens puzzle.

// Time: O(n!), Space: O(n)
func totalNQueens(_ n: Int) -> Int {
    var cols = Set<Int>()
    var positiveSlope = Set<Int>()
    var negativeSlope = Set<Int>()

    func backtrack(_ r: Int) -> Int {
        if r == n { return 1 }

        var result = 0

        for i in 0..<n {
            if cols.contains(i) { continue }
            if positiveSlope.contains(r + i) { continue }
            if negativeSlope.contains(r + (n - i - 1)) { continue }

            cols.insert(i)
            positiveSlope.insert(r + i)
            negativeSlope.insert(r + (n - i - 1))

            result += backtrack(r + 1)

            cols.remove(i)
            positiveSlope.remove(r + i)
            negativeSlope.remove(r + (n - i - 1))
        }

        return result
    }

    return backtrack(0)
}

print(totalNQueens(4))
print(totalNQueens(1))