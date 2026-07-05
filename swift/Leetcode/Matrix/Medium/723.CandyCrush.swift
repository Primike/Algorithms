class Solution {
    func candyCrush(_ board: [[Int]]) -> [[Int]] {
        var board = board
        let m = board.count
        let n = board[0].count

        func findAndCrush() -> Bool {
            var complete = true

            for r in 1..<(m - 1) {
                for c in 0..<n {
                    if board[r][c] == 0 { continue }
                    if abs(board[r][c]) == abs(board[r - 1][c]) && abs(board[r][c]) == abs(board[r + 1][c]) {
                        board[r][c] = -abs(board[r][c])
                        board[r - 1][c] = -abs(board[r - 1][c])
                        board[r + 1][c] = -abs(board[r + 1][c])
                        complete = false
                    }
                }
            }

            for r in 0..<m {
                for c in 1..<(n - 1) {
                    if board[r][c] == 0 { continue }
                    if abs(board[r][c]) == abs(board[r][c - 1]) && abs(board[r][c]) == abs(board[r][c + 1]) {
                        board[r][c] = -abs(board[r][c])
                        board[r][c - 1] = -abs(board[r][c - 1])
                        board[r][c + 1] = -abs(board[r][c + 1])
                        complete = false
                    }
                }
            }

            for r in 0..<m {
                for c in 0..<n {
                    if board[r][c] < 0 {
                        board[r][c] = 0
                    }
                }
            }
            
            return complete
        }

        func drop() {
            for c in 0..<n {
                var lowestZero = -1

                for r in stride(from: m - 1, through: 0, by: -1) {
                    if board[r][c] == 0 {
                        lowestZero = max(lowestZero, r)
                    } else if lowestZero >= 0 {
                        let temp = board[r][c]
                        board[r][c] = board[lowestZero][c]
                        board[lowestZero][c] = temp
                        lowestZero -= 1
                    }
                }
            }
        }

        while !findAndCrush() {
            drop()
        }

        return board
    }
}