// Given an m x n grid of characters board and a string word, 
// return true if word exists in the grid.

func exist(_ board: [[Character]], _ word: String) -> Bool {
    var board = board
    let word = Array(word)
    let rows = board.count, cols = board[0].count

    func dfs(_ i: Int, _ j: Int, _ n: Int) -> Bool {
        if n == word.count { return true }

        if i < 0 || i >= rows || j < 0 || j >= cols || board[i][j] != word[n] {
            return false
        }

        let letter = board[i][j]
        board[i][j] = "*" 
        let result = dfs(i + 1, j, n + 1) || dfs(i - 1, j, n + 1) || dfs(i, j + 1, n + 1) || dfs(i, j - 1, n + 1)
        board[i][j] = letter 

        return result
    }

    for i in 0..<rows {
        for j in 0..<cols {
            if dfs(i, j, 0) { return true }
        }
    }

    return false
}