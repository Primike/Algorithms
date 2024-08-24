// Given a 2D array rooks of length n, where rooks[i] = [xi, yi] 
// indicates the position of a rook on an n x n chess board. 
// Your task is to move the rooks 1 cell at a time vertically or horizontally 
// (to an adjacent cell) such that the board becomes peaceful.
// A board is peaceful if there is exactly one rook in each row and each column.
// Return the minimum number of moves required to get a peaceful board.

func minMoves(_ rooks: [[Int]]) -> Int {
    var rooks = rooks
    var result = 0

    rooks.sort { $0[0] < $1[0] }

    for i in 0..<rooks.count {
        result += abs(i - rooks[i][0])
    }

    rooks.sort { $0[1] < $1[1] }

    for i in 0..<rooks.count {
        result += abs(i - rooks[i][1])
    }

    return result
}

print(minMoves([[0,0],[1,0],[1,1]]))
print(minMoves([[0,0],[0,1],[0,2],[0,3]]))