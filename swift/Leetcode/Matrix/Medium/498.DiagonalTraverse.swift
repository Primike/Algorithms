// Given an m x n matrix mat, return an array of all the 
// elements of the array in a diagonal order.

// Time: O(m * n), Space: O(1)
func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
    guard !mat.isEmpty, !mat[0].isEmpty else { return [] }
    
    let rows = mat.count, cols = mat[0].count
    var result = [Int]()
    var i = 0, j = 0
    var goingUp = true
    
    for _ in 0..<(rows * cols) {
        result.append(mat[i][j]) 

        if goingUp {
            if j == cols - 1 {      
                i += 1              
                goingUp = false     
            } else if i == 0 {      
                j += 1              
                goingUp = false     
            } else {                
                i -= 1
                j += 1
            }
        } else { 
            if i == rows - 1 {      
                j += 1              
                goingUp = true      
            } else if j == 0 {      
                i += 1              
                goingUp = true      
            } else {                
                i += 1
                j -= 1
            }
        }
    }

    return result
}

print(findDiagonalOrder([[1,2,3],[4,5,6],[7,8,9]]))
print(findDiagonalOrder([[1,2],[3,4]]))


func findDiagonalOrder2(_ mat: [[Int]]) -> [Int] {
    let rows = mat.count, cols = mat[0].count
    var result = [Int]()
    var r = 0, c = 0

    while r < rows, c < cols {
        var traversal = [Int]()
        var i = r, j = c

        while i >= 0, j < cols {
            traversal.append(mat[i][j])
            i -= 1
            j += 1
        }

        if (r + c) % 2 != 0 { traversal = Array(traversal.reversed()) }
        result += traversal

        if r == rows - 1 {
            c += 1
        } else {
            r += 1
        }
    }

    return result
}