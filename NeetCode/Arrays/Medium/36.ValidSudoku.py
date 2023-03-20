# Determine if a 9 x 9 Sudoku board is valid. 
# Only the filled cells need to be validated according to the following rules:
# Each row must contain the digits 1-9 without repetition.
# Each column must contain the digits 1-9 without repetition.
# Each 3 x 3 sub-boxes must contain the digits 1-9, without repetition.

import collections

def isValidSudoku(board):
    rows = collections.defaultdict(set)
    cols = collections.defaultdict(set)
    boxes = collections.defaultdict(set)

    for r in range(9):
        for c in range(9):
            if board[r][c] == ".":
                continue
            if (board[r][c] in rows[r] or 
                board[r][c] in cols[c] or
                board[r][c] in boxes[(r//3, c//3)]):
                return False
            
            cols[c].add(board[r][c])
            rows[r].add(board[r][c])
            boxes[(r//3, c//3)].add(board[r][c])

    return True
            

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

