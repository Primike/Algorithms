// You are given an n x n 2D matrix representing an image, 
// rotate the image by 90 degrees (clockwise).

func rotate(_ matrix: inout [[Int]]) {
    for i in 0..<matrix.count {
        for j in i..<matrix.count {
            let temp = matrix[i][j]
            matrix[i][j] = matrix[j][i]
            matrix[j][i] = temp
        }
    }

    for i in 0..<matrix.count {
        matrix[i].reverse()
    }
}

print(rotate([[1,2,3],[4,5,6],[7,8,9]]))
print(rotate([[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]))