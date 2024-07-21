// You are given two arrays rowSum and colSum of non-negative integers 
// where rowSum[i] is the sum of the elements in the ith row and colSum[j] 
// is the sum of the elements of the jth column of a 2D matrix. 
// In other words, you do not know the elements of the matrix, 
// but you do know the sums of each row and column.
// Find any matrix of non-negative integers of size rowSum.length x colSum.length 
// that satisfies the rowSum and colSum requirements.
// Return a 2D array representing any matrix that fulfills the requirements. 
// It's guaranteed that at least one matrix that fulfills the requirements exists.

// Time: O(m * n), Space: O(m * n)
func restoreMatrix(_ rowSum: [Int], _ colSum: [Int]) -> [[Int]] {
    let rows = rowSum.count, cols = colSum.count
    var result = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    var colSum = colSum

    for i in 0..<rows {
        var current = rowSum[i]

        for j in 0..<cols {
            if colSum[j] >= current {
                colSum[j] -= current
                result[i][j] = current
                current = 0
            } else {
                result[i][j] = colSum[j]
                current -= colSum[j]
                colSum[j] = 0
            }
        }
    }

    return result
}

print(restoreMatrix([3,8], [4,7]))
print(restoreMatrix([5,7,10], [8,6,8]))