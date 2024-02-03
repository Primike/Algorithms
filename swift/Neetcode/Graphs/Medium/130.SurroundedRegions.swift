// Given an m x n matrix board containing 'X' and 'O', 
// capture all regions that are 4-directionally surrounded by 'X'.

// Time: O(m * n), Space: O(1)
func solve(_ board: inout [[Character]]) {
    let rows = board.count, cols = board[0].count

    func dfs(_ i: Int, _ j: Int) {
        if i < 0 || i >= rows || j < 0 || j >= cols { return }
        if board[i][j] != "O" { return }

        board[i][j] = "T"
        let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]

        for (di, dj) in directions {
            dfs(di, dj)
        }
    }

    for i in 0..<rows {
        dfs(i, 0)
        dfs(i, cols - 1)
    }

    for j in 0..<cols {
        dfs(0, j)
        dfs(rows - 1, j)
    }

    for i in 0..<rows {
        for j in 0..<cols {
            if board[i][j] == "O" {
                board[i][j] = "X"
            } else if board[i][j] == "T" {
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



func solve(_ board: inout [[Character]]) {
    var rows = board.count, cols = board[0].count
    var skipSet = Set<String>()

    func dfs(_ i: Int, _ j: Int) {
        if i < 0 || i >= rows || j < 0 || j >= cols || board[i][j] == "X" || skipSet.contains("\(i),\(j)") {
            return
        }

        skipSet.insert("\(i),\(j)")
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        for (di, dj) in directions {
            dfs(i + di, j + dj)
        }
    }

    for i in 0..<cols {
        if board[0][i] == "O" { dfs(0, i) }
        if board[rows - 1][i] == "O" { dfs(rows - 1, i) }
    }

    for i in 0..<rows {
        if board[i][0] == "O" { dfs(i, 0) } 
        if board[i][cols - 1] == "O" { dfs(i, cols - 1) } 
    }

    for i in 0..<rows {
        for j in 0..<cols {
            if board[i][j] == "O", !skipSet.contains("\(i),\(j)") {
                board[i][j] = "X"
            }
        }
    }
}