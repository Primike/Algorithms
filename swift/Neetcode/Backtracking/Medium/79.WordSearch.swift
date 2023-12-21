// Given an m x n grid of characters board and a string word, 
// return true if word exists in the grid.

// Time: n^2 * m^2, Space: n + m + w
func exist(_ board: [[Character]], _ word: String) -> Bool {
    let rows = board.count, cols = board[0].count
    var board = board
    let word = Array(word)

    func dfs(_ i: Int, _ j: Int, _ n: Int) -> Bool {
        if n == word.count { return true }

        if i < 0 || i >= rows || j < 0 || j >= cols || board[i][j] != word[n] {
            return false
        }

        let letter = board[i][j]
        board[i][j] = "*" 
        let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]

        for (di, dj) in directions {
            if dfs(di, dj, n + 1) { return true } 
        }

        board[i][j] = letter 
        return false
    }

    for i in 0..<rows {
        for j in 0..<cols {
            if dfs(i, j, 0) { return true }
        }
    }

    return false
}