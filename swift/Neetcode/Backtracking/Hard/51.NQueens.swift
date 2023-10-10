// Given an integer n, return all distinct solutions to the n-queens puzzle. 
// You may return the answer in any order.

func solveNQueens(_ n: Int) -> [[String]] {
    var cols = Set<Int>()
    var plusSlope = Set<Int>()
    var minusSlope = Set<Int>()

    var result = [[String]]()
    var board = Array(repeating: [String](repeating: ".", count: n), count: n)

    func backtrack(_ row: Int) {
        if row == n {
            let copy = board.map { $0.joined() }
            result.append(copy)
            return
        }

        for i in 0..<n {
            if cols.contains(i) || plusSlope.contains(row + i) || minusSlope.contains(row - i) {
                continue
            }

            cols.insert(i)
            plusSlope.insert(row + i)
            minusSlope.insert(row - i)
            board[row][i] = "Q"

            backtrack(row + 1)

            cols.remove(i)
            plusSlope.remove(row + i)
            minusSlope.remove(row - i)
            board[row][i] = "."
        }
    }

    backtrack(0)
    return result
}

print(solveNQueens(4))
print(solveNQueens(1))