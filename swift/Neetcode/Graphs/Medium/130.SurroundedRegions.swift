// Given an m x n matrix board containing 'X' and 'O', 
// capture all regions that are 4-directionally surrounded by 'X'.

func solve(_ board: inout [[Character]]) {
    let rows = board.count, cols = board[0].count

    func capture(_ i: Int, _ j: Int) {
        if i < 0 || i >= rows || j < 0 || j >= cols || board[i][j] != "O" {
            return
        }

        board[i][j] = "T"

        capture(i + 1, j)
        capture(i - 1, j)
        capture(i, j + 1)
        capture(i, j - 1)
    }

    for i in 0..<rows {
        for j in 0..<cols {
            if board[i][j] == "O", (i == 0 || i == rows - 1 || j == 0 || j == cols - 1) {
                capture(i, j)
            }
        }
    }

    for i in 0..<rows {
        for j in 0..<cols {
            if board[i][j] == "O" {
                board[i][j] = "X"
            }
        }
    }

    for i in 0..<rows {
        for j in 0..<cols {
            if board[i][j] == "T" {
                board[i][j] = "O"
            }
        }
    }
}

print(solve([
    ["X","X","X","X"],
    ["X","O","O","X"],
    ["X","X","O","X"],
    ["X","O","X","X"]]))

print(solve([["X"]]))