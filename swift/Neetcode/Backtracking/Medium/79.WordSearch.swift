// Given an m x n grid of characters board and a string word, 
// return true if word exists in the grid.

// Time: O(n * m * 4^n), Space: O(n + m)
func exist(_ board: [[Character]], _ word: String) -> Bool {
    let word = Array(word)
    let rows = board.count, cols = board[0].count
    var visited = Set<String>()

    func dfs(_ i: Int, _ j: Int, _ k: Int) -> Bool {
        let key = "\(i),\(j)"

        if k == word.count { return true }
        if i < 0 || i >= rows || j < 0 || j >= cols { return false }
        if board[i][j] != word[k] || visited.contains(key) { return false }

        visited.insert(key)
        let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]
    
        for (di, dj) in directions {
            if dfs(di, dj, k + 1) { return true }
        }

        visited.remove(key)
        return false
    }

    for i in 0..<rows {
        for j in 0..<cols {
            if dfs(i, j, 0) { return true }
            visited = [] 
        }
    }

    return false 
}

print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"))
print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE"))
print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB"))