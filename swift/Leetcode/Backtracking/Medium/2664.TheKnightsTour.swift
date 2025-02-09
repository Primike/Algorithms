// Given two positive integers m and n which are the height and width 
// of a 0-indexed 2D-array board, a pair of positive integers (r, c) 
// which is the starting position of the knight on the board.
// Your task is to find an order of movements for the knight, 
// in a manner that every cell of the board gets visited exactly once 
// (the starting cell is considered visited and you shouldn't visit it again).
// Return the array board in which the cells' values show the 
// order of visiting the cell starting from 0 (the initial place of the knight).

// Time: O(8^(m * n)), Space: O(m * n)
func tourOfKnight(_ m: Int, _ n: Int, _ r: Int, _ c: Int) -> [[Int]] {
    let directions = [(2, 1), (2, -1), (-2, 1), (-2, -1),
                        (1, 2), (1, -2), (-1, 2), (-1, -2),]
    var result = Array(repeating: Array(repeating: -1, count: n), count: m)
    result[r][c] = 0

    func backtrack(_ i: Int, _ j: Int, _ moves: Int) -> Bool {
        if moves == m * n { return true }

        for (di, dj) in directions {
            let x = i + di, y = j + dj

            if x < 0 || x >= m || y < 0 || y >= n { continue }
            if result[x][y] != -1 { continue }

            result[x][y] = moves
            if backtrack(x, y, moves + 1) { return true }
            result[x][y] = -1
        }

        return false
    }

    backtrack(r, c, 1)
    return result
}

print(tourOfKnight(1, 1, 0, 0))
print(tourOfKnight(3, 4, 0, 0))