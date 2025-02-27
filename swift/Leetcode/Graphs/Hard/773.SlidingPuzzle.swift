// On an 2 x 3 board, there are five tiles labeled from 1 to 5, 
// and an empty square represented by 0. A move consists of 
// choosing 0 and a 4-directionally adjacent number and swapping it.
// The state of the board is solved if and only if the board is [[1,2,3],[4,5,0]].
// Given the puzzle board board, return the least number of moves 
// required so that the state of the board is solved. 
// If it is impossible for the state of the board to be solved, return -1.

// Time: O(n!), Space: O(n!)
func slidingPuzzle(_ board: [[Int]]) -> Int {
    let rows = board.count, cols = board[0].count
    var start = (0, 0)

    for i in 0..<rows {
        for j in 0..<cols {
            if board[i][j] == 0 { start = (i, j) }
        }
    }

    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    let target = [[1, 2, 3], [4, 5, 0]]
    var board = board
    var memo = [[[Int]]: Int]()
    
    func dfs(_ i: Int, _ j: Int, _ moves: Int) -> Int {
        if board == target { return moves }
        if let value = memo[board], value <= moves { return Int.max }

        memo[board] = moves
        var result = Int.max

        for (di, dj) in directions {
            let r = i + di, c = j + dj

            if r < 0 || r >= rows || c < 0 || c >= cols { continue }

            (board[i][j], board[r][c]) = (board[r][c], board[i][j])
            result = min(result, dfs(r, c, moves + 1))
            (board[i][j], board[r][c]) = (board[r][c], board[i][j])
        }

        return result
    }
    
    let result = dfs(start.0, start.1, 0)
    return result == Int.max ? -1 : result
}

print(slidingPuzzle([[1,2,3],[4,0,5]]))
print(slidingPuzzle([[1,2,3],[5,4,0]]))
print(slidingPuzzle([[4,1,2],[5,0,3]]))