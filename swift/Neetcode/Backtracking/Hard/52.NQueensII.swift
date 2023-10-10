// Given an integer n, return the number of distinct solutions to the n-queens puzzle.

func totalNQueens(_ n: Int) -> Int {
    var cols = Set<Int>()
    var plusSlope = Set<Int>()
    var minusSlope = Set<Int>()

    var result = 0

    func backtrack(_ row: Int) {
        if row == n { 
            result += 1 
            return
        }
        
        for i in 0..<n {
            if cols.contains(i) || plusSlope.contains(row + i) || minusSlope.contains(row - i) { 
                continue
            }

            cols.insert(i)
            plusSlope.insert(row + i)
            minusSlope.insert(row - i)

            backtrack(row + 1)

            cols.remove(i)
            plusSlope.remove(row + i)
            minusSlope.remove(row - i)
        }
    }

    backtrack(0)
    return result
}

print(totalNQueens(4))
print(totalNQueens(1))