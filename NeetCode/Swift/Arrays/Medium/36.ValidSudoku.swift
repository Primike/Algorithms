//Determine if a 9 x 9 Sudoku board is valid. 
//Only the filled cells need to be validated according to the following rules:
//Each row must contain the digits 1-9 without repetition.
//Each column must contain the digits 1-9 without repetition.
//Each 3 x 3 sub-boxes must contain the digits 1-9, without repetition.

import collections

func isValidSudoku(_ board: [[Character]]) -> Bool {
    var rows = [Int: Set<Character>]()
    var cols = [Int: Set<Character>]()
    var boxes = [Int: Set<Character>]()
    
    for r in 0..<9 {
        for c in 0..<9 {
            let char = board[r][c]
            if char == "." {
                continue
            }
            
            if rows[r]?.contains(char) ?? false ||
                cols[c]?.contains(char) ?? false ||
                boxes[(r / 3) * 3 + c / 3]?.contains(char) ?? false {
                return false
            }
            
            rows[r, default: []].insert(char)
            cols[c, default: []].insert(char)
            boxes[(r / 3) * 3 + c / 3, default: []].insert(char)
        }
    }
    
    return true
}

print(isValidSudoku([["5","3",".",".","7",".",".",".","."]
                    ,["6",".",".","1","9","5",".",".","."]
                    ,[".","9","8",".",".",".",".","6","."]
                    ,["8",".",".",".","6",".",".",".","3"]
                    ,["4",".",".","8",".","3",".",".","1"]
                    ,["7",".",".",".","2",".",".",".","6"]
                    ,[".","6",".",".",".",".","2","8","."]
                    ,[".",".",".","4","1","9",".",".","5"]
                    ,[".",".",".",".","8",".",".","7","9"]]))

print(isValidSudoku([[".",".",".","9",".",".",".",".","."]
                    ,[".",".",".",".",".",".",".",".","."]
                    ,[".",".","3",".",".",".",".",".","1"]
                    ,[".",".",".",".",".",".",".",".","."]
                    ,["1",".",".",".",".",".","3",".","."]
                    ,[".",".",".",".","2",".","6",".","."]
                    ,[".","9",".",".",".",".",".","7","."]
                    ,[".",".",".",".",".",".",".",".","."]
                    ,["8",".",".","8",".",".",".",".","."]]))

