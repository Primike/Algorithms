// Assume the following rules are for the tic-tac-toe game 
// on an n x n board between two players:
// A move is guaranteed to be valid and is placed on an empty block.
// Once a winning condition is reached, no more moves are allowed.
// A player who succeeds in placing n of their marks in a horizontal, 
// vertical, or diagonal row wins the game.

// Time: O(1), Space: O(n)
class TicTacToe {

    private let n: Int
    private var player1Dict: [String: Int]
    private var player2Dict: [String: Int]

    init(_ n: Int) {
        self.n = n
        self.player1Dict = [:]
        self.player2Dict = [:]
    }
    
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        var dict = player == 1 ? player1Dict : player2Dict

        dict["row\(row)", default: 0] += 1
        if dict["row\(row)"]! == n { return player }
        dict["col\(col)", default: 0] += 1
        if dict["col\(col)"]! == n { return player }

        if row == col {
            dict["positive", default: 0] += 1
            if dict["positive", default: 0] == n { return player }
        }

        if col == n - 1 - row {
            dict["negative", default: 0] += 1
            if dict["negative", default: 0] == n { return player }
        }

        if player == 1 { player1Dict = dict }
        if player == 2 { player2Dict = dict }

        return 0
    }
}