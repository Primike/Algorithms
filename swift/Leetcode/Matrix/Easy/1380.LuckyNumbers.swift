// Given an m x n matrix of distinct numbers, 
// return all lucky numbers in the matrix in any order.
// A lucky number is an element of the matrix such that 
// it is the minimum element in its row and maximum in its column.

// Time: O(m * n), Space: O(m + n)
func luckyNumbers (_ matrix: [[Int]]) -> [Int] {
    let rows = matrix.count, cols = matrix[0].count
    var rowMinimums = Array(repeating: Int.max, count: rows)
    var colMaximums = Array(repeating: Int.min, count: cols)

    for i in 0..<rows {
        rowMinimums[i] = matrix[i].min() ?? 0

        for j in 0..<cols {
            colMaximums[j] = max(colMaximums[j], matrix[i][j])
        }
    }

    var result = [Int]()

    for i in 0..<rows {
        for j in 0..<cols {
            if rowMinimums[i] == matrix[i][j], colMaximums[j] == matrix[i][j] { 
                result.append(matrix[i][j]) 
            }
        }
    }
    
    return result
}

print(luckyNumbers([[3,7,8],[9,11,13],[15,16,17]]))
print(luckyNumbers([[1,10,4,2],[9,3,8,7],[15,16,17,12]]))
print(luckyNumbers([[7,8],[1,2]]))