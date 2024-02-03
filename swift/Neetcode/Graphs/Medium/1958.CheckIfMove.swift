// Given two integers rMove and cMove and a character color representing the color 
// you are playing as (white or black), return true if changing cell (rMove, cMove) 
// to color color is a legal move, or false if it is not legal.

// Time: O(n), Space: O(n)
func checkMove(_ board: [[Character]], _ rMove: Int, _ cMove: Int, _ color: Character) -> Bool {
    let rows = board.count, cols = board[0].count

    func checkLegal(_ i: Int, _ j: Int, _ dr: (Int, Int), _ count: Int) -> Bool {
        if i < 0 || i >= rows || j < 0 || j >= cols { return false }
        if board[i][j] == "." { return false }
        if board[i][j] == color { return count >= 2 }

        return checkLegal(i + dr.0, j + dr.1, dr, count + 1)
    }

    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (1, -1), (-1, 1), (-1, -1)]

    for (di, dj) in directions {
        if checkLegal(rMove + di, cMove + dj, (di, dj), 1) { return true }
    }

    return false
}

print(checkMove(
    [[".",".",".","B",".",".",".","."],
    [".",".",".","W",".",".",".","."],
    [".",".",".","W",".",".",".","."],
    [".",".",".","W",".",".",".","."],
    ["W","B","B",".","W","W","W","B"],
    [".",".",".","B",".",".",".","."],
    [".",".",".","B",".",".",".","."],
    [".",".",".","W",".",".",".","."]], 4, 3, "B"))
print(checkMove(
    [[".",".",".",".",".",".",".","."],
    [".","B",".",".","W",".",".","."],
    [".",".","W",".",".",".",".","."],
    [".",".",".","W","B",".",".","."],
    [".",".",".",".",".",".",".","."],
    [".",".",".",".","B","W",".","."],
    [".",".",".",".",".",".","W","."],
    [".",".",".",".",".",".",".","B"]], 4, 4, "W"))


func checkMove2(_ board: [[Character]], _ rMove: Int, _ cMove: Int, _ color: Character) -> Bool {
    var rows = board.count, cols = board[0].count 
    
    func dfs(_ dr: (Int, Int)) -> Bool {
        let (dx, dy) = dr
        var row = rMove + dx, col = cMove + dy
        var count = 1

        while 0 <= row, row < rows, 0 <= col, col < cols {
            count += 1
            if board[row][col] == "." { return false }
            if board[row][col] == color { return count >= 3 }

            row = row + dx
            col = col + dy
        }

        return false
    }

    let paths = [(1, 0), (-1, 0), (0, 1), (0, -1), (-1, -1), (-1, 1), (1, 1), (1, -1)] 

    for path in paths {
        if dfs(path) { return true }
    }

    return false
}