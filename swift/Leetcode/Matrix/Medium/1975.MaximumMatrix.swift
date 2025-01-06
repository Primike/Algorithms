// You are given an n x n integer matrix. 
// You can do the following operation any number of times:
// Choose any two adjacent elements of matrix and multiply each of them by -1.
// Two elements are considered adjacent if and only if they share a border.
// Your goal is to maximize the summation of the matrix's elements. 
// Return the maximum sum of the matrix's elements using 
// the operation mentioned above.

func maxMatrixSum(_ matrix: [[Int]]) -> Int {
    var total = 0
    var minimum = Int.max
    var count = 0

    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            total += abs(matrix[i][j])
            minimum = min(minimum, abs(matrix[i][j]))

            if matrix[i][j] < 0 { count += 1 }
        }
    }

    return count % 2 == 0 ? total : total - (2 * minimum)
}

print(maxMatrixSum([[1,-1],[-1,1]]))
print(maxMatrixSum([[1,2,3],[-1,-2,-3],[1,2,3]]))