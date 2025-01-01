// On an 2 x 3 board, there are five tiles labeled from 1 to 5, 
// and an empty square represented by 0. A move consists of 
// choosing 0 and a 4-directionally adjacent number and swapping it.
// The state of the board is solved if and only if the board is [[1,2,3],[4,5,0]].
// Given the puzzle board board, return the least number of moves 
// required so that the state of the board is solved. 
// If it is impossible for the state of the board to be solved, return -1.

func slidingPuzzle(_ board: [[Int]]) -> Int {
    let directions = [
        [1, 3],
        [0, 2, 4],
        [1, 5],
        [0, 4],
        [3, 5, 1],
        [4, 2]
    ]
    
    func swap(_ s: String, _ i: Int, _ j: Int) -> String {
        var chars = Array(s)
        chars.swapAt(i, j)
        return String(chars)
    }
    
    let startState = board.flatMap { $0 }.map(String.init).joined()
    var visited: [String: Int] = [:]
    
    func dfs(_ state: String, _ zeroPos: Int, _ moves: Int) {
        if let prevMoves = visited[state], prevMoves <= moves { return }
        
        visited[state] = moves

        for nextPos in directions[zeroPos] {
            let newState = swap(state, zeroPos, nextPos)
            dfs(newState, nextPos, moves + 1)
        }
    }
    
    dfs(startState, startState.firstIndex(of: "0")!.utf16Offset(in: startState), 0)
    return visited["123450", default: -1]
}

print(slidingPuzzle([[1,2,3],[4,0,5]]))
print(slidingPuzzle([[1,2,3],[5,4,0]]))
print(slidingPuzzle([[4,1,2],[5,0,3]]))