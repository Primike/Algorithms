# Determine if a 9 x 9 Sudoku board is valid. 
# Only the filled cells need to be validated according to the following rules:

# Each row must contain the digits 1-9 without repetition.
# Each column must contain the digits 1-9 without repetition.
# Each 3 x 3 sub-boxes must contain the digits 1-9, without repetition.

import collections

def isValidSudoku(board):
    columns = collections.defaultdict(set)
    rows = collections.defaultdict(set)
    squares = collections.defaultdict(set)

    for i in range(9):
        for j in range(9):
            if board[i][j] == ".":
                continue
            if (board[i][j] in rows[i] or
                board[i][j] in columns[j] or
                board[i][j] in squares[(i // 3, j // 3)]):
                return False
            
            columns[j].add(board[i][j])
            rows[i].add(board[i][j])
            squares[(i // 3, j // 3)].add(board[i][j])
    
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

