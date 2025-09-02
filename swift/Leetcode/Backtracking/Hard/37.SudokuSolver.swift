class Solution {
    private let n = 3
    private var N = 9
    
    private var rows: [Set<Character>] = []
    private var columns: [Set<Character>] = []
    private var boxes: [Set<Character>] = []
    
    func solveSudoku(_ board: inout [[Character]]) {
        N = n * n
        rows = Array(repeating: Set<Character>(), count: N)
        columns = Array(repeating: Set<Character>(), count: N)
        boxes = Array(repeating: Set<Character>(), count: N)
        
        for r in 0..<N {
            for c in 0..<N {
                if board[r][c] != "." {
                    let digit = board[r][c]
                    placeNumber(digit, row: r, col: c, board: &board)
                }
            }
        }
        
        backtrack(row: 0, col: 0, board: &board)
    }
    
    private func boxIndex(row: Int, col: Int) -> Int {
        return (row / n) * n + (col / n)
    }

    private func canPlace(_ digit: Character, row: Int, col: Int) -> Bool {
        let boxIdx = boxIndex(row: row, col: col)
        return !rows[row].contains(digit) &&
               !columns[col].contains(digit) &&
               !boxes[boxIdx].contains(digit)
    }

    private func placeNumber(_ digit: Character, row: Int, col: Int, board: inout [[Character]]) {
        let boxIdx = boxIndex(row: row, col: col)
        rows[row].insert(digit)
        columns[col].insert(digit)
        boxes[boxIdx].insert(digit)
        board[row][col] = digit
    }

    private func removeNumber(_ digit: Character, row: Int, col: Int, board: inout [[Character]]) {
        let boxIdx = boxIndex(row: row, col: col)
        rows[row].remove(digit)
        columns[col].remove(digit)
        boxes[boxIdx].remove(digit)
        board[row][col] = "."
    }

    private func backtrack(row: Int, col: Int, board: inout [[Character]]) -> Bool {
        if row == N {
            return true
        }

        let (nextRow, nextCol) = (col == N - 1) ? (row + 1, 0) : (row, col + 1)

        if board[row][col] != "." {
            return backtrack(row: nextRow, col: nextCol, board: &board)
        }

        for digitChar in "123456789" {
            if canPlace(digitChar, row: row, col: col) {
                placeNumber(digitChar, row: row, col: col, board: &board)
                if backtrack(row: nextRow, col: nextCol, board: &board) {
                    return true
                }
                removeNumber(digitChar, row: row, col: col, board: &board)
            }
        }
        
        return false
    }
}